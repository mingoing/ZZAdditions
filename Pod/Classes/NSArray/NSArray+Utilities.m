//
//  NSArray+Utilities.m
//  Additions
//
//  Created by Erica Sadun, http://ericasadun.com
//  iPhone Developer's Cookbook, 3.0 Edition
//  BSD License, Use at your own risk

#import "NSArray+Utilities.h"
#import <time.h>
#import <stdarg.h>

/*
 Thanks to August Joki, Emanuele Vulcano, BlueLlama, Optimo, jtbandes

 To add Math Extensions like sum, product?
 */

#pragma mark StringExtensions
@implementation NSArray (StringExtensions)
///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSArray *) arrayBySortingStrings
{
	NSMutableArray *sort = [NSMutableArray arrayWithArray:self];
	for (id eachitem in self)
		if (![eachitem isKindOfClass:[NSString class]])	[sort removeObject:eachitem];
	return [sort sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *) stringValue
{
	return [self componentsJoinedByString:@" "];
}
@end

#pragma mark UtilityExtensions
@implementation NSArray (UtilityExtensions)
///////////////////////////////////////////////////////////////////////////////////////////////////
- (id) firstObject
{
	return [self objectAtIndex:0];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSArray *) uniqueMembers
{
	NSMutableArray *copy = [self mutableCopy];
	for (id object in self)
	{
		[copy removeObjectIdenticalTo:object];
		[copy addObject:object];
	}
	return copy;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSArray *) unionWithArray: (NSArray *) anArray
{
	if (!anArray) return self;
	return [[self arrayByAddingObjectsFromArray:anArray] uniqueMembers];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSArray *) intersectionWithArray: (NSArray *) anArray
{
	NSMutableArray *copy = [self mutableCopy];
	for (id object in self)
		if (![anArray containsObject:object])
			[copy removeObjectIdenticalTo:object];
	return [copy uniqueMembers];
}


@end

#pragma mark Mutable UtilityExtensions
@implementation NSMutableArray (UtilityExtensions)
///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSMutableArray *) reverse
{
	for (int i=0; i<(floor([self count]/2.0)); i++)
		[self exchangeObjectAtIndex:i withObjectAtIndex:([self count]-(i+1))];
	return self;
}

// Make sure to run srandom([[NSDate date] timeIntervalSince1970]); or similar somewhere in your program
///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSMutableArray *) scramble
{
	for (int i=0; i<([self count]-2); i++)
		[self exchangeObjectAtIndex:i withObjectAtIndex:(i+(random()%([self count]-i)))];
	return self;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSMutableArray *) removeFirstObject
{
	[self removeObjectAtIndex:0];
	return self;
}
@end


#pragma mark StackAndQueueExtensions
@implementation NSMutableArray (StackAndQueueExtensions)
///////////////////////////////////////////////////////////////////////////////////////////////////
- (id) popObject
{
	if ([self count] == 0) return nil;

    id lastObject = [self lastObject];
    [self removeLastObject];
    return lastObject;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSMutableArray *) pushObject:(id)object
{
    [self addObject:object];
	return self;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSMutableArray *) pushObjects:(id)object,...
{
	if (!object) return self;
	id obj = object;
	va_list objects;
	va_start(objects, object);
	do
	{
		[self addObject:obj];
		obj = va_arg(objects, id);
	} while (obj);
	va_end(objects);
	return self;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (id) pullObject
{
	if ([self count] == 0) return nil;

	id firstObject = [self objectAtIndex:0];
	[self removeObjectAtIndex:0];
	return firstObject;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSMutableArray *)push:(id)object
{
	return [self pushObject:object];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (id) pop
{
	return [self popObject];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (id) pull
{
	return [self pullObject];
}
@end