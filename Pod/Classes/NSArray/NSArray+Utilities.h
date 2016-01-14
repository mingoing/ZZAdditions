//
//  NSArray+Utilities.h
//  Additions
//
//  Created by Erica Sadun, http://ericasadun.com
//  iPhone Developer's Cookbook, 3.0 Edition
//  BSD License, Use at your own risk


#import <Foundation/Foundation.h>
@interface NSArray (StringExtensions)
- (NSArray *) arrayBySortingStrings;
@property (readonly, getter=arrayBySortingStrings) NSArray *sortedStrings;
@property (readonly) NSString *stringValue;
@end

@interface NSArray (UtilityExtensions)
- (id) firstObject;
- (NSArray *) uniqueMembers;
- (NSArray *) unionWithArray: (NSArray *) array;
- (NSArray *) intersectionWithArray: (NSArray *) array;

@end

@interface NSMutableArray (UtilityExtensions)
- (NSMutableArray *) removeFirstObject;
- (NSMutableArray *) reverse;
- (NSMutableArray *) scramble;
@property (readonly, getter=reverse) NSMutableArray *reversed;
@end

@interface NSMutableArray (StackAndQueueExtensions)
- (NSMutableArray *)pushObject:(id)object;
- (NSMutableArray *)pushObjects:(id)object,...;
- (id) popObject;
- (id) pullObject;

// Synonyms for traditional use
- (NSMutableArray *)push:(id)object;
- (id) pop;
- (id) pull;
@end

