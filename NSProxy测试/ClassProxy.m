//
//  ClassProxy.m
//  NSProxy测试
//
//  Created by 翟旭博 on 2023/5/9.
//

#import "ClassProxy.h"
#import "objc/runtime.h"
@interface ClassProxy()
@property (nonatomic, strong) NSMutableArray *targetArray; // 多个 targets 皆可代理
@property (nonatomic, strong) NSMutableDictionary *methodDic;
@property (nonatomic, strong) id target;
@end
@implementation ClassProxy
- (void)target:(id)target {
    self.target = target;
}
- (void)handleTargets:(NSArray *)targets {
    self.methodDic = [NSMutableDictionary dictionary];
    for (int i = 0; i < targets.count; i++) {
        [self registMethodWithTarget:targets[i]];
    }
}
- (void)registMethodWithTarget:(id)target {
    unsigned int countOfMethods = 0;
    Method *method_list = class_copyMethodList([target class], &countOfMethods);
    for (int i = 0; i < countOfMethods; i++) {
        Method method = method_list[i];
        // 得到方法的符号
        SEL sel = method_getName(method);
        // 得到方法的符号字符串
        const char *sel_name = sel_getName(sel);
        // 得到方法的名字
        NSString *method_name = [NSString stringWithUTF8String:sel_name];
        self.methodDic[method_name] = target;
    }
    free(method_list);
}
- (void)forwardInvocation:(NSInvocation *)invocation {
    SEL sel = invocation.selector;
    NSString *methodName = NSStringFromSelector(sel);
    id target = self.methodDic[methodName];
    if (target) {
        [invocation invokeWithTarget:target];
    } else {
        [super forwardInvocation:invocation];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    NSMethodSignature *Method;
    NSString *methodName = NSStringFromSelector(sel);
    id target = self.methodDic[methodName];
    if (target) {
        Method = [target methodSignatureForSelector:sel];
    } else {
        Method = [super methodSignatureForSelector:sel];
    }
    return Method;
}

@end
