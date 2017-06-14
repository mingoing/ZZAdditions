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
- (NSString *)MD5;

+ (NSString*)addQueryStringToUrlString:(NSString *)urlString withDictionary:(NSDictionary *)dictionary;

@property (readonly) NSString *trimmedString;
@property (readonly) NSDate *date;

+ (CGFloat)findHeightForText:(NSString *)text havingWidth:(CGFloat)widthValue andFont:(UIFont *)font;

- (NSString *)AES256EncryptWithKey:(NSString *)key;
- (NSString *)AES256DecryptWithKey:(NSString *)key;

- (BOOL)validateMobile;
- (BOOL)validateEmail;
- (BOOL)validateIdentityCard;
    

@end

@interface NSString (UTF8String)
@property (readonly) char *UTF8String; // a favorite!
@end
