//
//  UIApplication+Additions.m
//  danpian
//
//  Created by wlsy on 14/11/11.
//  Copyright (c) 2014年 mou. All rights reserved.
//

#import "UIApplication+Additions.h"

@implementation UIApplication (Additions)

#pragma mark - NSUserDefaults
+ (void)setObject:(id)object forKey:(NSString *)key {
    // Set?
    if (object)
    {
        [[NSUserDefaults standardUserDefaults] setObject:object
                                                  forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    // Clear
    else
    {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+ (id)objectForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+ (NSString *)bundleName {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
}

+ (NSString *)version {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

+ (CGSize)screenSize {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    return screenRect.size;
}

@end
