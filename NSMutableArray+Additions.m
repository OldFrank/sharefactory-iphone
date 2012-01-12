//
//  NSMutableArray+Additions.m
//  ShareFactorySTNDALN
//
//  Created by Sergio on 15/01/11.
//  Copyright 2011 HappyBee. All rights reserved.
//

#import "NSMutableArray+Additions.h"

@implementation NSMutableArray (SFArray)

- (void)addSFService:(SHARE_METHOD)service
{
	[self addObject:[NSNumber numberWithInt:service]];
}

@end
