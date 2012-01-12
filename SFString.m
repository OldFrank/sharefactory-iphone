//
//  SFString.m
//  ShareFactorySTNDALN
//
//  Created by Sergio on 07/01/11.
//  Copyright 2011 HappyBee. All rights reserved.
//

#import "SFString.h"


@implementation SFString

/* NSString primitive (funnel) methods. 
 * A minimal subclass of NSString just needs to implement these, although we also recommend getCharacters:range:.
 * See below for the other methods.
 */

- (id)initWithFormat:(NSString *)format locale:(id)locale arguments:(va_list)argList
{
	if (self = [super initWithFormat:format locale:locale arguments:argList])
	{
		
	}
	
	return self;
}

- (id)initWithFormatString:(SFString *)format
{
	if (self == nil)
	{
		self = [[SFString alloc] initWithFormatString:format];
	}
	
	return self;
}

- (NSUInteger)length
{
	return [self length];
}

- (unichar)characterAtIndex:(NSUInteger)index
{	
	return [self characterAtIndex:index];
}

- (void)getCharacters:(unichar *)buffer range:(NSRange)aRange
{
	
}

@end
