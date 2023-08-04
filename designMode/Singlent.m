//
//  Singlent.m
//  designMode
//
//  Created by zzy on 2023/8/2.
//

#import "Singlent.h"
static id singlent = nil;
static id manager = nil;
@implementation Singlent
//懒汉式
+ (instancetype)Singlent {
    if(!singlent) {
        @synchronized (self) {
            if(singlent == nil) {
                singlent = [[super allocWithZone:NULL] init];
                
            }
        }
    }
 
    return singlent;
}
//第一次if(!manager)判断是为了避免在对象创建后多次访问导致的多次加锁，浪费性能。第二次if(!manager)判断就是判断此时单例是否存在，不存在就重新创建。
+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[super allocWithZone:NULL] init];
    });
    return manager;
}


@end
