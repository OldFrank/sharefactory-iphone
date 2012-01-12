//
//  UIView+Additions.m
//  ShareFactorySTNDALN
//
//  Created by sid on 21/01/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIView+Additions.h"

@implementation UIView (Additions)

- (BOOL)hasTabBar
{
	for (UIView *v in self.subviews)
	{
		if ([v isKindOfClass:[UITabBarController class]])
		{
			return YES;
		}
	}
	
	return NO;
}

@end
