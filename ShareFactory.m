//
//  ShareBot.m
//  ShareBot
//
//  Created by Sergio on 08/12/10.
//  Copyright 2010 HappyBee. All rights reserved.
//

#import "ShareFactory.h"
#import "SFString+Helper.h"
#import "NSString+SFString.h"
#import "NSMutableArray+Additions.h"

@interface ShareFactory (PrivateMethods)

- (void)action1;
- (void)action2;
- (void)action3;
- (void)action5;
- (void)action6;
- (void)action7;
- (void)action8;
- (void)action9;
- (void)action10;
- (void)action11;
- (void)action12;
- (void)action13;
- (void)initializeTwitter;
- (void)initializeFacebook;

+ (void)createNSExceptionWithreason:(NSString *)reason;
+ (void)checkFieldsSimpleOnService:(SHARE_METHOD)service;
+ (void)assertionFieldsTwitter;
+ (void)assertionFieldsFacebook;
+ (void)assertionFieldsEmail;
+ (void)assertionFieldsClipboard;
+ (void)assertionFieldsOpenSafari;
+ (void)assertionFieldsQR;
+ (void)assertionRIL;
+ (void)assertionInstapaperCredentials;
+ (void)assertionInstapaper;
+ (void)assertionDeliciousData;
+ (void)assertionDeliciousCredentials;
+ (void)assertionCalendar;

@end

@implementation ShareFactory (PrivateMethods)

- (void)action1
{
	[self shareEmailWithSubject:emailSubject withBody:emailBody];
}

- (void)action2
{
	[self shareTwitterWithTweet:self.twitText];
}

- (void)action3
{
	[self shareFacebookWithName:self.nameApp
					 andCaption:self.caption 
				 andDescription:self.description
					   andImage:self.imageURL
						 andURL:self.url];
}

- (void)action5
{
	[self copyToClipboard];
	
	//NSLog(@"Pasteboard: %@", pasteboard.string);
}

- (void)action6
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlSafari]];
}

- (void)action7
{
	//copy url qr to clipboard
    
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
	NSLog(@"%@", [ShareFactory shared].urlQR);
	pasteboard.string = [[ShareFactory shared].urlQR QRUrlRepresentation];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"title", @"")
                                                    message:NSLocalizedString(@"message", @"") 
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"OK", nil];
    
    [alert show];
    [alert release];
    
    //other posibilities
    //UIImage *img1 = [UIImage imageWithData:[[ShareFactory shared].urlSafari QRPNGImageRepresentation] ];
    //UIImage *img2 = [UIImage imageWithData:[[ShareFactory shared].urlSafari QRJPGImageRepresentation]];
}

- (void)action8
{
	[[ShareFactory shared] readItLater];
}

- (void)action9
{
	[[ShareFactory shared] instapaper];
}

- (void)action10
{
	[[ShareFactory shared] calendar];
}

- (void)action11
{
	[[ShareFactory shared] delicious];
}

- (void)action12
{
	[[ShareFactory shared] pinboard];
}

- (void)action13
{
	[[ShareFactory shared] tumblr];
}

- (void)initializeTwitter
{
	twitterConsumerKey = nil;
	twitterConsumerKey = nil;
	twitText = nil;
}

- (void)initializeFacebook
{
	fbSessionKey = nil;
	fbSecretKey = nil;
	nameApp = nil;
	caption = nil;
	description = nil;
	imageURL = nil;
	url = nil;
}

+ (void)assertionStringClipboard
{
	if (([ShareFactory shared].textClipboard == nil) ||
		([[ShareFactory shared].textClipboard isEqualToString:@""]) ||
		([ShareFactory shared].textClipboard == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"textClipboardEmpty", @"")];
}

+ (void)assertionFieldsTwitter
{
	if (([ShareFactory shared].twitterConsumerKey == nil) ||
		([[ShareFactory shared].twitterConsumerKey isEqualToString:@""]) ||
		([ShareFactory shared].twitterConsumerKey == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"twitterConsumerKeyEmpty", @"")];
	
	if (([ShareFactory shared].twitterConsumerKey == nil) ||
		([[ShareFactory shared].twitterConsumerSecret isEqualToString:@""]) || 
		([ShareFactory shared].twitterConsumerSecret == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"twitterConsumerSecretEmpty", @"")];
	
	if (([ShareFactory shared].twitText == nil) || 
		([[ShareFactory shared].twitText isEqualToString:@""]) || ([ShareFactory shared].twitText == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"tweetEmpty", @"")];
	
	if ([[ShareFactory shared].twitText length] > 150)
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"tweetMaxCharacters", @"")];
}

+ (void)assertionFieldsFacebook
{
	if (([ShareFactory shared].fbSessionKey == nil) || 
		([[ShareFactory shared].fbSessionKey isEqualToString:@""]) ||
		([ShareFactory shared].fbSessionKey == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"fbSessionKeyEmpty", @"")];
	
	if (([ShareFactory shared].fbSecretKey == nil) || 
		([[ShareFactory shared].fbSecretKey isEqualToString:@""]) || 
		([ShareFactory shared].fbSecretKey == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"fbSecretKeyEmpty", @"")];
	
	if (([ShareFactory shared].nameApp == nil) ||
		([[ShareFactory shared].nameApp isEqualToString:@""]) || 
		([ShareFactory shared].nameApp == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"nameAppStringEmpty", @"")];
	
	if (([ShareFactory shared].caption == nil) || 
		([[ShareFactory shared].caption isEqualToString:@""]) ||
		([ShareFactory shared].caption == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"captionStringEmpty", @"")];
	
	if (([ShareFactory shared].description == nil) || 
		([[ShareFactory shared].description isEqualToString:@""]) ||
		([ShareFactory shared].description == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"descriptionStringEmpty", @"")];
	
	if (([ShareFactory shared].imageURL == nil) || 
		([[ShareFactory shared].imageURL isEqualToString:@""]) || 
		([ShareFactory shared].imageURL == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"imageURLStringEmpty", @"")];
	
	if (([ShareFactory shared].url == nil) || 
		([[ShareFactory shared].url isEqualToString:@""]) || 
		([ShareFactory shared].url == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"urlStringEmpty", @"")];
	
}

