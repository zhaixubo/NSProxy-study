//
//  HaveNSTimer.m
//  NSProxy测试
//
//  Created by 翟旭博 on 2023/5/9.
//

#import "HaveNSTimer.h"

@implementation HaveNSTimer
- (void)test {
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timeOut:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
- (void)timeOut:(NSTimer *)timer {
    NSLog(@"1");
}
@end
