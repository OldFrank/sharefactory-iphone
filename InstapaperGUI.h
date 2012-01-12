//
//  InstapaperGUI.h
//
//  Created by Sergio on 12/02/11.
//  Copyright 2011 HappyBee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol InstapaperGUIDelegate <NSObject>
@required

- (void)userWantsToLoginWithUsername:(NSString *)username password:(NSString *)password object:(id)object;

@end

@interface InstapaperGUI : UIViewController
{
	IBOutlet UILabel *labelUser;
	IBOutlet UILabel *labelPass;
	IBOutlet UITextField *textUser;
	IBOutlet UITextField *textPass;
	
	id delegate;
}

- (void)close;
- (void)doLogin;

@property(nonatomic, retain) IBOutlet UILabel *labelUser;
@property(nonatomic, retain) IBOutlet UILabel *labelPass;
@property(nonatomic, retain) IBOutlet UITextField *textUser;
@property(nonatomic, retain) IBOutlet UITextField *textPass;
@property(nonatomic, retain) id<InstapaperGUIDelegate> delegate;

@end