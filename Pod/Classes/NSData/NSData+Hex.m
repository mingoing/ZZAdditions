//
//  NSData+Hex.m
//  Additions
//
//  Created by Alberto Gimeno Brieba on 12/09/11.
//

#import "NSData+Hex.h"
#import <CommonCrypto/CommonDigest.h>


@implementation NSData (helper)

- (NSString *)md5String {
    const char *str = [self bytes];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)self.length, result);
    
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02X", result[i]];
    }
    
    return [hash lowercaseString];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)hexString {
	NSMutableString *str = [NSMutableString stringWithCapacity:64];
	long int length = [self length];
	char *bytes = malloc(sizeof(char) * length);

	[self getBytes:bytes length:length];

	int i = 0;

	for (; i < length; i++) {
		[str appendFormat:@"%02.2hhx", bytes[i]];
	}
	free(bytes);

	return str;
}

@end