+ (void)assertionFieldsEmail
{
	if (([ShareFactory shared].emailSubject == nil) ||
		([[ShareFactory shared].emailSubject isEqualToString:@""]) || 
		([ShareFactory shared].emailSubject == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"emailSubjectEmpty", @"")];
	
	if (([ShareFactory shared].emailBody == nil) || 
		([[ShareFactory shared].emailBody isEqualToString:@""]) ||
		([ShareFactory shared].emailBody == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"emailBodyEmpty", @"")];
}

+ (void)assertionFieldsClipboard
{
	if (([ShareFactory shared].textClipboard == nil) ||
		([[ShareFactory shared].textClipboard isEqualToString:@""]) ||
		([ShareFactory shared].textClipboard == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"textClipboardEmpty", @"")];
}

+ (void)assertionFieldsOpenSafari
{
	if (([ShareFactory shared].urlSafari == nil) ||
		([[ShareFactory shared].urlSafari isEqualToString:@""]) ||
		([ShareFactory shared].urlSafari == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"urlSafariEmpty", @"")];
	
	
	if (![[ShareFactory shared].urlSafari validateURL])
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"urlSafariBadFormat", @"")];
}

+ (void)assertionFieldsQR
{
    if (([ShareFactory shared].urlQR == nil) ||
		([[ShareFactory shared].urlQR isEqualToString:@""]) ||
		([ShareFactory shared].urlQR == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"urlQREmpty", @"")];
	
	
	if (![[ShareFactory shared].urlQR validateURL])
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"urlQRBadFormat", @"")];
}

+ (void)assertionRIL
{
    if (([ShareFactory shared].urlRIL == nil) ||
		([[ShareFactory shared].urlRIL isEqualToString:@""]) ||
		([ShareFactory shared].urlRIL == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"urlRILEmpty", @"")];
	
	if (![[ShareFactory shared].urlRIL validateURL])
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"urlRILBadFormat", @"")];
	
	if 	(([[ShareFactory shared].urlRIL isEqualToString:@""]) ||
		([ShareFactory shared].urlRIL == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"RILApiKeyEmpty", @"")];
}

+ (void)assertionInstapaperCredentials
{
	if (([ShareFactory shared].userInstapaper == nil) ||
		([[ShareFactory shared].userInstapaper isEqualToString:@""]) || 
		([ShareFactory shared].userInstapaper == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"userInstaEmpty", @"")];
	
	if (([ShareFactory shared].passInstapaper == nil) ||
		([[ShareFactory shared].passInstapaper isEqualToString:@""]) || 
		([ShareFactory shared].passInstapaper == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"passInstaEmpty", @"")];
}

+ (void)assertionInstapaper
{	
	if (([ShareFactory shared].urlInstapaper == nil) ||
		([[ShareFactory shared].urlInstapaper isEqualToString:@""]) ||
		([ShareFactory shared].urlInstapaper == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"urlInstaLEmpty", @"")];
	
	if (![[ShareFactory shared].urlInstapaper validateURL])
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"urlInstaBadFormat", @"")];
}

+ (void)assertionDeliciousCredentials
{
	if (([ShareFactory shared].usernameDeliciousOrPinboard == nil) ||
		([[ShareFactory shared].usernameDeliciousOrPinboard isEqualToString:@""]) || 
		([ShareFactory shared].usernameDeliciousOrPinboard == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"userDeliciousEmpty", @"")];
	
	if (([ShareFactory shared].passDeliciousOrPinboard == nil) ||
		([[ShareFactory shared].passDeliciousOrPinboard isEqualToString:@""]) || 
		([ShareFactory shared].passDeliciousOrPinboard == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"passwordDeliciousEmpty", @"")];
}

+ (void)assertionDeliciousData
{
	if (([ShareFactory shared].urlDeliciousOrPinboard == nil) ||
		([[ShareFactory shared].urlDeliciousOrPinboard isEqualToString:@""]) || 
		([ShareFactory shared].urlDeliciousOrPinboard == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"urlDeliciousEmpty", @"")];
	
	if (([ShareFactory shared].descriptionDeliciousOrPinboard == nil) ||
		([[ShareFactory shared].descriptionDeliciousOrPinboard isEqualToString:@""]) || 
		([ShareFactory shared].descriptionDeliciousOrPinboard == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"descriptionDeliciousEmpty", @"")];
	
	if (([ShareFactory shared].tagsDeliciousOrPinboard == nil) ||
		([[ShareFactory shared].tagsDeliciousOrPinboard count] == 0))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"tagsDeliciousEmpty", @"")];
}

+ (void)assertionCalendar
{

}

