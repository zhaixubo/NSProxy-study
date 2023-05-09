//
//  main.m
//  NSProxy测试
//
//  Created by 翟旭博 on 2023/5/9.
//

#import <Foundation/Foundation.h>
#import "ClassA.h"
#import "ClassB.h"
#import "ClassProxy.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //模拟多重继承
        ClassA *classA = [[ClassA alloc] init];
        ClassB *classB = [[ClassB alloc] init];
        ClassProxy *classProxy = [ClassProxy alloc];
        
        [classProxy handleTargets:@[classA, classB]];
        [classProxy performSelector:@selector(infoA)];
        [classProxy performSelector:@selector(infoB)];
        

    }
    return 0;
}
