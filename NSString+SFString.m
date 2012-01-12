//
//  NSString+SFString.m
//  ShareFactorySTNDALN
//
//  Created by Sergio on 07/01/11.
//  Copyright 2011 HappyBee. All rights reserved.
//

#import "NSString+SFString.h"


@implementation NSString (SFString)

- (SFString *)SFStringRepresentation
{
	return (SFString *)self;
}

- (NSString *)substringFrom:(NSInteger)a to:(NSInteger)b
{
	NSRange r;
	r.location = a;
	r.length = b - a;
	return (NSString *)[self substringWithRange:r];
}

- (NSInteger)indexOf:(NSString *)substring from:(NSInteger)starts 
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

- (NSString *)trim
{
	return (NSString *)[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)startsWith:(NSString *)s
{
	if([self length] < [s length]) return NO;
	return [s isEqualToString:[self substringFrom:0 to:[s length]]];
}

- (BOOL)containsString:(NSString *)aString
{
	NSRange range = [[self lowercaseString] rangeOfString:[aString lowercaseString]];
	return range.location != NSNotFound;
}

- (NSString *)urlEncodeCopy
{
	NSString *encodedString = (NSString *)CFURLCreateStringByAddingPercentEscapes(
																				  NULL,
																				  (CFStringRef) self,
																				  NULL,
																				  (CFStringRef)@"!*'();:@&=+$,/?%#[]",
																				  kCFStringEncodingUTF8 );
	return encodedString;
}

- (NSString *)urlShortener
{
	NSString *apiEndpoint = [NSString stringWithFormat:@"http://is.gd/api.php?longurl=%@", self];
	NSString *shortURL = [NSString stringWithContentsOfURL:[NSURL URLWithString:apiEndpoint]
												  encoding:NSASCIIStringEncoding
													 error:nil];
	return shortURL;
}

- (NSString *)QRUrlRepresentation
{
	NSString *apiEndpoint = [@"http://chart.apis.google.com/chart?cht=qr&chs=100x100&choe=UTF-8&chld=H%7C0&chl=" stringByAppendingString:[[self urlEncodeCopy] autorelease]];
   
	return apiEndpoint;
}

- (NSData *)QRJPGImageRepresentation
{
    NSString *apiEndpoint = [@"http://chart.apis.google.com/chart?cht=qr&chs=100x100&choe=UTF-8&chld=H%7C0&chl=" stringByAppendingString:[[self urlEncodeCopy] autorelease]];
	
	NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:apiEndpoint]];
    
    return UIImageJPEGRepresentation([UIImage imageWithData:data], 100.0);
}

- (NSData *)QRPNGImageRepresentation
{
    NSString *apiEndpoint = [@"http://chart.apis.google.com/chart?cht=qr&chs=100x100&choe=UTF-8&chld=H%7C0&chl=" stringByAppendingString:[[self urlEncodeCopy] autorelease]];
	
	NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:apiEndpoint]];
    
    return UIImageJPEGRepresentation([UIImage imageWithData:data], 100.0);
}

- (BOOL)validateURL
{
    NSString *urlRegEx = @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx]; 
    return [urlTest evaluateWithObject:self];
}

@end