+ (void)checkFieldsSimpleOnService:(SHARE_METHOD)service
{
	if (service == -1)
	{
		switch (service) 
		{
			case SHARE_METHOD_EMAIL:
				
				[ShareFactory assertionFieldsEmail];
				
				break;
			case SHARE_METHOD_FACEBOOK:
				
				[ShareFactory assertionFieldsFacebook];
				
				break;
			case SHARE_METHOD_TWITTER:
				
				[ShareFactory assertionFieldsTwitter];
				
				break;
			default:
				break;
		}
	}
	else
	{
		switch (service) 
		{
			case SHARE_METHOD_EMAIL:
				
				[ShareFactory assertionFieldsEmail];
				
				break;
			case SHARE_METHOD_FACEBOOK:
				
				[ShareFactory assertionFieldsFacebook];
				
				break;
			case SHARE_METHOD_TWITTER:
				
				[ShareFactory assertionFieldsTwitter];
				
				break;
			case SHARE_METHOD_OPENSAFARI:
				
				[ShareFactory assertionFieldsOpenSafari];
				
				break;
				
			case SHARE_METHOD_CLIPBOARD:
				
				[ShareFactory assertionFieldsClipboard];
				
				break;
                
            case SHARE_METHOD_QR:
				
				[ShareFactory assertionFieldsQR];
				
				break;
				
			case SHARE_METHOD_RIL:
				
				[ShareFactory assertionRIL];
				
				break;
			case SHARE_METHOD_INSTAPAPER:
				
				[ShareFactory assertionInstapaper];
				
				break;
			case SHARE_METHOD_CALENDAR:
				
				[ShareFactory assertionCalendar];
				
				break;
			
			case SHARE_METHOD_DELICIOUS:
					
				[ShareFactory assertionDeliciousData];
				
				break;
			case SHARE_METHOD_TUMBLR:
				
				break;
			default:
				break;
		}
	}
}

+ (void)createNSExceptionWithreason:(NSString *)reason
{
	@throw [NSException exceptionWithName:NSInvalidArgumentException
                                   reason:reason
                                 userInfo:nil];
}

@end

static ShareFactory *shared = nil;

@implementation ShareFactory
@synthesize delegate;
@synthesize actionSheet;
@synthesize delegateViewController;
@synthesize twitterConsumerKey;
@synthesize twitterConsumerSecret;
@synthesize fbSessionKey;
@synthesize fbSecretKey;
@synthesize emailSubject;
@synthesize emailBody;
@synthesize twitText;
@synthesize nameApp;
@synthesize caption;
@synthesize description;
@synthesize imageURL;
@synthesize url;
@synthesize textClipboard;
@synthesize urlSafari;
@synthesize urlQR;
@synthesize urlRIL;
@synthesize titleRILurl;
@synthesize apiKey;
@synthesize nameOfYourApp;
@synthesize userInstapaper;
@synthesize passInstapaper;
@synthesize urlInstapaper;
@synthesize titleInstapaper;
@synthesize usernameDeliciousOrPinboard;
@synthesize passDeliciousOrPinboard;
@synthesize urlDeliciousOrPinboard;
@synthesize descriptionDeliciousOrPinboard;
@synthesize tagsDeliciousOrPinboard;
@synthesize usernameTumblr;
@synthesize passwordTumblr;
@synthesize startDate;
@synthesize endDate;

#pragma mark -
#pragma mark Singleton methods

+ (ShareFactory *)shared
{
    @synchronized(self)
    {
        if (shared == nil)
            shared = [[ShareFactory alloc] init];
    }
	
    return shared;
}

+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self)
	{
        if (shared == nil)
		{
            shared = [super allocWithZone:zone];
            return shared;  // assignment and return on first allocation
        }
    }
	
    return nil; // on subsequent allocation attempts return nil
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain 
{
    return self;
}

- (NSUInteger)retainCount 
{
    return UINT_MAX;  // denotes an object that cannot be released
}

- (void)release
{
    //do nothing
}

- (id)autorelease 
{
    return self;
}

#pragma mark -
#pragma mark ShareFactory show sharing methods

- (void)createSharingActionSheetWithStyle:(UIActionSheetStyle)style andShareMethods:(NSMutableArray *)methods
{
	int cancelIndex = 0;
	for (int i = 0; i < [methods count]; i++)
	{
		if (([[methods objectAtIndex:i] intValue] != SHARE_METHOD_EMAIL) &&
			([[methods objectAtIndex:i] intValue] != SHARE_METHOD_TWITTER) &&
			([[methods objectAtIndex:i] intValue] != SHARE_METHOD_FACEBOOK) &&
			([[methods objectAtIndex:i] intValue] != SHARE_METHOD_OPENSAFARI) &&
			([[methods objectAtIndex:i] intValue] != SHARE_METHOD_CLIPBOARD) &&
            ([[methods objectAtIndex:i] intValue] != SHARE_METHOD_QR) &&
			([[methods objectAtIndex:i] intValue] != SHARE_METHOD_RIL) &&
			([[methods objectAtIndex:i] intValue] != SHARE_METHOD_INSTAPAPER) &&
			([[methods objectAtIndex:i] intValue] != SHARE_METHOD_DELICIOUS) &&
			([[methods objectAtIndex:i] intValue] != SHARE_METHOD_PINBOARD) &&
			([[methods objectAtIndex:i] intValue] != SHARE_METHOD_TUMBLR) &&
			([[methods objectAtIndex:i] intValue] != SHARE_METHOD_CALENDAR) &&
			([[methods objectAtIndex:i] intValue] != SHARE_METHOD_CANCEL))
		{
			[ShareFactory createNSExceptionWithreason:[NSString stringWithFormat:NSLocalizedString(@"invalidObjectException", @""), [[methods objectAtIndex:i] intValue]]];
		}
		else
		{
			[ShareFactory checkFieldsSimpleOnService:[[methods objectAtIndex:i] intValue]];
		}

		if ([[methods objectAtIndex:i] intValue] == SHARE_METHOD_CANCEL)
		{
			cancelIndex = i;
		}
	}
	
	itemsCustom = [methods retain];
	customShare = YES;
	
	actionSheet = [[UIActionSheet alloc] initWithTitle:NSLocalizedString(@"share", @"")
											  delegate:self 
									 cancelButtonTitle:nil 
								destructiveButtonTitle:nil
									 otherButtonTitles:nil];

	for (int i = 0; i < [methods count]; i++) 
	{
		NSString *title = @"";
		if ([[methods objectAtIndex:i] intValue] == SHARE_METHOD_TWITTER)
		{
			title = @"Twitter";
		}
		else if ([[methods objectAtIndex:i] intValue] == SHARE_METHOD_FACEBOOK)
		{
			title = @"Facebook";
		}
		else if ([[methods objectAtIndex:i] intValue] == SHARE_METHOD_EMAIL)
		{
			title = @"Email";
		}
		else if ([[methods objectAtIndex:i] intValue] == SHARE_METHOD_CLIPBOARD)
		{
			title = NSLocalizedString(@"copyCliboard", @"");
		}
		else if ([[methods objectAtIndex:i] intValue] == SHARE_METHOD_OPENSAFARI)
		{
			title = NSLocalizedString(@"openSafari", @"");
		}
        else if ([[methods objectAtIndex:i] intValue] == SHARE_METHOD_QR)
        {
            title = NSLocalizedString(@"qrLink", @"");
        }
		else if ([[methods objectAtIndex:i] intValue] == SHARE_METHOD_RIL)
        {
            title = @"Read It Later";
        }
		else if ([[methods objectAtIndex:i] intValue] == SHARE_METHOD_INSTAPAPER)
        {
            title = @"Instapaper";
        }
		else if ([[methods objectAtIndex:i] intValue] == SHARE_METHOD_CALENDAR)
        {
            title = NSLocalizedString(@"calendar", @"");
        }
		else if ([[methods objectAtIndex:i] intValue] == SHARE_METHOD_DELICIOUS)
        {
            title = @"Delicious";
        }
		else if ([[methods objectAtIndex:i] intValue] == SHARE_METHOD_PINBOARD)
        {
            title = @"Pinboard";
        }
		else if ([[methods objectAtIndex:i] intValue] == SHARE_METHOD_TUMBLR)
        {
            title = @"Tumblr";
        }
		else
		{
			title = NSLocalizedString(@"cancel", @"");
		}

		NSLog(@"title %@, button %d", title, i);
		
		[actionSheet addButtonWithTitle:title];
    }

	actionSheet.actionSheetStyle = style;

	if ([itemsCustom count] < 8)
		actionSheet.destructiveButtonIndex = cancelIndex;
	
	if ([self.delegate.view hasTabBar])
		[actionSheet showFromTabBar:self.delegateViewController.tabBarController.tabBar];
	else
		[actionSheet showInView:self.delegateViewController.view];

	[actionSheet release];
}

