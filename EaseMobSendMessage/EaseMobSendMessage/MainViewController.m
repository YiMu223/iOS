//
//  ViewController.m
//  EaseMobSendMessage
//
//  Created by yang on 2018/3/1.
//  Copyright © 2018年 223studio. All rights reserved.
//

#import "MainViewController.h"
#import "ChooseSenderViewController.h"
#import <Masonry.h>

@interface MainViewController ()
@property (nonatomic,strong) UILabel *tipsLab;
@property (nonatomic,strong) UITextView *tipsTV;
@property (nonatomic,strong) UIButton *startBtn;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Main";
    
    [self.view addSubview:self.tipsLab];
    [self.tipsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(100);
        make.left.offset(40);
        make.right.offset(-40);
        make.height.equalTo(@40);
    }];
    
    [self.view addSubview:self.tipsTV];
    [self.tipsTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tipsLab.mas_bottom).offset(10);
        make.left.offset(40);
        make.right.offset(-40);
        make.bottom.offset(-200);
    }];
    
    [self.view addSubview:self.startBtn];
    [self.startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tipsTV.mas_bottom).offset(20);
        make.left.offset(40);
        make.right.offset(-40);
        make.height.equalTo(@40);
    }];
    
}

- (UILabel *)tipsLab {
    
    if(!_tipsLab){
        _tipsLab = [[UILabel alloc] init];
        _tipsLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:18];
        _tipsLab.textAlignment = NSTextAlignmentCenter;
        _tipsLab.text = @"操作步骤如下";
    }
    return _tipsLab;
}
- (UITextView *)tipsTV {
    if(!_tipsTV){
        _tipsTV = [[UITextView alloc] init];
        _tipsTV.layer.borderWidth = 1;
        _tipsTV.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _tipsTV.layer.cornerRadius = 10;
        _tipsTV.font = [UIFont fontWithName:@"PingFangSC-Regular" size:18];
        _tipsTV.text = @"1.选择发送人\n2.选择发送的消息\n3.选择接受人或群组\n4.确认发送";
    }
    return _tipsTV;
}

- (UIButton *)startBtn {
    
    if(!_startBtn) {
        _startBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _startBtn.layer.borderWidth = 1;
        _startBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _startBtn.layer.cornerRadius = 10;
        [_startBtn setTitle:@"开始" forState:UIControlStateNormal];
        [_startBtn addTarget:self action:@selector(startBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startBtn;
}
- (void)startBtnAction:(id)sender {
    
    ChooseSenderViewController *chooseSenderVC = [[ChooseSenderViewController alloc] init];
    [self.navigationController pushViewController:chooseSenderVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
