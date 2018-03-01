//
//  ChooseMessageViewController.m
//  EaseMobSendMessage
//
//  Created by yang on 2018/3/1.
//  Copyright © 2018年 223studio. All rights reserved.
//

#import "ChooseMessageViewController.h"
#import "ChooseReceiverViewController.h"

@interface ChooseMessageViewController ()

@end

@implementation ChooseMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"选择发送消息";
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(nextStep:)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}
- (void)nextStep:(id)sender {
    
    ChooseReceiverViewController *chooseReceiverVC = [[ChooseReceiverViewController alloc] init];
    [self.navigationController pushViewController:chooseReceiverVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
