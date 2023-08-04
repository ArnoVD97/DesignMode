//
//  ProxyViewController.m
//  designMode
//
//  Created by zzy on 2023/8/3.
//

#import "ProxyViewController.h"

@interface ProxyViewController ()
@property (nonatomic, strong) NSString *name;
@end

@implementation ProxyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegateViewController = [DelegateViewController new];
    self.delegateViewController.delegate = self;
    self.view.backgroundColor = [UIColor blueColor];
    [self.delegateViewController.delegate valueChange:_name];
}

- (NSString *)valueChange:(NSString *)name {
    _name = [[NSString alloc] init];
    _name = name;
    NSString *arno = [NSString stringWithFormat:@"arno"];
    NSLog(@"%@", arno);
    NSLog(@"%@", _name);
    return arno;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
