//
//  ClassProxy.h
//  NSProxy测试
//
//  Created by 翟旭博 on 2023/5/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ClassProxy : NSProxy
@property(nonatomic, strong, readonly) NSMutableArray *targetArray;

- (void)target:(id)target;
- (void)handleTargets:(NSArray *)targets;
- (void)registMethodWithTarget:(id)target;
@end

NS_ASSUME_NONNULL_END
