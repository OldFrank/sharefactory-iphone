//
//  ShareBot.h
//  ShareBot
//
//  Created by Sergio on 08/12/10.
//  Copyright 2010 HappyBee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TwitterToken.h"
#import "TwitterConsumer.h"
#import "TwitterLoginViewController.h"
#import "TwitterComposeViewController.h"
#import "FBConnect/FBConnect.h"
#import <MessageUI/MessageUI.h>
#import "NSString+SFString.h"
#import "UIView+Additions.h"
#import "ReadItLaterFull.h"
#import "Instapaper.h"
#import "InstapaperGUI.h"
#import "Delicious+Pinboard.h"
#import "DeliciousView.h"
#import "Pinboard.h"
#import "Tumblr.h"
#import "TumblrView.h"
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>



@protocol ShareFactoryDelegate <NSObject, EKEventEditViewDelegate>
@optional

- (void)twitterEndedSuccessfully:(TwitterRequest *)request withAlert:(UIAlertView *)alertView;
- (void)twitterDidFail:(TwitterRequest *)request withAlert:(UIAlertView *)alertView;
- (void)facebookDidFinishWithSuccess:(FBRequest *)request withResult:(id)result;
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result withError:(NSError*)error;
- (void)readItLaterLoginFinished:(NSString *)stringResponse error:(NSString *)errorString;
- (void)readItLaterSignupFinished:(NSString *)stringResponse error:(NSString *)errorString;
- (void)readItLaterSaveFinished:(NSString *)stringResponse error:(NSString *)errorString;
- (void)responseOnInstaPaper:(NSString *)response;
- (void)responseDelicious:(NSString *)response;
- (void)responsePinboard:(NSString *)response;
- (void)responseTumblr:(NSString *)response;
- (void)eventEditViewController:(EKEventEditViewController *)controller didCompleteWithAction:(EKEventEditViewAction)action;

@end

typedef enum
{
	SHARE_METHOD_EMAIL = 1,
	SHARE_METHOD_TWITTER = 2,
	SHARE_METHOD_FACEBOOK = 3,
	SHARE_METHOD_CLIPBOARD = 5,
	SHARE_METHOD_OPENSAFARI = 6,
    SHARE_METHOD_QR = 7,
	SHARE_METHOD_RIL = 8,
	SHARE_METHOD_INSTAPAPER = 9,
	SHARE_METHOD_CALENDAR = 10,
	SHARE_METHOD_DELICIOUS = 11,
	SHARE_METHOD_PINBOARD = 12,
	SHARE_METHOD_TUMBLR = 13,
	SHARE_METHOD_CANCEL = 4
	
}SHARE_METHOD;

@interface ShareFactory : UIViewController <EKEventEditViewDelegate, TumblrViewDelegate, DeliciousViewDelegate, InstapaperGUIDelegate, ReadItLaterDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate, UIActionSheetDelegate, TwitterRequestDelegate, TwitterLoginViewControllerDelegate, TwitterComposeViewControllerDelegate, FBSessionDelegate, FBRequestDelegate, UIActionSheetDelegate> 
{
	UIActionSheet *actionSheet;
	UIViewController *delegateViewController;
	UIViewController<ShareFactoryDelegate> *delegate;
	
	// mail
	MFMailComposeViewController *email;
	
	// facebook
	FBSession *sessionfb;
	NSString *fbSessionKey;
	NSString *fbSecretKey;
	NSString *nameApp;
	NSString *caption;
	NSString *description;
	NSString *imageURL;
	NSString *url;
	
	// twitter
	NSString *twitterConsumerKey;
	NSString *twitterConsumerSecret;
	NSString *twitText;
	
	//Email
	NSString *emailSubject;
	NSString *emailBody;
	
	//Clipboard
	NSString *textClipboard;
	
	//Open in Safari
	NSString *urlSafari;
	
    //URL QR
    NSString *urlQR;
    
	//RIL
	NSString *urlRIL;
	NSString *titleRILurl;
	NSString *apiKey; //Enter your apikey here : get one at http://readitlaterlist.com/api/ 
	NSString *nameOfYourApp; //Enter the name of your application here (optional - for user-agent string)
	
