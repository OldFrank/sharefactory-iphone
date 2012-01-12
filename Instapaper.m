//
//  Instapaper.m
//  ShareFactorySTNDALN
//
//  Created by Sergio on 12/02/11.
//  Copyright 2011 HappyBee. All rights reserved.
//

#import "Instapaper.h"

@implementation Instapaper

+ (NSString *)sharedURL:(NSString *)url username:(NSString *)username password:(NSString *)password title:(NSString *)title
{
	NSString *response = @"";
	
	@try 
	{
		ASIFormDataRequest *request = [ASIFormDataRequest  requestWithURL:[NSURL URLWithString:@"https://www.instapaper.com/api/add"]];
		[request addPostValue:username forKey:@"username"];
		[request addPostValue:password forKey:@"password"];
		[request addPostValue:url forKey:@"url"];
		[request addPostValue:title forKey:@"title"];
		[request startSynchronous];
		
		NSError *error = [request error];
		if (!error)
		{
			response = [request responseString];
		}
	}
	@catch (NSException * e)
	{
		response = @"";
	}
	
	return response;
}

@end
