//
//  MenuItemModel.h
//  20160406003-CoreAnimation-AppStartAnimation
//
//  Created by Rainer on 16/4/7.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MenuItemModel : NSObject

@property (nonatomic, copy) NSString *itemTitle;
@property (nonatomic, strong) UIImage *itemImage;

+ (instancetype)itemWithTitle:(NSString *)itemTitle image:(UIImage *)image;

@end
