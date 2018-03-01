//
//  ChooseSenderViewController.m
//  EaseMobSendMessage
//
//  Created by yang on 2018/3/1.
//  Copyright © 2018年 223studio. All rights reserved.
//

#import "ChooseSenderViewController.h"
#import "ChooseMessageViewController.h"
#import "ChooseTableViewCell.h"

static NSString *kSenderCellReuseIdentifier = @"senderCellReuseIdentifier";

@interface ChooseSenderViewController ()<UITableViewDelegate,UITableViewDataSource> {
    
}
@property (nonatomic,strong) NSArray *senderArr;
@property (nonatomic,strong) NSMutableArray *selectedIDArr;


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
    
    [self.tableView registerClass:[ChooseTableViewCell class] forCellReuseIdentifier:kSenderCellReuseIdentifier];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChooseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSenderCellReuseIdentifier];
    NSString *senderID = self.senderArr[indexPath.row];
    
    if([self.selectedIDArr containsObject:senderID]){
        cell.status = ARICellSelected;
    }else {
        cell.status = ARICellunSelected;
    }
    
    cell.contentLab.text = senderID;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ChooseTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *senderID = self.senderArr[indexPath.row];

    if([self.selectedIDArr containsObject:senderID]){
        cell.status = ARICellunSelected;
        [self.selectedIDArr removeObject:senderID];
    }else {
        cell.status = ARICellSelected;
        [self.selectedIDArr addObject:senderID];
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.senderArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (void)nextStep:(id)sender {
    
    ChooseMessageViewController *chooseMessageVC = [[ChooseMessageViewController alloc] init];
    [self.navigationController pushViewController:chooseMessageVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSMutableArray *)selectedIDArr {
    
    if(!_selectedIDArr){
        _selectedIDArr = [[NSMutableArray alloc] init];
    }
    return _selectedIDArr;
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
