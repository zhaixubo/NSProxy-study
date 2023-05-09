//
//  WeakProxy.m
//  NSProxy测试
//
//  Created by 翟旭博 on 2023/5/9.
//

#import "WeakProxy.h"
@interface WeakProxy ()
@property (nonatomic, weak) id target;
@end
@implementation WeakProxy
+ (instancetype)proxyWithTarget:(id)target {
    return [[self alloc] initWithTarget:target];
}

- (instancetype)initWithTarget:(id)target {
    self.target = target;
    return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    SEL sel = invocation.selector;
    if ([self.target respondsToSelector:sel]) {
        [invocation invokeWithTarget:self.target];
    }
}
@end