- (void)createSharingActionSheetWithStyle:(UIActionSheetStyle)style
{
	[ShareFactory checkFieldsSimpleOnService:-1];
	
	customShare = NO;
	
	actionSheet = [[UIActionSheet alloc] initWithTitle:NSLocalizedString(@"share", @"")
											  delegate:self cancelButtonTitle:nil 
								destructiveButtonTitle:nil
									 otherButtonTitles:@"Facebook", @"Twitter", @"Email", NSLocalizedString(@"cancel",@""), nil];
	
	actionSheet.actionSheetStyle = style;
	actionSheet.destructiveButtonIndex = 3;	
	[actionSheet showInView:self.delegateViewController.view];
	[actionSheet release];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{	
	if (customShare)
	{
		int value = [[itemsCustom objectAtIndex:buttonIndex] intValue];

		if (value == SHARE_METHOD_CANCEL) return;
		
		NSString *methodName = [@"action" stringByAppendingString:[NSString stringWithFormat:@"%d", value]];
		SEL actionMethod = NSSelectorFromString(methodName);
	
		if ([self respondsToSelector:actionMethod])
			[self performSelector:actionMethod];
	}
	else
	{
		switch (buttonIndex)
		{
			case 0:
				
				//Facebook;
				[self shareFacebookWithName:self.nameApp
								 andCaption:self.caption 
							 andDescription:self.description
								   andImage:self.imageURL
									 andURL:self.url];
				
				break;
				
			case 1:
				
				//Twitter
				[self shareTwitterWithTweet:self.twitText];
				
				break;
				
			case 2:
				
				//Email
				[self shareEmailWithSubject:emailSubject withBody:emailBody];
				
				break;
			default:
				break;
		}
	}
}

#pragma mark -
#pragma mark Twitter sharing methods

- (void)shareTwitterWithTweet:(NSString *)text
{
	if ((twitterConsumerKey == nil) || ([twitterConsumerKey isEqualToString:@""]) || (twitterConsumerKey == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"twitterConsumerKeyEmpty", @"")];
	
	if ((twitterConsumerKey == nil) || ([twitterConsumerSecret isEqualToString:@""]) || (twitterConsumerSecret == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"twitterConsumerSecretEmpty", @"")];
	
	if ((text == nil) || ([text isEqualToString:@""]) || (text == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"tweetEmpty", @"")];
	
	if ([text length] > 150)
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"tweetMaxCharacters", @"")];

	self.twitText = text;
	
	delegateViewController.navigationItem.rightBarButtonItem.enabled = NO;
	
	_consumer = [[TwitterConsumer alloc] initWithKey:twitterConsumerKey secret:twitterConsumerSecret];
	
	NSData* tokenData = [[NSUserDefaults standardUserDefaults] dataForKey: @"Token"];
	if (tokenData != nil)
	{
		_token = (TwitterToken *)[[NSKeyedUnarchiver unarchiveObjectWithData:tokenData] retain];
	}
	
	[[NSUserDefaults standardUserDefaults] removeObjectForKey:@"Token"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	
	[_token release];
	_token = nil;
	
	if (_token == nil)
	{
		twitterLoginViewControllerMain = [[TwitterLoginViewController new] autorelease];
		if (twitterLoginViewControllerMain != nil)
		{
			twitterLoginViewControllerMain.consumer = _consumer;
			twitterLoginViewControllerMain.delegate = self;
			
			UINavigationController* navigationController = [[[UINavigationController alloc] initWithRootViewController: twitterLoginViewControllerMain] autorelease];
			if (navigationController != nil)
			{
				[delegateViewController presentModalViewController: navigationController animated: YES];
			}
		}
	}
}

