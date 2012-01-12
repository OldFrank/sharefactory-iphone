//
//  DeliciousView.m
//
//  Created by Sergio on 24/02/11.
//  Copyright 2011 HappyBee. All rights reserved.
//

#import "DeliciousView.h"
#import "ShareFactory.h"

@implementation DeliciousView
@synthesize labelUser;
@synthesize labelPass;
@synthesize username;
@synthesize password;
@synthesize labelTitle;
@synthesize delegate;
@synthesize isDelicious;

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	labelUser.text = NSLocalizedString(@"username", @"");
	[labelUser becomeFirstResponder];
	
	labelPass.text = NSLocalizedString(@"password", @"");
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"TwitterClouds.png"]];
	self.title = @"Delicious";
	
	UIBarButtonItem *loginButton = [[UIBarButtonItem alloc] initWithTitle:@"Login"
																	style:UIBarButtonItemStylePlain 
																   target:self
																   action:@selector(doLogin)];
	self.navigationItem.rightBarButtonItem = loginButton;
	[loginButton release];
	
	UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"cancel", @"")
																	 style:UIBarButtonItemStylePlain 
																	target:self
																	action:@selector(close)];
	self.navigationItem.leftBarButtonItem = cancelButton;
	[cancelButton release];
}

- (void)doLogin
{
	[ShareFactory shared].usernameDeliciousOrPinboard = username.text;
	[ShareFactory shared].passDeliciousOrPinboard = password.text;
	
	if ([self.delegate respondsToSelector:@selector(deliciousDidRequestWithUsername:andPassword:isDeliciousService:)])
	{
		[self.delegate deliciousDidRequestWithUsername:username.text andPassword:password.text isDeliciousService:isDelicious];
	}
	
	[self dismissModalViewControllerAnimated:YES];
}

- (void)close
{
	[self dismissModalViewControllerAnimated:YES];
}

- (void)dealloc
{
	[super dealloc];
}

@end
