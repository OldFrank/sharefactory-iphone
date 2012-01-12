//
//  Delicious.m
//  ShareFactorySTNDALN
//
//  Created by Sergio on 22/02/11.
//  Copyright 2011 HappyBee. All rights reserved.
//

#import "Delicious+Pinboard.h"

@implementation Delicious

+ (BOOL)performDeliciousRequestWithUser:(NSString *)username
							   password:(NSString *)password
						   urlDelicious:(NSString *)url
							description:(NSString *)description
								   tags:(NSArray *)tags
					   activatePinboard:(BOOL)pinboard
{
	NSString *tagCloud = @"";
	
	for (NSString *str in tags)
	{
		if (tagCloud == @"")
			tagCloud = str;
		else
			tagCloud = [NSString stringWithFormat:@"%@+%@", tagCloud, str];
	}
	
	NSString *urlEncoded = [url urlEncodeCopy];
	NSString *descriptionEncoded = [description urlEncodeCopy];

	NSString *dataURL = @"";
	if (pinboard)
	{
		dataURL = [NSString stringWithFormat:@"https://%@:%@@api.pinboard.in/v1/posts/add?url=%@&description=%@&tags=%@",
							 username, 
							 password, 
							 urlEncoded,
							 descriptionEncoded, 
							 tagCloud];
	}
	else
	{
		dataURL = [NSString stringWithFormat:@"https://%@:%@@api.del.icio.us/v1/posts/add?url=%@&description=%@&tags=%@",
							 username, 
							 password, 
							 urlEncoded,
							 descriptionEncoded, 
							 tagCloud];
	}

	[descriptionEncoded release];
	[urlEncoded release];
	
	NSString *stringData = [NSString stringWithContentsOfURL:[NSURL URLWithString:dataURL]
													encoding:NSASCIIStringEncoding
													   error:nil];
	 
	if (![stringData containsString:@"result code=\"done\""])
	{
		return NO;
	}
	else
	{
		return YES;
	}
}

//curl -u username:password "https://api.del.icio.us/v1/posts/add?url=http://www.ala.org/ala/acrl/acrlissues/future/changingroles.html&description=ALA+%7C+Changing+Roles+of+Academic+and+Research+Libraries&tags=library+2.0+academic+ACRL+technology"

@end