- (void)twitterLoginViewControllerDidCancel:(TwitterLoginViewController *)twitterLoginViewController
{
	[self initializeTwitter];
	delegateViewController.navigationItem.rightBarButtonItem.enabled = YES;
	[delegateViewController dismissModalViewControllerAnimated: YES];
	[twitterLoginViewController navigationController].navigationItem.rightBarButtonItem.enabled = YES;
}

- (void)twitterLoginViewController:(TwitterLoginViewController *)twitterLoginViewController didSucceedWithToken:(TwitterToken *)token
{	
	_token = [token retain];
	
	// Save the token to the user defaults
	[[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:_token] forKey:@"Token"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	
	// Open the tweet composer and dismiss the login screen
	TwitterComposeViewController* twitterComposeViewController = [[TwitterComposeViewController new] autorelease];
	
	if (twitterComposeViewController != nil)
	{
		TwitterRequest *_request = [[TwitterRequest new] autorelease];
		
		if (_request != nil)
		{
			_request.url = [NSURL URLWithString: @"https://api.twitter.com/1/statuses/update.xml"];
			_request.twitterConsumer = _consumer;
			_request.token = _token;
			_request.method = @"POST";
			_request.parameters = [NSDictionary dictionaryWithObjectsAndKeys:twitText, @"status", nil];
			_request.delegate = self;		
			[_request execute];
		}
	}
}

- (void)twitterRequest:(TwitterRequest *)request didFailWithError:(NSError *)error
{
	[self initializeTwitter];
	delegateViewController.navigationItem.rightBarButtonItem.enabled = YES;
	[delegateViewController dismissModalViewControllerAnimated: YES];
	
	//NSLog(@"Twitter request failed with error:%@", error);
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
	NSString *currentLanguage = [languages objectAtIndex:0];
	
	UIAlertView *alert = nil;
	
	if ([[currentLanguage lowercaseString] isEqualToString:@"es"]) 
	{
		alert = [[UIAlertView alloc] initWithTitle:@"¡Error!" 
										   message:@"¡Error al postear el tweet! Por favor inténtelo más tarde"
										  delegate:nil 
								 cancelButtonTitle:@"OK" 
								 otherButtonTitles: nil];
	}
	else 
	{
		alert = [[UIAlertView alloc] initWithTitle:@"¡Error!" 
										   message:@"Tweet error! Please try again later"
										  delegate:nil 
								 cancelButtonTitle:@"OK" 
								 otherButtonTitles: nil];
	}
	
	if ([self.delegate respondsToSelector:@selector(twitterDidFail:withAlert:)]) 
	{
		[twitterLoginViewControllerMain navigationController].navigationItem.rightBarButtonItem.enabled = YES;
		[self.delegate twitterDidFail:request withAlert:alert];
	}
	
	[alert release];
}

- (void)twitterRequest:(TwitterRequest *)request didFinishLoadingData:(NSData*)data
{
	//NSLog(@"Twitter request succeeded");
	
	[self initializeTwitter];
	delegateViewController.navigationItem.rightBarButtonItem.enabled = YES;
	[delegateViewController dismissModalViewControllerAnimated: YES];
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
	NSString *currentLanguage = [languages objectAtIndex:0];
	
	UIAlertView *alert = nil;
	
	if ([[currentLanguage lowercaseString] isEqualToString:@"es"]) 
	{
		alert = [[UIAlertView alloc] initWithTitle:@"Info" 
										   message:@"¡Tweet enviado correctamente!"
										  delegate:nil 
								 cancelButtonTitle:@"OK" 
								 otherButtonTitles: nil];
		[alert show];	
	}
	else 
	{
		alert = [[UIAlertView alloc] initWithTitle:@"Info" 
										   message:@"The tweet was successfully sent!"
										  delegate:nil 
								 cancelButtonTitle:@"OK" 
								 otherButtonTitles: nil];
		[alert show];	
	}
	
	if ([self.delegate respondsToSelector:@selector(twitterEndedSuccessfully:)]) 
	{
		[self.delegate twitterEndedSuccessfully:request withAlert:alert];
	}
	
	[alert release];
}

- (void)twitterLoginViewController:(TwitterLoginViewController*) twitterLoginViewController didFailWithError:(NSError*)error
{
	[self initializeTwitter];
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
	NSString *currentLanguage = [languages objectAtIndex:0];
	
	UIAlertView *alert = nil;
	
	if ([[currentLanguage lowercaseString] isEqualToString:@"es"]) 
	{
		alert = [[UIAlertView alloc] initWithTitle:@"¡Error!" 
										   message:@"¡Error al enviar el tweet!"
										  delegate:nil 
								 cancelButtonTitle:@"OK" 
								 otherButtonTitles: nil];
		[alert show];	
	}
	else 
	{
		alert = [[UIAlertView alloc] initWithTitle:@"Error!" 
										   message:@"Tweet sending error!"
										  delegate:nil 
								 cancelButtonTitle:@"OK" 
								 otherButtonTitles: nil];
		[alert show];	
	}
	
	if ([self.delegate respondsToSelector:@selector(twitterDidFail:withAlert:)]) 
	{
		[self.delegate twitterDidFail:nil withAlert:alert];
	}
	
	delegateViewController.navigationItem.rightBarButtonItem.enabled = YES;
	[delegateViewController dismissModalViewControllerAnimated: YES];
	[alert release];
	
	//NSLog(@"twitterLoginViewController: %@ didFailWithError: %@", self, error);
}

- (void) twitterComposeViewControllerDidCancel: (TwitterComposeViewController*) twitterComposeViewController
{
	[self initializeTwitter];
	delegateViewController.navigationItem.rightBarButtonItem.enabled = YES;
	[delegateViewController dismissModalViewControllerAnimated: YES];
}

- (void) twitterComposeViewControllerDidSucceed: (TwitterComposeViewController*) twitterComposeViewController
{
	[self initializeTwitter];
	delegateViewController.navigationItem.rightBarButtonItem.enabled = YES;
	[delegateViewController dismissModalViewControllerAnimated: YES];
}

- (void) twitterComposeViewController: (TwitterComposeViewController*) twitterComposeViewController didFailWithError: (NSError*) error
{
	[self initializeTwitter];
	delegateViewController.navigationItem.rightBarButtonItem.enabled = YES;
	[delegateViewController dismissModalViewControllerAnimated: YES];
}

#pragma mark -
#pragma mark Facebook sharing methods

- (void)shareFacebookWithName:(NSString *)nameAppString
				   andCaption:(NSString *)captionString
			   andDescription:(NSString *)descriptionString
					 andImage:(NSString *)imageURLString 
					   andURL:(NSString *)urlString
{
	
	if ((fbSessionKey == nil) || ([fbSessionKey isEqualToString:@""]) || (fbSessionKey == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"fbSessionKeyEmpty", @"")];
	
	if ((fbSecretKey == nil) || ([fbSecretKey isEqualToString:@""]) || (fbSecretKey == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"fbSecretKeyEmpty", @"")];
	
	if ((nameAppString == nil) || ([nameAppString isEqualToString:@""]) || (nameAppString == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"nameAppStringEmpty", @"")];
	
	if ((captionString == nil) || ([captionString isEqualToString:@""]) || (captionString == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"captionStringEmpty", @"")];
	
	if ((descriptionString == nil) || ([descriptionString isEqualToString:@""]) || (descriptionString == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"descriptionStringEmpty", @"")];
	
	if ((imageURLString == nil) || ([imageURLString isEqualToString:@""]) || (imageURLString == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"imageURLStringEmpty", @"")];
	
	if ((urlString == nil) || ([urlString isEqualToString:@""]) || (urlString == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"urlStringEmpty", @"")];
	
	self.nameApp = nameAppString;
	self.caption = captionString;
	self.description = descriptionString;
	self.imageURL = imageURLString;
	self.url = urlString;
	
	sessionfb = [[FBSession sessionForApplication:fbSessionKey
										   secret:fbSecretKey
										 delegate:self] retain];
	if (![sessionfb isConnected]) 
	{
		FBLoginDialog *dialogLogin = [[[FBLoginDialog alloc] init] autorelease];	
		[dialogLogin show];
	}
}

- (void)session:(FBSession*)session didLogin:(FBUID)uid 
{
	NSString* fql = [NSString stringWithFormat:@"select uid,name from user where uid == %lld", session.uid];
	NSDictionary* params = [NSDictionary dictionaryWithObject:fql forKey:@"query"];
	[[FBRequest requestWithDelegate:self] call:@"facebook.fql.query" params:params];
}

- (void)request:(FBRequest*)request didLoad:(id)result
{
	if ([request.method isEqualToString:@"facebook.fql.query"])
	{
		FBStreamDialog* dialog = [[[FBStreamDialog alloc] init] autorelease];
		dialog.userMessagePrompt = @"Message:";
	
		dialog.attachment = [NSString stringWithFormat:@"{\"name\":\"%@\",\"href\":\"\",\"caption\":\"%@\",\"description\":\"%@\",\"media\":[{\"type\":\"image\",\"src\":\"%@\",\"href\":\"%@\"}]}", nameApp, caption, description, imageURL, url];
		 
		[dialog show];
		
		[self initializeFacebook];
		
		if ([self.delegate respondsToSelector:@selector(facebookDidFinishWithSuccess:withResult:)]) 
		{
			[self.delegate facebookDidFinishWithSuccess:request withResult:result];
		}
	}
}

#pragma mark -
#pragma mark Email sharing methods

- (void)shareEmailWithSubject:(NSString *)emailSubjectString withBody:(NSString *)emailBodyString
{
	if ((emailSubjectString == nil) || ([emailSubjectString isEqualToString:@""]) || (emailSubjectString == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"emailSubjectEmpty", @"")];
	
	if ((emailBodyString == nil) || ([emailBodyString isEqualToString:@""]) || (emailBodyString == @""))
		[ShareFactory createNSExceptionWithreason:NSLocalizedString(@"emailBodyEmpty", @"")];
	
	email = [[MFMailComposeViewController alloc] init];
	email.mailComposeDelegate = self;
	email.navigationBar.tintColor = [UIColor blackColor];
	email.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
	email.delegate = self;
	
	[email setSubject:emailSubjectString];
	[email setMessageBody:emailBodyString isHTML:YES];
	[delegateViewController presentModalViewController:email animated:YES];	
	[[[[email navigationBar] items] objectAtIndex:0] setTitle:@""];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error 
{	
	[delegateViewController dismissModalViewControllerAnimated:YES];
	
	emailSubject = nil;
	emailBody = nil;
	
	if ([self.delegate respondsToSelector:@selector(mailComposeController:didFinishWithResult:withError:)])
	{
		[self.delegate mailComposeController:controller didFinishWithResult:result withError:error];
	}
}

#pragma mark -
#pragma mark Clipboard

- (void)copyToClipboard
{
	[ShareFactory assertionStringClipboard];
	
	UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
	
	pasteboard.string = textClipboard;
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"titleClipboard", @"")
                                                    message:NSLocalizedString(@"messageClipboard", @"") 
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"OK", nil];
    
    [alert show];
    [alert release];
	
	//NSLog(@"Pasteboard: %@", pasteboard.string);
}

