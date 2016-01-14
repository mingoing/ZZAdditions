//
//  UINavigationBar+MOU.m
//  mouke-ios
//
//  Created by wlsy on 13-9-23.
//  Copyright (c) 2013年 mou. All rights reserved.
//

#import "UINavigationBar+Additions.h"
#import "ZZAdditions.h"

@implementation UINavigationBar (Additions)

- (void)flatColor:(UIColor *)color;
{
    UINavigationBar *navBar = self;
    NSMutableDictionary *titleTextAttributes = [[navBar titleTextAttributes] mutableCopy];
    if (!titleTextAttributes) {
        titleTextAttributes = [NSMutableDictionary dictionary];
    }
    [titleTextAttributes setValue:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [titleTextAttributes setValue:[UIFont boldSystemFontOfSize:17 ] forKey:NSFontAttributeName];
    [navBar setTitleTextAttributes:titleTextAttributes];
    
    navBar.translucent = NO;
    [navBar setBackgroundImage:[UIImage imageWithColor:color cornerRadius:0] forBarMetrics:UIBarMetricsDefault];
    [navBar setShadowImage:[UIImage imageWithColor:color cornerRadius:0]];
}


@end
