//
//  NSString+Utilities.h
//  Additions
//
//  Created by Erica Sadun, http://ericasadun.com
//  iPhone Developer's Cookbook, 3.0 Edition
//  BSD License, Use at your own risk


#import <Foundation/Foundation.h>


@interface NSString (UtilityExtensions)
- (NSString *)stringByAppendingRandomStringOfRandomLength;
- (NSDate *)date;
- (NSDate *)RFC3339ToDate;

@property (readonly) NSString *trimmedString;
@property (readonly) NSDate *date;

+ (CGFloat)findHeightForText:(NSString *)text havingWidth:(CGFloat)widthValue andFont:(UIFont *)font;


@end

@interface NSString (UTF8String)
@property (readonly) char *UTF8String; // a favorite!
@end