#pragma mark -
#pragma mark Open in Safari

- (void)openInSafari
{
	[ShareFactory assertionFieldsOpenSafari];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlSafari]];
}

#pragma mark -
#pragma mark QR Methods

- (NSString *)generateQRURLString
{
	[ShareFactory assertionFieldsQR];
	
    return [[ShareFactory shared].urlQR QRUrlRepresentation];
}

- (NSData *)generateQRJPGFormat
{
	[ShareFactory assertionFieldsQR];
	
    return [[ShareFactory shared].urlQR QRJPGImageRepresentation];
}

- (NSData *)generateQRPNGFormat
{
	[ShareFactory assertionFieldsQR];
	
    return [[ShareFactory shared].urlQR QRPNGImageRepresentation];
}

#pragma mark -
#pragma mark Read It Later

- (BOOL)readItLater
{
	@try 
	{
		[ShareFactory assertionRIL];
		
		[ReadItLater save:[NSURL URLWithString:[ShareFactory shared].urlRIL] 
					title:[ShareFactory shared].titleRILurl
				 delegate:self.delegate];
		
		[ReadItLaterFull showUserSetup];
	}
	@catch (NSException * e) 
	{
		return NO;
	}
	
	return YES;
}

- (void)readItLaterLoginFinished:(NSString *)stringResponse error:(NSString *)errorString
{
	if (![errorString containsString:@"null"])
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"loginErrorTitle", @"")
														message:NSLocalizedString(@"loginErrorMessage", @"")
													   delegate:nil
											  cancelButtonTitle:nil
											  otherButtonTitles:@"OK", nil];
		
		[alert show];
		[alert release];
	}
	
	if ([self.delegate respondsToSelector:@selector(readItLaterLoginFinished:error:)]) 
	{
		[self.delegate readItLaterLoginFinished:stringResponse error:errorString];
	}
}

