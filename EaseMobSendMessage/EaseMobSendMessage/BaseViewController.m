//
//  BaseViewController.m
//  EaseMobSendMessage
//
//  Created by yang on 2018/3/1.
//  Copyright © 2018年 223studio. All rights reserved.
//

#import "BaseViewController.h"
#import <Masonry.h>

@interface BaseViewController ()
{
    UITableView *_tbView;
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.left.offset(0);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UITableView *)tableView
{
    if(!_tbView){
        _tbView = [[UITableView alloc] init];
    }
    return _tbView;
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
