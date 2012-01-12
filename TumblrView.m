//
//  TumblrView.m
//  ShareFactorySTNDALN
//
//  Created by sid on 26/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TumblrView.h"
#import "ShareFactory.h"
#import "Tumblr.h"

@implementation TumblrView
@synthesize labelUser;
@synthesize labelPass;
@synthesize username;
@synthesize password;
@synthesize labelTitle;
@synthesize delegate;

- (void)viewDidLoad
{
	[super viewDidLoad];
	labelUser.text = @"Email";
	[labelUser becomeFirstResponder];
	
	labelPass.text = NSLocalizedString(@"password", @"");
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"TwitterClouds.png"]];
	self.title = @"Tumblr";
	
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
	[Tumblr sharedTumblr].email = username.text;
	[Tumblr sharedTumblr].password = password.text;
	
	UIAlertView *alert = nil;
	
	if (([Tumblr sharedTumblr].email == nil) ||
		([[Tumblr sharedTumblr].email isEqualToString:@""]) ||
		([Tumblr sharedTumblr].email == @""))
	{
		alert = [[[UIAlertView alloc] initWithTitle:@"" 
											message:NSLocalizedString(@"usernameEmptyTumblr", @"")
										   delegate:nil 
								  cancelButtonTitle:nil otherButtonTitles:@"OK", nil] autorelease];
		
		[alert show];
		
		return;
	}
	
	if (([Tumblr sharedTumblr].password == nil) ||
		([[Tumblr sharedTumblr].password isEqualToString:@""]) ||
		([Tumblr sharedTumblr].password == @""))
	{
		alert = [[[UIAlertView alloc] initWithTitle:@"" 
											message:NSLocalizedString(@"passwordEmptyTumblr", @"")
										   delegate:nil 
								  cancelButtonTitle:nil otherButtonTitles:@"OK", nil] autorelease];
		
		[alert show];
		
		return;
	}
	
	if ([self.delegate respondsToSelector:@selector(tumblrDidRequestWithUsername:andPassword:)])
	{
		[self.delegate tumblrDidRequestWithUsername:username.text andPassword:password.text];
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
