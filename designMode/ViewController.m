//
//  ViewController.m
//  designMode
//
//  Created by zzy on 2023/8/2.
//

#import "ViewController.h"
#import "NotificationViewController.h"

@interface ViewController ()
@property(nonatomic, strong)UITextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    _textField = [[UITextField alloc] init];
    _textField.text = @"arno";
    NSLog(@"%@",_textField.text);

    NSNotification *notice = [NSNotification notificationWithName:@"send" object:self userInfo:@{@"name":_textField.text,@"pass":_textField.text}];
    [[NSNotificationCenter defaultCenter] postNotification:notice];

    //在传递参数的地方发送通知给通知中心，发布通知
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"temp" object:nil userInfo:@{@"content": self.textField.text}];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(test) name:@"NotificationName" object:nil];
//    NSLog(@"--currect thread:%@", [NSThread currentThread]);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"--currect thread:%@", [NSThread currentThread]);
//    NSLog(@"Begin post notification");
    NotificationViewController *noti = [NotificationViewController new];
    [self presentViewController:noti animated:NO completion:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"temp" object:nil userInfo:@{@"content": _textField.text}];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NotificationName" object:nil];

//    NSLog(@"End");
}

- (void)test {
    dispatch_queue_t queue = dispatch_queue_create("test.queue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        NSLog(@"--currect thread:%@", [NSThread currentThread]);
        NSLog(@"Handle notification and sleep 3s");
        sleep(3);
        NSLog(@"Test End");
    });
}
/*
 - (void)viewDidLoad {
     [super viewDidLoad];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(test) name:@"NotificationName" object:nil];
 }

 - (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
     NSLog(@"--current thread:%@", [NSThread currentThread]);
     NSLog(@"Begin post notification");
     NSNotification *notification = [NSNotification notificationWithName:@"NotificationName" object:nil];
     [[NSNotificationQueue defaultQueue] enqueueNotification:notification postingStyle:NSPostASAP];
     NSLog(@"End");
 }

 - (void)test {
     NSLog(@"--current thread:%@", [NSThread currentThread]);
     NSLog(@"Handle notification and sleep 3s");
     sleep(3);
     NSLog(@"Test End");
 }

 */
@end
