//
//  NotificationViewController.m
//  designMode
//
//  Created by zzy on 2023/8/2.
//

#import "NotificationViewController.h"

@interface NotificationViewController ()

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //接收参数的地方接收通知，注册观察者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Notification:) name:@"temp" object:nil];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:NO completion:nil];
}
- (void)Notification:(NSNotification *)notification {
    NSString * messgae = notification.userInfo[@"content"];
    NSLog(@"%@", messgae);
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"temp" object:nil];
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
