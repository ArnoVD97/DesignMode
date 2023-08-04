//
//  DelegateViewController.h
//  designMode
//
//  Created by zzy on 2023/8/3.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN
@protocol delegateTest <NSObject>

- (NSString *)valueChange:(NSString *)name;


@end
@interface DelegateViewController : ViewController
@property (nonatomic, strong) UILabel *testLabel;
@property (nonatomic, weak) id<delegateTest> delegate;
@end

NS_ASSUME_NONNULL_END
