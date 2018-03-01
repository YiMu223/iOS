//
//  ChooseTableViewCell.h
//  EaseMobSendMessage
//
//  Created by yang on 2018/3/1.
//  Copyright © 2018年 223studio. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum  {
    ARICellSelected = 0,
    ARICellunSelected = 1,
    
    
}ARICellStuts;

@interface ChooseTableViewCell : UITableViewCell
@property (nonatomic,strong) UIImageView *statusImageView;
@property (nonatomic,strong) UILabel *contentLab;
@property (nonatomic,assign) ARICellStuts status;
@end
