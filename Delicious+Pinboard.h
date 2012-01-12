//
//  Delicious.h
//  ShareFactorySTNDALN
//
//  Created by Sergio on 22/02/11.
//  Copyright 2011 HappyBee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import "NSString+SFString.h"

@interface Delicious : NSObject 
{

}

+ (BOOL)performDeliciousRequestWithUser:(NSString *)username
							   password:(NSString *)password
						   urlDelicious:(NSString *)url
							description:(NSString *)description
								   tags:(NSArray *)tags
					   activatePinboard:(BOOL)pinboard;

@end
