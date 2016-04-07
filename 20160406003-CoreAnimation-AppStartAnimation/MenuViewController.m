//
//  MenuViewController.m
//  20160406003-CoreAnimation-AppStartAnimation
//
//  Created by Rainer on 16/4/7.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuItemModel.h"
#import "MenuButton.h"

#define kTotleColum 3
#define kMenuButtonWH 100
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define kScreenW [UIScreen mainScreen].bounds.size.width

@interface MenuViewController ()

@property (nonatomic, assign) int buttonIndex;
@property (nonatomic, strong) NSMutableArray *menuButtonArray;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpMenuButtons];
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerChangedAction:) userInfo:nil repeats:YES];
}

- (void)setUpMenuButtons {
    // 1.定义按钮位置的相关属性
    // 1.1.按钮的X值
    __block CGFloat menuButtonX = 0;
    // 1.2.按钮的Y值
    __block CGFloat menuButtonY = 0;
    // 1.3.按钮的初始Y值
    __block CGFloat menuButtonOrginalY = kScreenH * 0.4;
    // 1.4.按钮的间距
    __block CGFloat menuButtonMargin = (kScreenW - kMenuButtonWH * kTotleColum) / (kTotleColum + 1);
    
    [self.menuItemArray enumerateObjectsUsingBlock:^(MenuItemModel *menuItem, NSUInteger idx, BOOL *stop) {
        // 计算当前行和列
        NSUInteger currentRow = idx / kTotleColum;
        NSUInteger currentCol = idx % kTotleColum;
        
        MenuButton *menuButton = [MenuButton buttonWithType:UIButtonTypeCustom];
        
        menuButtonX = menuButtonMargin + (menuButtonMargin + kMenuButtonWH) * currentCol;
        menuButtonY = menuButtonOrginalY + (menuButtonMargin + kMenuButtonWH) * currentRow;
        
        menuButton.frame = CGRectMake(menuButtonX, menuButtonY, kMenuButtonWH, kMenuButtonWH);
        
        [menuButton setTitle:menuItem.itemTitle forState:UIControlStateNormal];
        [menuButton setImage:menuItem.itemImage forState:UIControlStateNormal];
        [menuButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        menuButton.titleLabel.font = [UIFont systemFontOfSize:13.0]; ;
        
        // 初始化时将按钮隐藏在屏幕外
        menuButton.transform = CGAffineTransformMakeTranslation(menuButtonX, kScreenH);
        
        [menuButton addTarget:self action:@selector(menuButtonTouchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
        [menuButton addTarget:self action:@selector(menuButtonTouchDownAction:) forControlEvents:UIControlEventTouchDown];
        
        [self.view addSubview:menuButton];
        [self.menuButtonArray addObject:menuButton];
    }];
}

- (void)timerChangedAction:(NSTimer *)timer {
    if (self.buttonIndex >= self.menuButtonArray.count) {
        [timer invalidate];
        
        return;
    }
    
    MenuButton *menuButton = self.menuButtonArray[self.buttonIndex];
    
    [self addAnimationWithMenuButton:menuButton];
    
    self.buttonIndex++;
}

- (void)addAnimationWithMenuButton:(UIButton *)button {
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        button.transform = CGAffineTransformIdentity;
    } completion:nil];
}

- (void)menuButtonTouchUpInsideAction:(MenuButton *)menuButton {
    [UIView animateWithDuration:0.5 animations:^{
        menuButton.transform = CGAffineTransformMakeScale(1.5, 1.5);
        menuButton.alpha = 0;
    }];
}

- (void)menuButtonTouchDownAction:(MenuButton *)menuButton {
    [UIView animateWithDuration:0.5 animations:^{
        menuButton.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }];
}

- (NSMutableArray *)menuButtonArray {
    if (nil == _menuButtonArray) {
        _menuButtonArray = [NSMutableArray array];
    }
    
    return _menuButtonArray;
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
