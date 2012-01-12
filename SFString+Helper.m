//
//  SFString+Additions.m
//  ShareFactorySTNDALN
//
//  Created by Sergio on 07/01/11.
//  Copyright 2011 HappyBee. All rights reserved.
//

#import "SFString+Helper.h"

@implementation SFString (Helper)

- (SFString *)substringFrom:(NSInteger)a to:(NSInteger)b
{
	NSRange r;
	r.location = a;
	r.length = b - a;
	return (SFString *)[self substringWithRange:r];
}

- (NSInteger)indexOf:(SFString *)substring from:(NSInteger)starts 
{
	NSRange r;
	r.location = starts;
	r.length = [self length] - r.location;
	
	NSRange index = [self rangeOfString:substring options:NSLiteralSearch range:r];
	
	if (index.location == NSNotFound)
	{
		return -1;
	}
	
	return index.location + index.length;
}

- (SFString *)trim
{
	return (SFString *)[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)startsWith:(SFString *)s
{
	if([self length] < [s length]) return NO;
	return [s isEqualToString:[self substringFrom:0 to:[s length]]];
}

- (BOOL)containsString:(SFString *)aString
{
	NSRange range = [[self lowercaseString] rangeOfString:[aString lowercaseString]];
	return range.location != NSNotFound;
}

- (SFString *)urlEncodeCopy
{
	SFString *encodedString = (SFString *)CFURLCreateStringByAddingPercentEscapes(
																				   NULL,
																				   (CFStringRef) self,
																				   NULL,
																				   (CFStringRef)@"!*'();:@&=+$,/?%#[]",
																				   kCFStringEncodingUTF8 );
	return encodedString;
}

@end