//
//  Instapaper.h
//  ShareFactorySTNDALN
//
//  Created by Sergio on 12/02/11.
//  Copyright 2011 HappyBee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"

@interface Instapaper : NSObject 

+ (NSString *)sharedURL:(NSString *)url 
			   username:(NSString *)username 
			   password:(NSString *)password
				  title:(NSString *)title;

@end
