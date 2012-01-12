//
//  InstapaperGUI.m
//
//  Created by Sergio on 12/02/11.
//  Copyright 2011 HappyBee. All rights reserved.
//

#import "InstapaperGUI.h"
#import "ShareFactory.h"

@implementation InstapaperGUI
@synthesize labelUser;
@synthesize labelPass;
@synthesize textUser;
@synthesize textPass;
@synthesize delegate;

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"TwitterClouds.png"]];
	self.title = @"Instapaper";
	
	UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"cancel", @"")
																	 style:UIBarButtonItemStylePlain 
																	target:self
																	action:@selector(close)];
	self.navigationItem.leftBarButtonItem = cancelButton;
	[cancelButton release];
	
	
	UIBarButtonItem *loginButton = [[UIBarButtonItem alloc] initWithTitle:@"Login"
																	style:UIBarButtonItemStylePlain 
																   target:self
																   action:@selector(doLogin)];
	self.navigationItem.rightBarButtonItem = loginButton;
	[loginButton release];
	
	labelUser.text = NSLocalizedString(@"username", @"");
	[labelUser becomeFirstResponder];
	
	labelPass.text = NSLocalizedString(@"password", @"");
}

- (void)close
{
	[self dismissModalViewControllerAnimated:YES];
}

- (void)doLogin
{
	if ([self.delegate respondsToSelector:@selector(userWantsToLoginWithUsername:password:object:)])
	{
		[self.delegate userWantsToLoginWithUsername:textUser.text password:textPass.text object:self];
	}
	
	[self close];
}

- (void)dealloc
{
	[super dealloc];
}

@end