- (void)readItLaterSignupFinished:(NSString *)stringResponse error:(NSString *)errorString
{
	if (![errorString containsString:@"null"])
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"signUpErrorTitle", @"")
														message:NSLocalizedString(@"signUpErrorMessage", @"")
													   delegate:nil
											  cancelButtonTitle:nil
											  otherButtonTitles:@"OK", nil];
		
		[alert show];
		[alert release];
	}
	
	if ([self.delegate respondsToSelector:@selector(readItLaterSignupFinished:error:)])
	{
		[self.delegate readItLaterSignupFinished:stringResponse error:errorString];
	}
}

- (void)readItLaterSaveFinished:(NSString *)stringResponse error:(NSString *)errorString
{
	if (![errorString containsString:@"null"])
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"saveErrorTitle", @"")
														message:NSLocalizedString(@"saveErrorMessage", @"")
													   delegate:nil
											  cancelButtonTitle:nil
											  otherButtonTitles:@"OK", nil];
		
		[alert show];
		[alert release];
	}
	
	if ([self.delegate respondsToSelector:@selector(readItLaterSaveFinished:error:)])
	{
		[self.delegate readItLaterSaveFinished:stringResponse error:errorString];
	}
}

#pragma mark -
#pragma mark Instapaper

- (void)instapaper
{	
	[self performSelector:@selector(showModal) withObject:nil afterDelay:0.1];
}

- (void)showModal
{
	InstapaperGUI *gui = [[InstapaperGUI alloc] initWithNibName:@"InstapaperGUI" bundle:nil];
	gui.delegate = self;
	
	UINavigationController *controller = [[UINavigationController alloc] initWithRootViewController:gui];
	controller.navigationBar.barStyle = UIBarStyleBlackOpaque;
	[self.delegate presentModalViewController:controller animated:YES];						
	[gui release];
	[controller release];
}

#pragma mark -
#pragma mark InstapaperGUIDelegate method

- (void)userWantsToLoginWithUsername:(NSString *)username password:(NSString *)password object:(id)object
{
	[ShareFactory shared].userInstapaper = username;
	[ShareFactory shared].passInstapaper = password;
	
	[ShareFactory assertionInstapaperCredentials];
	[ShareFactory assertionInstapaper];
	
	NSString *response = [Instapaper sharedURL:[ShareFactory shared].urlInstapaper
									  username:[ShareFactory shared].userInstapaper
									  password:[ShareFactory shared].passInstapaper
										 title:[ShareFactory shared].titleInstapaper];
	
	if ([self.delegate respondsToSelector:@selector(responseOnInstaPaper:)])
	{
		[self.delegate responseOnInstaPaper:response];
	}
}

#pragma mark -
#pragma mark InstapaperGUIDelegate method

- (void)googleReader
{
	
}

#pragma mark -
#pragma mark Delicious 

- (void)delicious
{
	[ShareFactory assertionDeliciousData];
	
	[self performSelector:@selector(showModalDelicious) withObject:nil afterDelay:0.1];
}

- (void)showModalDelicious
{
	DeliciousView *gui = [[DeliciousView alloc] initWithNibName:@"DeliciousView" bundle:nil];
	gui.delegate = self;
	gui.isDelicious = YES;
	
	UINavigationController *controller = [[UINavigationController alloc] initWithRootViewController:gui];
	controller.navigationBar.barStyle = UIBarStyleBlackOpaque;
	[self.delegate presentModalViewController:controller animated:YES];						
	[gui release];
	[controller release];
}

