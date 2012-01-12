//
//  Tumblr.h
//  ShareFactorySTNDALN
//
//  Created by Sergio on 26/02/11.
//  Copyright 2011 HappyBee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#include <UIKit/UIKit.h>

typedef enum
{
	TUMBRL_STATE_PUBLISHED = 1,
	TUMBRL_STATE_DRAFT = 2,
	TUMBRL_STATE_SUBMISSION = 3,
	TUMBRL_STATE_UNDERSTOOD = 4
}TUMBLR_STATE;

typedef enum
{
	TUMBLR_TYPE_POST_REGULAR = 1,
	TUMBLR_TYPE_POST_PHOTO = 2,
	TUMBLR_TYPE_POST_QUOTE = 3,
	TUMBLR_TYPE_POST_LINK = 4,
	TUMBLR_TYPE_POST_CONVERSATION = 5,
	TUMBLR_TYPE_POST_VIDEO = 6,
	TUMBLR_TYPE_POST_AUDIO = 7,
}TUMBRL_TYPE_POST;

typedef enum
{
	TUMBLR_SEND_TWITTER_AUTO = 1,
	TUMBLR_SEND_TWITTER_NO = 2,
	TUMBLR_SEND_TWITTER_CUSTOM = 3
}TUMBLR_SEND_TWITTER;

typedef enum
{
	TUMBLR_FORMAT_HTML = 1,
	TUMBLR_FORMAT_MARKDOWN = 2,
	TUMBLR_FORMAT_NONE = 3
}TUMBLR_FORMAT;

typedef enum
{
	TUMBLR_POST_PHOTO_SOURCE = 1,
	TUMBLR_POST_PHOTO_DATA = 2
}TUMBLR_POST_PHOTO;

typedef enum
{
	TUMBLR_POST_VIDEO_EMBED = 1,
	TUMBLR_POST_VIDEO_DATA = 2
}TUMBLR_POST_VIDEO;

@interface Tumblr : NSObject <ASIHTTPRequestDelegate>
{
	NSString *email;
	NSString *password;
	int type;
	NSString *generator;
	BOOL privatePOST;
	NSArray *tags;
	int format;
	NSString *slug;
	int statePOST;
	int send_to_twitter;
	NSString *customValueTwitter;
	
	//type parameter options
	NSString *regularTitle, *regularBody;
	NSString *quote, *quoteSource;
	NSString *urlLinkTumblr, *descriptionLinkTumblr, *nameLinkTumblr;
	NSString *conversation, *titleConversation;
	int photoType;
	NSString *sourceURLPhoto, *captionImage;
	NSData *dataImage;
	NSString *titleVideo, *captionVideo;
	NSData *dataVideo;
	int videoType;
	NSString *videoEmbedString;
}

+ (int)postRequestForTumblr;
+ (void)createNSExceptionWithreason:(NSString *)reason;
+ (Tumblr *)sharedTumblr;

@property(nonatomic, retain) NSString *email;
@property(nonatomic, retain) NSString *password;
@property(nonatomic) int type;
@property(nonatomic, retain) NSString *generator;
@property(nonatomic) BOOL privatePOST;
@property(nonatomic, retain) NSArray *tags;
@property(nonatomic) int format;
@property(nonatomic, retain) NSString *slug;
@property(nonatomic) int statePOST;
@property(nonatomic) int send_to_twitter;
@property(nonatomic, retain) NSString *customValueTwitter;
@property(nonatomic, retain) NSString *regularTitle, *regularBody;
@property(nonatomic, retain) NSString *quote, *quoteSource;
@property(nonatomic, retain) NSString *urlLinkTumblr, *descriptionLinkTumblr, *nameLinkTumblr;
@property(nonatomic, retain) NSString *conversation, *titleConversation;
@property(nonatomic) int photoType;
@property(nonatomic, retain) NSString *sourceURLPhoto, *captionImage;
@property(nonatomic, retain) NSData *dataImage;
@property(nonatomic, retain) NSString *titleVideo, *captionVideo;
@property(nonatomic, retain) NSData *dataVideo;
@property(nonatomic) int videoType;
@property(nonatomic, retain) NSString *videoEmbedString;

@end
