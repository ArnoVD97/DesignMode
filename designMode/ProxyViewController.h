//
//  ProxyViewController.h
//  designMode
//
//  Created by zzy on 2023/8/3.
//

#import "ViewController.h"
#import "DelegateViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface ProxyViewController : ViewController<delegateTest>
@property (nonatomic, strong) DelegateViewController *delegateViewController;


@end

NS_ASSUME_NONNULL_END
