//
//  TumblrView.h
//  ShareFactorySTNDALN
//
//  Created by sid on 26/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol TumblrViewDelegate <NSObject>
@required

- (void)tumblrDidRequestWithUsername:(NSString *)user andPassword:(NSString *)pass;

@end

@interface TumblrView : UIViewController
{
	IBOutlet UILabel *labelUser;
	IBOutlet UILabel *labelPass;
	IBOutlet UITextField *username;
	IBOutlet UITextField *password;
	IBOutlet UILabel *labelTitle;
	id delegate;
}

@property(nonatomic, retain) IBOutlet UILabel *labelUser;
@property(nonatomic, retain) IBOutlet UILabel *labelPass;
@property(nonatomic, retain) IBOutlet UITextField *username;
@property(nonatomic, retain) IBOutlet UITextField *password;
@property(nonatomic, retain) IBOutlet UILabel *labelTitle;
@property(nonatomic, retain) id<TumblrViewDelegate> delegate;

@end
