//
//  NNTableViewCell.m
//  NNDeviceInformation
//
//  Created by 刘朋坤 on 17/4/7.
//  Copyright © 2017年 刘朋坤. All rights reserved.
//

#import "NNTableViewCell.h"

@interface NNTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@end

@implementation NNTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)layoutSubviews {
    self.infoLabel.text = [NSString stringWithFormat:@"%@", self.infoString];
    self.nameLabel.text = [NSString stringWithFormat:@"%@", self.nameString];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
