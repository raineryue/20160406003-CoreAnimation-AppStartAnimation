//
//  ViewController.m
//  20160406003-CoreAnimation-AppStartAnimation
//
//  Created by Rainer on 16/4/6.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "ViewController.h"
#import "MenuViewController.h"
#import "MenuItemModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)menuButtonClickAction:(id)sender {
    // 创建模型对象
    MenuItemModel *item = [MenuItemModel itemWithTitle:@"点评" image:[UIImage imageNamed:@"tabbar_compose_review"]];
    MenuItemModel *item1 = [MenuItemModel itemWithTitle:@"更多" image:[UIImage imageNamed:@"tabbar_compose_more"]];
    MenuItemModel *item2 = [MenuItemModel itemWithTitle:@"拍摄" image:[UIImage imageNamed:@"tabbar_compose_camera"]];
    MenuItemModel *item3 = [MenuItemModel itemWithTitle:@"相册" image:[UIImage imageNamed:@"tabbar_compose_photo"]];
    MenuItemModel *item4 = [MenuItemModel itemWithTitle:@"文字" image:[UIImage imageNamed:@"tabbar_compose_idea"]];
    MenuItemModel *item5 = [MenuItemModel itemWithTitle:@"签到" image:[UIImage imageNamed:@"tabbar_compose_review"]];

    MenuViewController *menuViewController = [[MenuViewController alloc] init];
    
    menuViewController.menuItemArray = @[item, item1, item2, item3, item4, item5];
    
    [self presentViewController:menuViewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
