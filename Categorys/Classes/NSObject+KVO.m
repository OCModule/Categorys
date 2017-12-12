//
//  NSObject+KVO.m
//  Categorys
//
//  Created by Steve on 11/12/2017.
//

#import "NSObject+KVO.h"
#import <objc/runtime.h>
#import <objc/message.h>

NSString *const kKVOClassPrefix = @"KVOClassPrefix_";
NSString *const kKVOAssociatedObservers = @"KVOAssociatedObservers";

#pragma mark - ObservationInfo
@interface ObservationInfo : NSObject

@property (nonatomic, weak) NSObject *observer;
@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) ObservingBlock block;

@end

@implementation ObservationInfo

- (instancetype)initWithObserver:(NSObject *)observer Key:(NSString *)key block:(ObservingBlock)block
{
    self = [super init];
    if (self) {
        _observer = observer;
        _key = key;
        _block = block;
    }
    return self;
}

@end


#pragma mark - Debug Help Methods

static NSArray *classMethodNames(Class class) {
    NSMutableArray *array = [NSMutableArray array];
    unsigned int methodCount = 0;
    Method *methodList = class_copyMethodList(class, &methodCount);
    unsigned int i;
    for(i = 0; i < methodCount; i++) {
        [array addObject: NSStringFromSelector(method_getName(methodList[i]))];
    }
    free(methodList);
    return array;
}


static void printDescription(NSString *name, id obj) {
    NSString *str = [
                     NSString stringWithFormat:
                     @"%@: %@\n\tNSObject class %s\n\tRuntime class %s\n\timplements methods <%@>\n\n",
                     name,
                     obj,
                     class_getName([obj class]),
                     class_getName(object_getClass(obj)),
                     [classMethodNames(object_getClass(obj)) componentsJoinedByString:@", "]
                     ];
    printf("%s\n", [str UTF8String]);
}

#pragma mark - Helpers

static NSString * getter4Setter(NSString *setter) {
    if (setter.length <=0 || ![setter hasPrefix:@"set"] || ![setter hasSuffix:@":"]) {
        return nil;
    }
    // remove 'set' at the begining and ':' at the end
    NSRange range = NSMakeRange(3, setter.length - 4);
    NSString *key = [setter substringWithRange:range];
    // lower case the first letter
    NSString *firstLetter = [[key substringToIndex:1] lowercaseString];
    key = [key stringByReplacingCharactersInRange:NSMakeRange(0, 1)
                                       withString:firstLetter];
    return key;
}


static NSString * setter4Getter(NSString *getter) {
    if (getter.length <= 0) {
        return nil;
    }
    // upper case the first letter
    NSString *firstLetter = [[getter substringToIndex:1] uppercaseString];
    NSString *remainingLetters = [getter substringFromIndex:1];
    // add 'set' at the begining and ':' at the end
    NSString *setter = [NSString stringWithFormat:@"set%@%@:", firstLetter, remainingLetters];
    return setter;
}

static Class kvo_class(id self, SEL _cmd)
{
    return class_getSuperclass(object_getClass(self));
}

#pragma mark - Overridden Methods

static void kvo_setter(id self, SEL _cmd, id newValue) {
    NSString *setterName = NSStringFromSelector(_cmd);
    NSString *getterName = getter4Setter(setterName);
    if (!getterName) {
        NSString *reason = [NSString stringWithFormat:@"Object %@ does not have setter %@", self, setterName];
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                       reason:reason
                                     userInfo:nil];
        return;
    }
    id oldValue = [self valueForKey:getterName];
    struct objc_super superclass = {
        .receiver = self,
        .super_class = class_getSuperclass(object_getClass(self))
    };
    // cast our pointer so the compiler won't complain
    void (*objc_msgSendSuperCasted)(void *, SEL, id) = (void *)objc_msgSendSuper;
    // call super's setter, which is original class's setter method
    objc_msgSendSuperCasted(&superclass, _cmd, newValue);
    // look up observers and call the blocks
    NSMutableArray *observers = objc_getAssociatedObject(self, (__bridge const void *)(kKVOAssociatedObservers));
    for (ObservationInfo *each in observers) {
        if (nil == each.observer) { // auto remove observers
            [observers removeObject:each];
            return;
        }
        if ([each.key isEqualToString:getterName]) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                each.block(self, getterName, oldValue, newValue);
            });
        }
    }
}

@implementation NSObject (KVO)

- (void)cs_addObserver:(NSObject *)observer
                forKey:(NSString *)key
             withBlock:(ObservingBlock)block {
    SEL setterSelector = NSSelectorFromString(setter4Getter(key));
    Method setterMethod = class_getInstanceMethod([self class], setterSelector);
    if (!setterMethod) {
        NSString *reason = [NSString stringWithFormat:@"Object %@ does not have a setter for key %@", self, key];
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                       reason:reason
                                     userInfo:nil];
        return;
    }
    Class class = object_getClass(self);
    NSString *className = NSStringFromClass(class);
    // if not an KVO class yet
    if (![className hasPrefix: kKVOClassPrefix]) {
        class = [self makeKvoClassWithOriginalClassName:className];
        object_setClass(self, class);
    }
    // add our kvo setter if this class (not superclasses) doesn't implement the setter?
    if (![self hasSelector:setterSelector]) {
        const char *types = method_getTypeEncoding(setterMethod);
        class_addMethod(class, setterSelector, (IMP)kvo_setter, types);
    }
    printDescription(@"test", class);
    ObservationInfo *info = [[ObservationInfo alloc] initWithObserver:observer Key:key block:block];
    NSMutableArray *observers = objc_getAssociatedObject(self, (__bridge const void *)(kKVOAssociatedObservers));
    if (!observers) {
        observers = [NSMutableArray array];
        objc_setAssociatedObject(self, (__bridge const void *)(kKVOAssociatedObservers), observers, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [observers addObject:info];
}


/**
 Remove observer (opational)

 @param observer the observer
 @param key the key
 */
- (void)cs_removeObserver:(NSObject *)observer forKey:(NSString *)key {
    NSMutableArray* observers = objc_getAssociatedObject(self, (__bridge const void *)(kKVOAssociatedObservers));
    ObservationInfo *infoToRemove;
    for (ObservationInfo* info in observers) {
        if (info.observer == observer && [info.key isEqual:key]) {
            infoToRemove = info;
            break;
        }
    }
    [observers removeObject:infoToRemove];
}

- (Class)makeKvoClassWithOriginalClassName:(NSString *)originalClassName
{
    NSString *kvoClassName = [kKVOClassPrefix stringByAppendingString:originalClassName];
    Class class = NSClassFromString(kvoClassName);
    if (class) {
        return class;
    }
    // class doesn't exist yet, make it
    Class originalClass = object_getClass(self);
    Class kvoClass = objc_allocateClassPair(originalClass, kvoClassName.UTF8String, 0);
    // grab class method's signature so we can borrow it
    Method classMethod = class_getInstanceMethod(originalClass, @selector(class));
    const char *types = method_getTypeEncoding(classMethod);
    class_addMethod(kvoClass, @selector(class), (IMP)kvo_class, types);
    objc_registerClassPair(kvoClass);
    return kvoClass;
}

- (BOOL)hasSelector:(SEL)selector
{
    Class class = object_getClass(self);
    unsigned int methodCount = 0;
    Method* methodList = class_copyMethodList(class, &methodCount);
    for (unsigned int i = 0; i < methodCount; i++) {
        SEL thisSelector = method_getName(methodList[i]);
        if (thisSelector == selector) {
            free(methodList);
            return YES;
        }
    }
    free(methodList);
    return NO;
}

@end
