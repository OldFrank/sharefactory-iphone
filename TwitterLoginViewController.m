/*
 * (C) Copyright 2010, Stefan Arentz, Arentz Consulting Inc.
 *
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import <QuartzCore/QuartzCore.h>

#import "TwitterAuthenticator.h"
#import "TwitterLoginViewController.h"

@implementation TwitterLoginViewController

@synthesize consumer = _consumer, delegate = _delegate;

- (void) _hideLoginForm
{
	_usernameLabel.hidden = YES;
	_usernameTextField.hidden = YES;
	_passwordLabel.hidden = YES;
	_passwordTextField.hidden = YES;
	_createAccountButton.hidden = YES;
	
	[_usernameTextField resignFirstResponder];
	[_passwordTextField resignFirstResponder];
	
	self.navigationItem.rightBarButtonItem.enabled = YES;
}

- (void) _showLoginForm
{
	_usernameLabel.hidden = NO;
	_usernameTextField.hidden = NO;
	_passwordLabel.hidden = NO;
	_passwordTextField.hidden = NO;
	_createAccountButton.hidden = YES;
}

- (void) _hideStatus
{
	_activityIndicatorView.hidden = YES;
	[_activityIndicatorView stopAnimating];
	_statusLabel.hidden = YES;
}

- (void) _showStatus
{
	_activityIndicatorView.hidden = NO;
	[_activityIndicatorView startAnimating];
	_statusLabel.hidden = NO;
}

#pragma mark -

- (void) viewDidLoad
{
	[self _hideStatus];
	self.navigationController.navigationBar.tintColor = [UIColor blackColor];
	_loginButton.enabled = NO;

	_containerView.layer.cornerRadius = 15;
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
	NSString *currentLanguage = [languages objectAtIndex:0];
	
	NSString *titleString = @"";
	NSString *cancelString = @"";
	NSString *requiredString = @"";
	NSString *userString = @"";
	NSString *passString = @"";
	NSString *statusString = @"";
	
	if ([[currentLanguage lowercaseString] isEqualToString:@"es"]) 
	{
		titleString = @"Twitter";
		cancelString = @"Cancelar";
		requiredString = @"Obligatorio";
		userString = @"Usuario";
		passString = @"Contraseña";
		statusString = @"Autenticando...";
	}
	else
	{
		titleString = @"Twitter";
		cancelString = @"Cancel";
		requiredString = @"Required";
		userString = @"User";
		passString = @"Password";
		statusString = @"Signing in...";
	}

	
	self.title = titleString;//NSLocalizedStringFromTable(@"Login", @"Twitter", @"");
	
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle: cancelString//NSLocalizedStringFromTable(@"Cancel", @"Twitter", @"")
		style: UIBarButtonItemStylePlain target: self action: @selector(cancel)];
	
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle: @"Login"//NSLocalizedStringFromTable(@"Login", @"Twitter", @"")
		style: UIBarButtonItemStyleDone target: self action: @selector(login)];
	
	self.navigationItem.rightBarButtonItem.enabled = NO;
	
	[_usernameTextField addTarget: self action: @selector(updateLoginButton) forControlEvents: UIControlEventEditingChanged];
	_usernameTextField.placeholder = requiredString;//NSLocalizedStringFromTable(@"Required", @"Twitter", @"");
	[_usernameTextField becomeFirstResponder];
	
	[_passwordTextField addTarget: self action: @selector(updateLoginButton) forControlEvents: UIControlEventEditingChanged];
	_passwordTextField.placeholder = requiredString;//NSLocalizedStringFromTable(@"Required", @"Twitter", @"");
	
	[_createAccountButton setTitle: NSLocalizedStringFromTable(@"CreateATwitterAccount", @"Twitter", @"") forState: UIControlStateNormal];
	_createAccountButton.hidden = YES;
	
	_usernameLabel.text = userString;//NSLocalizedStringFromTable(@"Username", @"Twitter", @"");
	_passwordLabel.text = passString;//NSLocalizedStringFromTable(@"Password", @"Twitter", @"");
	_statusLabel.text = statusString;//NSLocalizedStringFromTable(@"SigningIn", @"Twitter", @"");
}

#pragma mark -

- (IBAction) cancel
{
	//self.parentViewController.navigationItem.rightBarButtonItem.enabled = YES;
	[_delegate twitterLoginViewControllerDidCancel: self];
}

- (IBAction) login
{
	[self _hideLoginForm];
	[self _showStatus];
	
	self.navigationItem.rightBarButtonItem.enabled = NO;

	if (_authenticator == nil) {
		_authenticator = [TwitterAuthenticator new];
	}

  _authenticator.consumer = _consumer;
  _authenticator.username = _usernameTextField.text;
  _authenticator.password = _passwordTextField.text;
  _authenticator.delegate = self;

  [_authenticator authenticate];
}

- (IBAction) createAccount
{
}

#pragma mark -

- (BOOL) textFieldShouldReturn: (UITextField*) textField
{
	if (textField == _usernameTextField) {
		[_passwordTextField becomeFirstResponder];
	}
	
	if (textField == _passwordTextField) {
		NSLog(@"Logging in");
	}
	
	return YES;
}

- (void) updateLoginButton
{
	//NSLog(@"Yay");
	self.navigationItem.rightBarButtonItem.enabled = ([_usernameTextField.text length] != 0 && [_passwordTextField.text length] != 0);
}

#pragma mark -

- (void) twitterAuthenticator: (TwitterAuthenticator*) twitterAuthenticator didFailWithError: (NSError*) error;
{
	NSLog(@"TwitterAuthenticatorViewController#twitterAuthenticator: %@ didFailWithError: %@", twitterAuthenticator, error);

	[self _showLoginForm];
	[self _hideStatus];

	[_delegate twitterLoginViewController: self didFailWithError: error];
}

- (void) twitterAuthenticator: (TwitterAuthenticator*) twitterAuthenticator didSucceedWithToken: (TwitterToken*) token
{
	NSLog(@"TwitterAuthenticatorViewController#twitterAuthenticator: %@ didSucceedWithToken: %@", twitterAuthenticator, token);

	[self _showLoginForm];
	[self _hideStatus];
	
	[_delegate twitterLoginViewController: self didSucceedWithToken: token];
}

#pragma mark -

- (void) dealloc
{
	[_authenticator release];
	[super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
    return YES;
}

@end