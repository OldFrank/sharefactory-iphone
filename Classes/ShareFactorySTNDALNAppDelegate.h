//
//  ShareFactorySTNDALNAppDelegate.h
//  ShareFactorySTNDALN
//
//  Created by Sergio on 07/01/11.
//  Copyright HappyBee 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShareFactorySTNDALNViewController;

@interface ShareFactorySTNDALNAppDelegate : NSObject <UIApplicationDelegate> 
{
    UIWindow *window;
    ShareFactorySTNDALNViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ShareFactorySTNDALNViewController *viewController;

@end