	//Instapaper
	NSString *urlInstapaper;
	NSString *titleInstapaper;
	
	//Delicious
	NSString *urlDeliciousOrPinboard;
	NSString *descriptionDeliciousOrPinboard;
	NSArray *tagsDeliciousOrPinboard;
	
	//Tumblr
	NSString *usernameTumblr;
	NSString *passwordTumblr;
	
	//Calendar
	NSDate *startDate;
	NSDate *endDate;
	
@private
	
	//Delicious
	NSString *usernameDeliciousOrPinboard;
	NSString *passDeliciousOrPinboard;
	
	//Instapaper
	NSString *userInstapaper;
	NSString *passInstapaper;
	
	BOOL customShare;
	NSArray *itemsCustom;
	
	TwitterLoginViewController *twitterLoginViewControllerMain;
	TwitterConsumer* _consumer;
	TwitterToken* _token;
}

- (void)createSharingActionSheetWithStyle:(UIActionSheetStyle)style andShareMethods:(NSMutableArray *)methods;
- (void)createSharingActionSheetWithStyle:(UIActionSheetStyle)style;
- (void)shareEmailWithSubject:(NSString *)emailSubject withBody:(NSString *)emailBody;
- (void)shareTwitterWithTweet:(NSString *)text;
- (void)shareFacebookWithName:(NSString *)nameAppString
				   andCaption:(NSString *)captionString
			   andDescription:(NSString *)descriptionString
					 andImage:(NSString *)imageURLString 
					   andURL:(NSString *)urlString;
- (void)copyToClipboard;
- (void)openInSafari;
- (NSString *)generateQRURLString;
- (NSData *)generateQRJPGFormat;
- (NSData *)generateQRPNGFormat;
- (BOOL)readItLater;
- (void)instapaper;
- (void)showModal;
- (void)delicious;
- (void)showModalDelicious;
- (void)pinboard;
- (void)showModalPinboard;
- (void)tumblr;
- (void)showModalTumblr;
- (void)calendar;

+ (ShareFactory *)shared;

@property(nonatomic, retain) UIActionSheet *actionSheet;
@property(nonatomic, retain) UIViewController<ShareFactoryDelegate> *delegate;
@property(nonatomic, retain) UIViewController* delegateViewController;
@property(nonatomic, retain) NSString *twitterConsumerKey;
@property(nonatomic, retain) NSString *twitterConsumerSecret;
@property(nonatomic, retain) NSString *fbSessionKey;
@property(nonatomic, retain) NSString *fbSecretKey;
@property(nonatomic, retain) NSString *emailSubject;
@property(nonatomic, retain) NSString *emailBody;
@property(nonatomic, retain) NSString *twitText;
@property(nonatomic, retain) NSString *nameApp;
@property(nonatomic, retain) NSString *caption;
@property(nonatomic, retain) NSString *description;
@property(nonatomic, retain) NSString *imageURL;
@property(nonatomic, retain) NSString *url;
@property(nonatomic, retain) NSString *textClipboard;
@property(nonatomic, retain) NSString *urlSafari;
@property(nonatomic, retain) NSString *urlQR;
@property(nonatomic, retain) NSString *urlRIL;
@property(nonatomic, retain) NSString *titleRILurl;
@property(nonatomic, retain) NSString *apiKey;
@property(nonatomic, retain) NSString *nameOfYourApp;
@property(nonatomic, retain) NSString *userInstapaper;
@property(nonatomic, retain) NSString *passInstapaper;
@property(nonatomic, retain) NSString *urlInstapaper;
@property(nonatomic, retain) NSString *titleInstapaper;
@property(nonatomic, retain) NSString *usernameDeliciousOrPinboard;
@property(nonatomic, retain) NSString *passDeliciousOrPinboard;
@property(nonatomic, retain) NSString *urlDeliciousOrPinboard;
@property(nonatomic, retain) NSString *descriptionDeliciousOrPinboard;
@property(nonatomic, retain) NSArray *tagsDeliciousOrPinboard;
@property(nonatomic, retain) NSString *usernameTumblr;
@property(nonatomic, retain) NSString *passwordTumblr;
@property(nonatomic, retain) NSDate *startDate;
@property(nonatomic, retain) NSDate *endDate;

@end