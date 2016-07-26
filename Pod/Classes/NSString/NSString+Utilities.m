//
//  NSString+Utilities.m
//  Additions
//
//  Created by Erica Sadun, http://ericasadun.com
//  iPhone Developer's Cookbook, 3.0 Edition
//  BSD License, Use at your own risk

#import "NSString+Utilities.h"
#import "NSData+Hex.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSData+Utilities.h"

@implementation  NSString (UtilityExtensions)

- (NSString *)MD5 {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data md5String];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *) trimmedString
{
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


// run srandom() somewhere in your app // http://tinypaste.com/5f1c9
// Requested by BleuLlama
///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *) stringByAppendingRandomStringOfRandomLength
{
	int len = random() % 32;
	NSMutableArray *chars = [NSMutableArray array];
	NSMutableString *s = [NSMutableString stringWithString:self];

	NSMutableCharacterSet *cs = [[NSMutableCharacterSet alloc] init];
	[cs formUnionWithCharacterSet:[NSCharacterSet alphanumericCharacterSet]];
	[cs formUnionWithCharacterSet:[NSCharacterSet whitespaceCharacterSet]];
	// [cs formUnionWithCharacterSet:[NSCharacterSet symbolCharacterSet]];
	// [cs formUnionWithCharacterSet:[NSCharacterSet punctuationCharacterSet]];

	// init char array from charset
	for (int c = 0; c < 128; c++) // 7 bit only
		if ([cs characterIsMember:(unichar)c])
			[chars addObject:[NSString stringWithFormat:@"%c", c]];

	for (int i = 0; i < len; i++) [s appendString:[chars objectAtIndex:(random() % chars.count)]];

	return s;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSDate *) date
{
	// Return a date from a string
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	formatter.dateFormat = @"MM-dd-yyyy";
	NSDate *date = [formatter dateFromString:self];
	return date;
}

- (NSDate *)RFC3339ToDate
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    [formatter setLocale:[NSLocale systemLocale]];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
    
    NSDate *date = [NSDate date];
    date = [formatter dateFromString:self];
    return date;
}

+ (CGFloat)findHeightForText:(NSString *)text havingWidth:(CGFloat)widthValue andFont:(UIFont *)font {
    CGFloat result = font.pointSize + 4;
    if (text)
    {
        CGSize textSize = { widthValue, CGFLOAT_MAX };       //Width and height of text area
        CGSize size;
        //iOS 7
        CGRect frame = [text boundingRectWithSize:textSize
                                          options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                       attributes:@{ NSFontAttributeName:font }
                                          context:nil];
        size = CGSizeMake(frame.size.width, frame.size.height+1);
        result = MAX(size.height, result); //At least one row
    }
    return result;
}

- (BOOL)validateEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)validateMobile {
        NSString *MOBILE = @"^1[34578]\\d{9}$";
    
        NSPredicate *regexTestMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",MOBILE];
    
        if ([regexTestMobile evaluateWithObject:self]) {
        
                   return YES;
        
            }else {
            
                        return NO;
            
        }
    
}

- (BOOL)validateIdentityCard {
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:self];
}

- (NSString *)AES256EncryptWithKey:(NSString *)key
{
    NSData *plainData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSData *encryptedData = [plainData AES256EncryptWithKey:key];
    
    NSString *encryptedString = [encryptedData base64Encoding];
    
    return encryptedString;
}

- (NSString *)AES256DecryptWithKey:(NSString *)key
{
    NSData *encryptedData = [NSData dataWithBase64EncodedString:self];
    NSData *plainData = [encryptedData AES256DecryptWithKey:key];
    
    NSString *plainString = [[NSString alloc] initWithData:plainData encoding:NSUTF8StringEncoding];
    
    return plainString;
}

@end

