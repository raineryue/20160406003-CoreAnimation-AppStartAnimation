//
//  StartView.m
//  20160406003-CoreAnimation-AppStartAnimation
//
//  Created by Rainer on 16/4/6.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "StartView.h"

@interface StartView ()

@property (weak, nonatomic) IBOutlet UIImageView *sloganImageView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *welcomLabel;

@end

@implementation StartView

+ (instancetype)startView {
    return [[NSBundle mainBundle] loadNibNamed:@"StartView" owner:self options:nil][0];
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    
    self.iconImageView.layer.cornerRadius = self.iconImageView.bounds.size.width * 0.5;
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.transform = CGAffineTransformMakeTranslation(0, 50);
    
    [UIView animateWithDuration:0.5 animations:^{
        self.sloganImageView.alpha = 0;
    } completion:^(BOOL finished) {
        self.iconImageView.hidden = NO;
        
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            self.iconImageView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            self.welcomLabel.alpha = 0;
            self.welcomLabel.hidden = NO;
            
            [UIView animateWithDuration:2 animations:^{
                self.welcomLabel.alpha = 1;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.5 animations:^{
                    self.alpha = 0;
                } completion:^(BOOL finished) {
                    [self removeFromSuperview];
                }];
            }];
        }];
    }];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
