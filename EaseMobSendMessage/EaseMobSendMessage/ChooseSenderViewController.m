//
//  ChooseSenderViewController.m
//  EaseMobSendMessage
//
//  Created by yang on 2018/3/1.
//  Copyright © 2018年 223studio. All rights reserved.
//

#import "ChooseSenderViewController.h"
#import "ChooseMessageViewController.h"

static NSString *kSenderCellReuseIdentifier = @"senderCellReuseIdentifier";

@interface ChooseSenderViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *senderArr;
@end

@implementation ChooseSenderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"选择发送人";
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(nextStep:)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"sender" ofType:@"txt"];
    NSString *dataFile = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    self.senderArr = [dataFile componentsSeparatedByString:@"\n"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kSenderCellReuseIdentifier];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSenderCellReuseIdentifier];
    NSString *senderID = self.senderArr[indexPath.row];
    cell.textLabel.text = senderID;
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.senderArr.count;
}
- (void)nextStep:(id)sender {
    
    ChooseMessageViewController *chooseMessageVC = [[ChooseMessageViewController alloc] init];
    [self.navigationController pushViewController:chooseMessageVC animated:YES];
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
