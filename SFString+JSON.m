//
//  SFString+JSON.m
//  ShareFactorySTNDALN
//
//  Created by Sergio on 07/01/11.
//  Copyright 2011 HappyBee. All rights reserved.
//

#import "SFString+JSON.h"

@implementation NSString (JSON)

- (BOOL)isNullObject
{
	NSRange range = [[self lowercaseString] rangeOfString:[@"null" lowercaseString]];
	NSRange range2 = [[self lowercaseString] rangeOfString:[@"nil" lowercaseString]];
	
	if ((range.location != NSNotFound) || (range2.location != NSNotFound))
	{
		return YES;
	}
	else 
	{
		return NO;
	}
}

@end