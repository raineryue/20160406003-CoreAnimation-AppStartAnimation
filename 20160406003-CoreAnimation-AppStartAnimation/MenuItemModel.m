//
//  MenuItemModel.m
//  20160406003-CoreAnimation-AppStartAnimation
//
//  Created by Rainer on 16/4/7.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "MenuItemModel.h"

@implementation MenuItemModel

+ (instancetype)itemWithTitle:(NSString *)itemTitle image:(UIImage *)itemImage {
    MenuItemModel *menuItem = [[MenuItemModel alloc] init];
    
    menuItem.itemTitle = itemTitle;
    menuItem.itemImage = itemImage;
    
    return menuItem;
}

@end
