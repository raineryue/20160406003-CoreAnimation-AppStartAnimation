//
//  MenuButton.m
//  20160406003-CoreAnimation-AppStartAnimation
//
//  Created by Rainer on 16/4/7.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "MenuButton.h"

// 定义按钮内部图片视图控件所占高度比例
#define kImageRatio 0.8

@implementation MenuButton

- (void)awakeFromNib {
    self.imageView.contentMode = UIViewContentModeCenter;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = self.bounds.size.width;
    CGFloat imageH = self.bounds.size.height * kImageRatio;
    
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    CGFloat titleX = 0;
    CGFloat titleY = imageH;
    CGFloat titleW = imageW;
    CGFloat titleH = self.bounds.size.height - imageH;
    
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
}

- (void)setHighlighted:(BOOL)highlighted {

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
