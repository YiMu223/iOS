//
//  ChooseTableViewCell.m
//  EaseMobSendMessage
//
//  Created by yang on 2018/3/1.
//  Copyright © 2018年 223studio. All rights reserved.
//

#import "ChooseTableViewCell.h"
#import <Masonry.h>

@interface ChooseTableViewCell() {
    
    ARICellStuts _status;
}
@end
@implementation ChooseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _status = ARICellunSelected;
        [self addSubview:self.statusImageView];
        [self.statusImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView.mas_left).offset(21);
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.height.equalTo(@18);
            make.width.equalTo(@18);

        }];
        
        [self addSubview:self.contentLab];
        [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.statusImageView.mas_right).offset(10);
            make.top.offset(0);
            make.bottom.offset(0);
            make.right.offset(0);
        }];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setStatus:(ARICellStuts)status
{
    if(status == _status)
        return;
    
    NSString *imageName = @"checkoval_nor";
    
    switch (status) {
        case ARICellunSelected:
            imageName = @"checkoval_nor";
            break;
        case ARICellSelected:
            imageName = @"checkoval_sel";
            break;
        default:
            break;
    }
    _status = status;
    self.statusImageView.image = [UIImage imageNamed:imageName];
    
}
- (UIImageView *)statusImageView {
    
    if(!_statusImageView){
        _statusImageView = [[UIImageView alloc] init];
        _statusImageView.image = [UIImage imageNamed:@"checkoval_nor"];
    }
    return _statusImageView;
}
- (UILabel *)contentLab {
    
    if(!_contentLab){
        _contentLab = [[UILabel alloc] init];
        _contentLab.textAlignment = NSTextAlignmentLeft;
    }
    return _contentLab;
}
@end
