//
//  ShareFactorySTNDALNViewController.m
//  ShareFactorySTNDALN
//
//  Created by Sergio on 07/01/11.
//  Copyright HappyBee 2011. All rights reserved.
//

#import "ShareFactorySTNDALNViewController.h"

@implementation ShareFactorySTNDALNViewController

- (void)viewDidLoad 
{
    [super viewDidLoad];
	[[ShareFactory shared] setDelegate:self];
	[[ShareFactory shared] setDelegateViewController:self];
	
	UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	shareButton.frame = CGRectMake(10, 100, 150, 30);
	[shareButton setTitle:@"Share Simple" forState:UIControlStateNormal];
	[shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[shareButton addTarget:self action:@selector(triggerSimpleSharing) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:shareButton];

	UIButton *shareButton3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	shareButton3.frame = CGRectMake(10, 150, 150, 30);
	[shareButton3 setTitle:@"Share Twitter" forState:UIControlStateNormal];
	[shareButton3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[shareButton3 addTarget:self action:@selector(triggerShareTwitter) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:shareButton3];
	
	UIButton *shareButton4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	shareButton4.frame = CGRectMake(10, 200, 150, 30);
	[shareButton4 setTitle:@"Share Facebook" forState:UIControlStateNormal];
	[shareButton4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[shareButton4 addTarget:self action:@selector(triggerShareFacebook) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:shareButton4];
	
	UIButton *shareButton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	shareButton2.frame = CGRectMake(10, 250, 150, 30);
	[shareButton2 setTitle:@"Share Email" forState:UIControlStateNormal];
	[shareButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[shareButton2 addTarget:self action:@selector(triggerShareEmail) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:shareButton2];
	
	UIButton *shareButton5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	shareButton5.frame = CGRectMake(10, 300, 150, 30);
	[shareButton5 setTitle:@"Share Custom" forState:UIControlStateNormal];
	[shareButton5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[shareButton5 addTarget:self action:@selector(triggerCustom) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:shareButton5];
	
	UIButton *shareButton6 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	shareButton6.frame = CGRectMake(10, 350, 150, 30);
	[shareButton6 setTitle:@"Copy to clipboard" forState:UIControlStateNormal];
	[shareButton6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[shareButton6 addTarget:self action:@selector(triggerCopyClipboard) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:shareButton6];
	
	UIButton *shareButton7 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	shareButton7.frame = CGRectMake(10, 400, 150, 30);
	[shareButton7 setTitle:@"Open in Safari" forState:UIControlStateNormal];
	[shareButton7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[shareButton7 addTarget:self action:@selector(triggerOpenSafari) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:shareButton7];
    
    UIButton *shareButton8 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	shareButton8.frame = CGRectMake(10, 50, 150, 30);
	[shareButton8 setTitle:@"Generate QR" forState:UIControlStateNormal];
	[shareButton8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[shareButton8 addTarget:self action:@selector(triggerGenerateQR) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:shareButton8];
	
	UIButton *shareButton9 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	shareButton9.frame = CGRectMake(165, 50, 150, 30);
	[shareButton9 setTitle:@"Read It later" forState:UIControlStateNormal];
	[shareButton9 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[shareButton9 addTarget:self action:@selector(triggerRIL) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:shareButton9];
	
	UIButton *shareButton10 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	shareButton10.frame = CGRectMake(165, 400, 150, 30);
	[shareButton10 setTitle:@"Instapaper" forState:UIControlStateNormal];
	[shareButton10 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[shareButton10 addTarget:self action:@selector(triggerInstapaper) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:shareButton10];
	
	UIButton *shareButton11 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	shareButton11.frame = CGRectMake(165, 100, 150, 30);
	[shareButton11 setTitle:@"Delicious" forState:UIControlStateNormal];
	[shareButton11 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[shareButton11 addTarget:self action:@selector(triggerDelicious) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:shareButton11];
	
	UIButton *shareButton12 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	shareButton12.frame = CGRectMake(165, 150, 150, 30);
	[shareButton12 setTitle:@"Pinboard" forState:UIControlStateNormal];
	[shareButton12 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[shareButton12 addTarget:self action:@selector(triggerPinboard) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:shareButton12];
	
	UIButton *shareButton13 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	shareButton13.frame = CGRectMake(165, 200, 150, 30);
	[shareButton13 setTitle:@"Tumblr" forState:UIControlStateNormal];
	[shareButton13 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[shareButton13 addTarget:self action:@selector(triggerTumblr) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:shareButton13];
	
	UIButton *shareButton14 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	shareButton14.frame = CGRectMake(165, 250, 150, 30);
	[shareButton14 setTitle:@"Calendar" forState:UIControlStateNormal];
	[shareButton14 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[shareButton14 addTarget:self action:@selector(triggerCalendar) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:shareButton14];
}

- (void)triggerCalendar
{
	[[ShareFactory shared] setStartDate:[NSDate date]];
	[[ShareFactory shared] setEndDate:[NSDate date]];
	[[ShareFactory shared] setDelegate:self]; //optional
	[[ShareFactory shared] calendar];
}

- (void)triggerTumblr
{
	[Tumblr sharedTumblr].type = TUMBLR_TYPE_POST_REGULAR;
	[Tumblr sharedTumblr].statePOST = TUMBRL_STATE_PUBLISHED;
	[Tumblr sharedTumblr].regularTitle = @"Sample title post";
	[Tumblr sharedTumblr].regularBody = @"Sample body post";
	[[ShareFactory shared] tumblr];
}

- (void)triggerPinboard
{
	[ShareFactory shared].urlDeliciousOrPinboard = @"http://www.apple.com";
	[ShareFactory shared].descriptionDeliciousOrPinboard = @"APPL url nice to see";
	[ShareFactory shared].tagsDeliciousOrPinboard = [NSArray arrayWithObjects:@"apple", @"iphone", @"macbook", @"itunes", nil];
	[ShareFactory shared].delegate = self; //optional
	
	[[ShareFactory shared] pinboard];
}

- (void)triggerDelicious
{
	[ShareFactory shared].urlDeliciousOrPinboard = @"http://www.apple.com";
	[ShareFactory shared].descriptionDeliciousOrPinboard = @"APPL url nice to see";
	[ShareFactory shared].tagsDeliciousOrPinboard = [NSArray arrayWithObjects:@"apple", @"iphone", @"macbook", @"itunes", nil];
	[ShareFactory shared].delegate = self; //optional

	[[ShareFactory shared] delicious];
}

- (void)triggerInstapaper
{
	[ShareFactory shared].urlInstapaper = @"http://www.apple.com";
	[ShareFactory shared].titleInstapaper = @"APPL url"; //optional
	[ShareFactory shared].delegate = self; //needed
	
	[[ShareFactory shared] instapaper];
}

- (void)triggerRIL
{
	[ShareFactory shared].apiKey = @"5a2A5ma3dQ9cpK852cpf3c9ie1T0L656";
	[ShareFactory shared].urlRIL = @"http://www.apple.com";
	[ShareFactory shared].titleRILurl = @"APPL url"; //optional
	[ShareFactory shared].nameOfYourApp = @"ShareFactory Demo"; // optional
	[ShareFactory shared].delegate = self;
	
	[[ShareFactory shared] readItLater];
}

- (void)triggerGenerateQR
{
    [ShareFactory shared].urlQR = @"http://www.apple.com";
	NSString *str = [[[ShareFactory shared] generateQRURLString] urlShortener];
    
	NSLog(@"URL QR: %@", str);
	
    //other options
	NSData *img = [[ShareFactory shared] generateQRJPGFormat]; //generate NSData for UIImage
	
	if (img != nil)
	{
		NSLog(@"img JPG not nil");
	}
	else
	{
		NSLog(@"img JPG nil");
	}

	NSData *img2 = [[ShareFactory shared] generateQRPNGFormat]; //generate NSData for UIImage
	
	if (img2 != nil)
	{
		NSLog(@"img2 PNG not nil");
	}
	else
	{
		NSLog(@"img2 PNG nil");
	}
	
	UIViewController *result = [[UIViewController alloc] init];
	result.view.backgroundColor = [UIColor lightGrayColor];
	result.title = @"QR Generation";
	
	UILabel *urlQR = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 320, 30)];
	urlQR.text = str;
	urlQR.backgroundColor = [UIColor clearColor];
	urlQR.adjustsFontSizeToFitWidth = YES;
	urlQR.textAlignment = UITextAlignmentCenter;
	[result.view addSubview:urlQR];
	[urlQR release];
	
	UILabel *QRLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 320, 30)];
	QRLabel.text = @"JPG QR Image";
	QRLabel.backgroundColor = [UIColor clearColor];
	QRLabel.textAlignment = UITextAlignmentCenter;
	[result.view addSubview:QRLabel];
	[QRLabel release];
	
	UIImageView *qrJPG = [[UIImageView alloc] initWithImage:[UIImage imageWithData:img]];
	qrJPG.frame = CGRectMake(120, 100, 70, 70);
	
	[result.view addSubview:qrJPG];
	[qrJPG release];
	
	QRLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 180, 320, 30)];
	QRLabel.text = @"PNG QR Image";
	QRLabel.backgroundColor = [UIColor clearColor];
	QRLabel.textAlignment = UITextAlignmentCenter;
	[result.view addSubview:QRLabel];
	[QRLabel release];
	
	UIImageView *qrPNG = [[UIImageView alloc] initWithImage:[UIImage imageWithData:img2]];
	qrPNG.frame = CGRectMake(120, 220, 70, 70);
	[result.view addSubview:qrPNG];
	[qrPNG release];
	
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:result];
	navController.navigationBar.barStyle = UIBarStyleBlackOpaque;
	
	UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"cancel", @"")
																	 style:UIBarButtonItemStylePlain 
																	target:self
																	action:@selector(close)];
	result.navigationItem.leftBarButtonItem = cancelButton;
	[cancelButton release];
	
	[self presentModalViewController:navController animated:YES];
	[navController release];
	[result release];
}

- (void)close
{
	[self dismissModalViewControllerAnimated:YES];
}

- (void)triggerCopyClipboard
{
	[[ShareFactory shared] setTextClipboard:@"Hi!\nThis is a proof from ShareFactory library on clipboard"];
	[[ShareFactory shared] copyToClipboard];
}

- (void)triggerOpenSafari
{
	[[ShareFactory shared] setUrlSafari:@"http://www.apple.com"];
	[[ShareFactory shared] openInSafari];
}

- (void)triggerCustom
{
	//Twitter
	[[ShareFactory shared] setTwitterConsumerSecret:@""];
	[[ShareFactory shared] setTwitterConsumerKey:@""];
	
	NSString *tweet = [NSString stringWithFormat:@"This is a test on ShareFactory %@", [@"http://www.apple.com" urlShortener]];
	[[ShareFactory shared] setTwitText:tweet];
	
	//Facebook
	[[ShareFactory shared] setNameApp:@"ShareFactory"];
	[[ShareFactory shared] setCaption:@"Test from ShareFactory"];
	[[ShareFactory shared] setDescription:@"This a long caption for testing purposes with ShareFactory"];
	[[ShareFactory shared] setImageURL:@"http://img.xataka.com/2007/01/iphone%20apple.png"];
	[[ShareFactory shared] setUrl:[@"http://www.apple.com" urlShortener]];
	[[ShareFactory shared] setFbSecretKey:@""];
	[[ShareFactory shared] setFbSessionKey:@""];
	
	//Email
	[[ShareFactory shared] setEmailSubject:@"ShareFactory usage email example"];
	[[ShareFactory shared] setEmailBody:@"Hi!\nThis is a proof from ShareFactory library"];
	
	//Clipboard - Open Safari
	[[ShareFactory shared] setTextClipboard:@"Hi!\nThis is a proof from ShareFactory library on clipboard"];
	[[ShareFactory shared] setUrlSafari:@"http://www.apple.com"];
	
	//QR (Copy to clipboard)
    [[ShareFactory shared] setUrlQR:@"http://www.apple.com"];
    
	//Read It Later
	[ShareFactory shared].apiKey = @"5a2A5ma3dQ9cpK852cpf3c9ie1T0L656";
	[ShareFactory shared].urlRIL = @"http://www.apple.com";
	[ShareFactory shared].titleRILurl = @"APPL url 2"; //optional
	[ShareFactory shared].nameOfYourApp = @"ShareFactory Demo"; // optional
	[ShareFactory shared].delegate = self; // optional
	
	//Instapaper
	[ShareFactory shared].urlInstapaper = @"http://www.apple.com";
	[ShareFactory shared].titleInstapaper = @"APPL url"; //optional
	[ShareFactory shared].delegate = self; //needed
	
	//Delicious
	[ShareFactory shared].urlDeliciousOrPinboard = @"http://www.apple.com";
	[ShareFactory shared].descriptionDeliciousOrPinboard = @"APPL url nice to see";
	[ShareFactory shared].tagsDeliciousOrPinboard = [NSArray arrayWithObjects:@"apple", @"iphone", @"macbook", @"itunes", nil];
	[ShareFactory shared].delegate = self; //optional
	
	//Pinboard
	[ShareFactory shared].urlDeliciousOrPinboard = @"http://www.apple.com";
	[ShareFactory shared].descriptionDeliciousOrPinboard = @"APPL url nice to see";
	[ShareFactory shared].tagsDeliciousOrPinboard = [NSArray arrayWithObjects:@"apple", @"iphone", @"macbook", @"itunes", nil];
	[ShareFactory shared].delegate = self; //optional
	
	[[ShareFactory shared] pinboard];
	
	//Tumblr
	[Tumblr sharedTumblr].type = TUMBLR_TYPE_POST_REGULAR;
	[Tumblr sharedTumblr].statePOST = TUMBRL_STATE_PUBLISHED;
	[Tumblr sharedTumblr].regularTitle = @"Sample title post";
	[Tumblr sharedTumblr].regularBody = @"Sample body post";
	
	[[ShareFactory shared] tumblr];
	
	NSMutableArray *arrayServices = [[NSMutableArray alloc] init];
	[arrayServices addSFService:SHARE_METHOD_EMAIL];
	[arrayServices addSFService:SHARE_METHOD_FACEBOOK];
	[arrayServices addSFService:SHARE_METHOD_TWITTER];
	[arrayServices addSFService:SHARE_METHOD_CLIPBOARD];
	[arrayServices addSFService:SHARE_METHOD_OPENSAFARI];
    [arrayServices addSFService:SHARE_METHOD_QR];
	[arrayServices addSFService:SHARE_METHOD_RIL];
	[arrayServices addSFService:SHARE_METHOD_INSTAPAPER];
	[arrayServices addSFService:SHARE_METHOD_DELICIOUS];
	[arrayServices addSFService:SHARE_METHOD_PINBOARD];
	[arrayServices addSFService:SHARE_METHOD_TUMBLR];
	[arrayServices addSFService:SHARE_METHOD_CANCEL]; //needed service

	[[ShareFactory shared] createSharingActionSheetWithStyle:UIActionSheetStyleBlackOpaque 
											 andShareMethods:arrayServices];
	
	[arrayServices release];
}

- (void)triggerShareFacebook
{
	[[ShareFactory shared] setFbSecretKey:@""];
	[[ShareFactory shared] setFbSessionKey:@""];
	[[ShareFactory shared] shareFacebookWithName:@"ShareFactory"
									  andCaption:@"Test from ShareFactory"
								  andDescription:@"This a long caption for testing purposes with ShareFactory"
										andImage:@"http://img.xataka.com/2007/01/iphone%20apple.png"
										  andURL:[@"http://www.apple.com" urlShortener]];
}

- (void)triggerShareTwitter
{
	[[ShareFactory shared] setTwitterConsumerSecret:@""];
	[[ShareFactory shared] setTwitterConsumerKey:@""];
	
	NSString *tweet = [NSString stringWithFormat:@"This is a test on ShareFactory %@", [@"http://www.apple.com" urlShortener]];
	[[ShareFactory shared] shareTwitterWithTweet:tweet];
}

- (void)triggerShareEmail
{
	[[ShareFactory shared] shareEmailWithSubject:@"ShareFactory usage email example"
										withBody:@"Hi!\nThis is a proof from ShareFactory library"];
}

- (void)triggerSimpleSharing
{
	[[ShareFactory shared] setTwitterConsumerSecret:@""];
	[[ShareFactory shared] setTwitterConsumerKey:@""];
	
	NSString *tweet = [NSString stringWithFormat:@"This is a test on ShareFactory %@", [@"http://www.apple.com" urlShortener]];
	[[ShareFactory shared] setTwitText:tweet];
	
	[[ShareFactory shared] setNameApp:@"ShareFactory"];
	[[ShareFactory shared] setCaption:@"Test from ShareFactory"];
	[[ShareFactory shared] setDescription:@"This a long caption for testing purposes with ShareFactory"];
	[[ShareFactory shared] setImageURL:@"http://img.xataka.com/2007/01/iphone%20apple.png"];
	[[ShareFactory shared] setUrl:[@"http://www.apple.com" urlShortener]];
	[[ShareFactory shared] setFbSecretKey:@""];
	[[ShareFactory shared] setFbSessionKey:@""];
	
	[[ShareFactory shared] setEmailSubject:@"ShareFactory usage email example"];
	[[ShareFactory shared] setEmailBody:@"Hi!\nThis is a proof from ShareFactory library"];
	
	[[ShareFactory shared] createSharingActionSheetWithStyle:UIActionSheetStyleBlackOpaque];
}

#pragma mark -
#pragma mark ShareFactoryDelegate delegate methods

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result withError:(NSError *)error
{
	if (MFMailComposeResultCancelled) 
	{
		NSLog(@"email cancelled!");
	}
	else if (MFMailComposeResultSent)
	{
		NSLog(@"email sent!");
	}
	else if (MFMailComposeResultSaved)
	{
		NSLog(@"email saved!");
	}
	else 
	{
		NSLog(@"email failed!, error : %@", [error description]);
	}
}

- (void)twitterEndedSuccessfully:(TwitterRequest *)request withAlert:(UIAlertView *)alertView
{
	NSLog(@"Tweet sent!");
}

- (void)twitterDidFail:(TwitterRequest *)request withAlert:(UIAlertView *)alertView
{
	NSLog(@"Tweet fail!");
}

- (void)facebookDidFinishWithSuccess:(FBRequest *)request withResult:(id)result
{
	NSLog(@"Shared successfully in facebook!");
}

- (void)readItLaterLoginFinished:(NSString *)stringResponse error:(NSString *)errorString
{
	NSLog(@"RIL on readItLaterLoginFinished method response: %@ error : %@", stringResponse, errorString);
}

- (void)readItLaterSignupFinished:(NSString *)stringResponse error:(NSString *)errorString
{
	NSLog(@"RIL on readItLaterSignupFinished method response: %@ error : %@", stringResponse, errorString);
}

- (void)readItLaterSaveFinished:(NSString *)stringResponse error:(NSString *)errorString
{
	NSLog(@"RIL on readItLaterSaveFinished method response: %@ error : %@", stringResponse, errorString);
}

- (void)responseOnInstaPaper:(NSString *)response
{
	NSLog(@"Response Instapaper: %@", response);
}

- (void)responseDelicious:(NSString *)response;
{
	NSLog(@"Response delicious %@", response);
}

- (void)responsePinboard:(NSString *)response
{
	NSLog(@"Response pinboard %@", response);
}

- (void)responseTumblr:(NSString *)response
{
	NSLog(@"Response tumblr %@", response);
}

- (void)eventEditViewController:(EKEventEditViewController *)controller didCompleteWithAction:(EKEventEditViewAction)action;
{
	NSLog(@"Calendar done save!");
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc 
{
    [super dealloc];
}

@end