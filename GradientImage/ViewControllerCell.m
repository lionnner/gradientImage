//
//  ViewControllerCell.m
//  GradientImage
//
//  Created by lvjialin on 2018/5/25.
//  Copyright © 2018年 lionnner. All rights reserved.
//

#import "ViewControllerCell.h"
#import "GradientImageTool.h"

@interface ViewControllerCell ()
{
    UIImageView *_bgView;
    CGFloat _width;
    CGFloat _height;
}
@end

@implementation ViewControllerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];
        _bgView = [[UIImageView alloc] init];
        [self.contentView addSubview:_bgView];
        [self updateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    [super updateConstraints];
    UIView *superView = self.contentView;
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(superView);
    }];
}


- (void)updateCell:(NSArray *)colors
{
    if (_width == 0 || _height == 0) {
        [_bgView.superview layoutIfNeeded];
        _width = _bgView.bounds.size.width;
        _height = _bgView.bounds.size.height;
    }
    _bgView.image = [GradientImageTool gradientLinearImageFromColors:colors withImageSize:CGSizeMake(_width, _height)];
}
@end