- (void)deliciousDidRequestWithUsername:(NSString *)user andPassword:(NSString *)pass isDeliciousService:(BOOL)isDelicious
{
	[ShareFactory assertionDeliciousCredentials];
	
	BOOL status = [Delicious performDeliciousRequestWithUser:[ShareFactory shared].usernameDeliciousOrPinboard
													password:[ShareFactory shared].passDeliciousOrPinboard
												urlDelicious:[ShareFactory shared].urlDeliciousOrPinboard
												 description:[ShareFactory shared].descriptionDeliciousOrPinboard
														tags:[ShareFactory shared].tagsDeliciousOrPinboard
											activatePinboard:isDelicious];
	
	UIAlertView *alert = nil;
	
	if ([self.delegate respondsToSelector:@selector(responseDelicious:)])
	{
		if (isDelicious) 
		{
			if (status)
			{
				[self.delegate responseDelicious:NSLocalizedString(@"deliciousSuccess", @"")];
				
				alert = [[[UIAlertView alloc] initWithTitle:@"" 
													message:NSLocalizedString(@"deliciousSuccess", @"")
												   delegate:nil 
										  cancelButtonTitle:nil otherButtonTitles:@"OK", nil] autorelease];
			}
			else
			{
				[self.delegate responseDelicious:NSLocalizedString(@"deliciousError", @"")];
				
				alert = [[[UIAlertView alloc] initWithTitle:@"" 
													message:NSLocalizedString(@"deliciousError", @"")
												   delegate:nil 
										  cancelButtonTitle:nil otherButtonTitles:@"OK", nil] autorelease];
			}
			
			[alert show];
		}
		else
		{
			if (status)
			{
				[self.delegate responsePinboard:NSLocalizedString(@"pinboardSuccess", @"")];
				
				alert = [[[UIAlertView alloc] initWithTitle:@"" 
													message:NSLocalizedString(@"pinboardSuccess", @"")
												   delegate:nil 
										  cancelButtonTitle:nil otherButtonTitles:@"OK", nil] autorelease];
			}
			else
			{
				[self.delegate responsePinboard:NSLocalizedString(@"pinboardError", @"")];
				
				alert = [[[UIAlertView alloc] initWithTitle:@"" 
													message:NSLocalizedString(@"pinboardError", @"")
												   delegate:nil 
										  cancelButtonTitle:nil otherButtonTitles:@"OK", nil] autorelease];
			}
			
			[alert show];
		}
	}
}

#pragma mark -
#pragma mark Pinboard

- (void)pinboard
{
	[ShareFactory assertionDeliciousData];
	
	[self performSelector:@selector(showModalPinboard) withObject:nil afterDelay:0.1];
}

- (void)showModalPinboard
{
	Pinboard *gui = [[Pinboard alloc] initWithNibName:@"DeliciousView" bundle:nil];
	gui.delegate = self;
	gui.isDelicious = NO;
	
	UINavigationController *controller = [[UINavigationController alloc] initWithRootViewController:gui];
	controller.navigationBar.barStyle = UIBarStyleBlackOpaque;
	[self.delegate presentModalViewController:controller animated:YES];						
	[gui release];
	[controller release];
}

#pragma mark -
#pragma mark Tumblr 

- (void)tumblr
{
	[self performSelector:@selector(showModalTumblr) withObject:nil afterDelay:0.1];
}

- (void)showModalTumblr
{
	TumblrView *gui = [[TumblrView alloc] initWithNibName:@"TumblrView" bundle:nil];
	gui.delegate = self;
	
	UINavigationController *controller = [[UINavigationController alloc] initWithRootViewController:gui];
	controller.navigationBar.barStyle = UIBarStyleBlackOpaque;
	[self.delegate presentModalViewController:controller animated:YES];						
	[gui release];
	[controller release];
}

- (void)tumblrDidRequestWithUsername:(NSString *)user andPassword:(NSString *)pass
{
	UIAlertView *alert = nil;
	
	int result = [Tumblr postRequestForTumblr];
	
	if ([self.delegate respondsToSelector:@selector(responseTumblr:)])
	{
		if (result == 201)
		{
			[self.delegate responseTumblr:NSLocalizedString(@"tumblrSuccess", @"")];
			
			alert = [[[UIAlertView alloc] initWithTitle:@"" 
												message:NSLocalizedString(@"tumblrSuccess", @"")
											   delegate:nil 
									  cancelButtonTitle:nil otherButtonTitles:@"OK", nil] autorelease];
		}
		else
		{
			[self.delegate responseTumblr:NSLocalizedString(@"tumblrError", @"")];
			
			alert = [[[UIAlertView alloc] initWithTitle:@"" 
												message:NSLocalizedString(@"tumblrError", @"")
											   delegate:nil 
									  cancelButtonTitle:nil otherButtonTitles:@"OK", nil] autorelease];
		}
		
		[alert show];
	}
}

#pragma mark -
#pragma mark Calendar

- (void)calendar
{
	//[ShareFactory assertionCalendar];
	
	EKEventEditViewController *calendarController = [[EKEventEditViewController alloc] initWithNibName:nil bundle:nil];
	
	EKEventStore *eventStore = [[EKEventStore alloc] init];

    EKEvent *eventItem  = [EKEvent eventWithEventStore:eventStore];
    eventItem.startDate = (startDate == nil) ? [NSDate date] : startDate;
    eventItem.endDate = (endDate == nil) ? [NSDate date] : endDate;
    [eventItem setCalendar:[eventStore defaultCalendarForNewEvents]];
	
	NSError *err = nil;
    [eventStore saveEvent:eventItem span:EKSpanThisEvent error:&err];
	
	calendarController.eventStore = eventStore;
	calendarController.editViewDelegate = self;

	[self.delegate presentModalViewController:calendarController animated:YES];	
	[calendarController release];
}

#pragma mark -
#pragma mark EKEventEditViewDelegate

- (void)eventEditViewController:(EKEventEditViewController *)controller didCompleteWithAction:(EKEventEditViewAction)action
{	
	NSError *error = nil;
	EKEvent *thisEvent = controller.event;
	
	switch (action) 
	{
		case EKEventEditViewActionCanceled:
			
			break;
		case EKEventEditViewActionSaved:

			[controller.eventStore saveEvent:controller.event span:EKSpanThisEvent error:&error];

			break;
		case EKEventEditViewActionDeleted:

			[controller.eventStore removeEvent:thisEvent span:EKSpanThisEvent error:&error];

			break;
		default:
			break;
	}

	if ([self.delegate respondsToSelector:@selector(eventEditViewController:didCompleteWithAction:)]) 
	{
		[self.delegate eventEditViewController:controller didCompleteWithAction:action];
	}
	
	[controller dismissModalViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark Other stuff

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
    return YES;
}

- (void) dealloc
{
	[email release];
	[super dealloc];
}

@end