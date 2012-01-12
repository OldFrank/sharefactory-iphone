//
//  Tumblr.m
//  ShareFactorySTNDALN
//
//  Created by Sergio on 26/02/11.
//  Copyright 2011 HappyBee. All rights reserved.
//

#import "Tumblr.h"
#import "ShareFactory.h"

#define kTumbrlWrite @"http://www.tumblr.com/api/write"

static Tumblr *shared = nil;

@implementation Tumblr
@synthesize email;
@synthesize password;
@synthesize type;
@synthesize generator;
@synthesize privatePOST;
@synthesize tags;
@synthesize format;
@synthesize slug;
@synthesize statePOST;
@synthesize send_to_twitter;
@synthesize customValueTwitter;
@synthesize regularTitle, regularBody;
@synthesize quote, quoteSource;
@synthesize urlLinkTumblr, descriptionLinkTumblr, nameLinkTumblr;
@synthesize conversation, titleConversation;
@synthesize photoType;
@synthesize sourceURLPhoto, captionImage;
@synthesize dataImage;
@synthesize titleVideo, captionVideo;
@synthesize dataVideo;
@synthesize videoType;
@synthesize videoEmbedString;

#pragma mark -
#pragma mark Singleton methods

+ (Tumblr *)sharedTumblr
{
    @synchronized(self)
    {
        if (shared == nil)
            shared = [[Tumblr alloc] init];
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
#pragma mark Tumbrl methods

+ (int)postRequestForTumblr
{
	if (([Tumblr sharedTumblr].email == nil) ||
		([[Tumblr sharedTumblr].email isEqualToString:@""]) ||
		([Tumblr sharedTumblr].email == @""))
		[Tumblr createNSExceptionWithreason:NSLocalizedString(@"emailEmptyTumblr", @"")];
	
	if (([Tumblr sharedTumblr].password == nil) ||
		([[Tumblr sharedTumblr].password isEqualToString:@""]) ||
		([Tumblr sharedTumblr].password == @""))
		[Tumblr createNSExceptionWithreason:NSLocalizedString(@"passwordEmptyTumblr", @"")];
	
	if (([Tumblr sharedTumblr].type != TUMBRL_STATE_PUBLISHED) &&
		([Tumblr sharedTumblr].type != TUMBRL_STATE_DRAFT) &&
		([Tumblr sharedTumblr].type != TUMBRL_STATE_SUBMISSION) &&
		([Tumblr sharedTumblr].type != TUMBRL_STATE_UNDERSTOOD))
		[Tumblr createNSExceptionWithreason:NSLocalizedString(@"typeNotValidTumblr", @"")];
	
	if ([[Tumblr sharedTumblr].generator length] > 55) 
		[Tumblr createNSExceptionWithreason:NSLocalizedString(@"slugMaxExceedTumblr", @"")];
	
	if ([[Tumblr sharedTumblr].generator length] > 64) 
		[Tumblr createNSExceptionWithreason:NSLocalizedString(@"generatorMaxExceedTumblr", @"")];
	
	ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:kTumbrlWrite]];
	
	[request addPostValue:[Tumblr sharedTumblr].email forKey:@"email"];
	[request addPostValue:[Tumblr sharedTumblr].password forKey:@"password"];
	
	switch ([Tumblr sharedTumblr].type)
	{
		case TUMBLR_TYPE_POST_QUOTE:
			
			[request addPostValue:@"quote" forKey:@"type"];
			
			if (([Tumblr sharedTumblr].quote == nil) ||
				([[Tumblr sharedTumblr].quote isEqualToString:@""]) || 
				([Tumblr sharedTumblr].quote == @""))			
				[Tumblr createNSExceptionWithreason:NSLocalizedString(@"quoteEmptyTumblr", @"")];
			
			[request addPostValue:[Tumblr sharedTumblr].quote forKey:@"quote"];
			[request addPostValue:[Tumblr sharedTumblr].quoteSource forKey:@"source"];

			break;
		case TUMBLR_TYPE_POST_LINK:
			
			[request addPostValue:@"link" forKey:@"type"];
			
			if (([Tumblr sharedTumblr].urlLinkTumblr == nil) ||
				([[Tumblr sharedTumblr].urlLinkTumblr isEqualToString:@""]) || 
				([Tumblr sharedTumblr].urlLinkTumblr == @""))			
				[Tumblr createNSExceptionWithreason:NSLocalizedString(@"urlLinkTumblrEmpty", @"")];
			
			[request addPostValue:[Tumblr sharedTumblr].urlLinkTumblr forKey:@"url"];
			[request addPostValue:[Tumblr sharedTumblr].descriptionLinkTumblr forKey:@"description"];
			[request addPostValue:[Tumblr sharedTumblr].nameLinkTumblr forKey:@"name"];
			
			break;
		case TUMBLR_TYPE_POST_CONVERSATION:
			
			[request addPostValue:@"conversation" forKey:@"type"];
			
			if (([Tumblr sharedTumblr].conversation == nil) ||
				([[Tumblr sharedTumblr].conversation isEqualToString:@""]) || 
				([Tumblr sharedTumblr].conversation == @""))			
				[Tumblr createNSExceptionWithreason:NSLocalizedString(@"conversationEmptyTumblr", @"")];
			
			[request addPostValue:[Tumblr sharedTumblr].conversation forKey:@"conversation"];
			[request addPostValue:[Tumblr sharedTumblr].titleConversation forKey:@"title"];

			break;
		case TUMBLR_TYPE_POST_PHOTO:
			
			[request addPostValue:@"photo" forKey:@"type"];
			
			if (([Tumblr sharedTumblr].photoType != TUMBLR_POST_PHOTO_SOURCE) &&
				([Tumblr sharedTumblr].photoType != TUMBLR_POST_PHOTO_DATA))
				[Tumblr createNSExceptionWithreason:NSLocalizedString(@"photoTypeUnknownTumblr", @"")];
		
			if ([Tumblr sharedTumblr].photoType == TUMBLR_POST_PHOTO_SOURCE) 
			{
				if (([Tumblr sharedTumblr].sourceURLPhoto == nil) || 
					([Tumblr sharedTumblr].sourceURLPhoto == @"") ||
					([[Tumblr sharedTumblr].sourceURLPhoto isEqualToString:@""]))
				{
					[Tumblr createNSExceptionWithreason:NSLocalizedString(@"sourceUnknownTumblr", @"")];
				}
				else
				{
					[request addPostValue:[Tumblr sharedTumblr].sourceURLPhoto forKey:@"source"];
				}
			}
			else if ([Tumblr sharedTumblr].photoType == TUMBLR_POST_PHOTO_DATA)
			{
				if ([Tumblr sharedTumblr].dataImage == nil) 	
					[Tumblr createNSExceptionWithreason:NSLocalizedString(@"dataImageNilSizeTumblr", @"")];
				
				if (([[Tumblr sharedTumblr].dataImage length] / (2^20)) > 5) 	
					[Tumblr createNSExceptionWithreason:NSLocalizedString(@"dataImageMaxSizeTumblr", @"")];

				[request addData:[Tumblr sharedTumblr].dataImage forKey:@"data"];
			}

			[request addPostValue:[Tumblr sharedTumblr].captionImage forKey:@"caption"];

			/*
			 photo - Requires either source or data, but not both. If both are specified, source is used.
			 source - The URL of the photo to copy. This must be a web-accessible URL, not a local file or intranet location.
			 data - An image file. See File uploads below.
			 caption (optional, HTML allowed)
			 */
			
			break;
		case TUMBLR_TYPE_POST_VIDEO:
			
			[request addPostValue:@"video" forKey:@"type"];
			[request addPostValue:[Tumblr sharedTumblr].titleVideo forKey:@"title"];
			[request addPostValue:[Tumblr sharedTumblr].captionVideo forKey:@"caption"];

			if ([Tumblr sharedTumblr].videoType = TUMBLR_POST_VIDEO_EMBED) 
			{
				if (([Tumblr sharedTumblr].videoEmbedString == nil) || 
					([Tumblr sharedTumblr].videoEmbedString == @"") ||
					([[Tumblr sharedTumblr].videoEmbedString isEqualToString:@""]))
				{
					[Tumblr createNSExceptionWithreason:NSLocalizedString(@"videoEmbedStringUnknownTumblr", @"")];
				}
				else
				{
					[request addPostValue:[Tumblr sharedTumblr].videoEmbedString forKey:@"source"];
				}
			}
			else if ([Tumblr sharedTumblr].videoType = TUMBLR_POST_VIDEO_DATA)
			{
				if ([Tumblr sharedTumblr].dataVideo == nil) 	
					[Tumblr createNSExceptionWithreason:NSLocalizedString(@"dataVideoNilSizeTumblr", @"")];
				
				if (([[Tumblr sharedTumblr].dataVideo length] / (2^20)) > 5) 	
					[Tumblr createNSExceptionWithreason:NSLocalizedString(@"dataVideoMaxSizeTumblr", @"")];
			
				[request addData:[Tumblr sharedTumblr].dataVideo forKey:@"data"];
			}
			else
			{
				[Tumblr createNSExceptionWithreason:NSLocalizedString(@"videoTypeUnknownTumblr", @"")];
			}

			/*
			 video - Requires either embed or data, but not both.
			 embed - Either the complete HTML code to embed the video, or the URL of a YouTube video page.
			 data - A video file for a Vimeo upload. See File uploads below.
			 title (optional) - Only applies to Vimeo uploads.
			 caption (optional, HTML allowed)
			 */
			
			break;
		case TUMBLR_TYPE_POST_AUDIO:
			
			[request addPostValue:@"audio" forKey:@"type"];
			
			/*
			 audio
			 data - An audio file. Must be MP3 or AIFF format. See File uploads below.
			 externally-hosted-url (optional, replaces data) - Create a post that uses this externally hosted audio-file URL instead of having Tumblr copy and host an uploaded file. Must be MP3 format. No size or duration limits are imposed on externally hosted files.
			 caption (optional, HTML allowed)
			 */
			
			break;
		default:
		{
			if ((([Tumblr sharedTumblr].regularTitle == nil) ||
				 ([[Tumblr sharedTumblr].regularTitle isEqualToString:@""]) || 
				 ([Tumblr sharedTumblr].regularTitle == @"")) && 
				(([Tumblr sharedTumblr].regularBody == nil) ||
				 ([[Tumblr sharedTumblr].regularBody isEqualToString:@""]) || 
				 ([Tumblr sharedTumblr].regularBody == @"")))
				[Tumblr createNSExceptionWithreason:NSLocalizedString(@"regularTitleANDregularBodyEmpty", @"")];
			
			[request addPostValue:@"regular" forKey:@"type"];
			[request addPostValue:[Tumblr sharedTumblr].regularTitle forKey:@"title"];
			[request addPostValue:[Tumblr sharedTumblr].regularBody forKey:@"body"];

			break;
		}
	}
	
	[request addPostValue:[Tumblr sharedTumblr].generator forKey:@"generator"];
	
	[Tumblr sharedTumblr].privatePOST ? [request addPostValue:@"1" forKey:@"private"] : [request addPostValue:@"0" forKey:@"private"];

	NSString *myTags = @"";
	for(NSString *str in [Tumblr sharedTumblr].tags)
	{
		if ((myTags == @"") || ([myTags isEqualToString:@""]))
			myTags = str;
		else 
			myTags = [NSString stringWithFormat:@"%@,%@", myTags, str];
	}
	
	[request addPostValue:myTags forKey:@"tags"];
	
	if ([Tumblr sharedTumblr].format == TUMBLR_FORMAT_HTML) 
	{
		[request addPostValue:@"html" forKey:@"format"];
	}
	else if ([Tumblr sharedTumblr].format == TUMBLR_FORMAT_MARKDOWN)
	{
		[request addPostValue:@"markdown" forKey:@"format"];
	}
	
	[request addPostValue:[Tumblr sharedTumblr].slug forKey:@"slug"];

	switch ([Tumblr sharedTumblr].statePOST) 
	{
		case TUMBRL_STATE_DRAFT:
			
			[request addPostValue:@"draft" forKey:@"state"];
			break;
			
		case TUMBRL_STATE_SUBMISSION:
			
			[request addPostValue:@"submission" forKey:@"state"];
			break;
			
		case TUMBRL_STATE_UNDERSTOOD:
			
			[request addPostValue:@"understood" forKey:@"state"];
			break;
			
		default:
			
			[request addPostValue:@"published" forKey:@"type"];
			break;
	}
	
	if ([Tumblr sharedTumblr].send_to_twitter != 0) 
	{
		if ([Tumblr sharedTumblr].send_to_twitter == TUMBLR_SEND_TWITTER_AUTO) 
		{
			[request addPostValue:@"auto" forKey:@"send-to-twitter"];
		}
		else if ([Tumblr sharedTumblr].send_to_twitter == TUMBLR_SEND_TWITTER_NO)
		{
			[request addPostValue:@"no" forKey:@"send-to-twitter"];
		}
		else
		{
			if (([Tumblr sharedTumblr].customValueTwitter == nil) ||
				([[Tumblr sharedTumblr].customValueTwitter isEqualToString:@""]) || 
				([Tumblr sharedTumblr].customValueTwitter == @""))			
				[Tumblr createNSExceptionWithreason:NSLocalizedString(@"customValueTwitterEmptyTumblr", @"")];
			
			[request addPostValue:[Tumblr sharedTumblr].customValueTwitter forKey:@"send-to-twitter"];
		}
	}

	[request startSynchronous];
	
	NSError *error = [request error];
	NSString *response = [request responseString];
	[request release];
	
	if (!error)
	{
		if ([response intValue] > 0) 
		{
			return 201;
		}
		else if ([response containsString:@"Invalid credentials"])
		{
			return 403;
		}
		else
		{
			return 400;
		}
	}
	else 
	{
		return 400; 
	}

	//201 Created - Success! The newly created post's ID is returned.
	//403 Forbidden - Your email address or password were incorrect.
	//400 Bad Request - There was at least one error while trying to save your post. Errors 
}

+ (void)createNSExceptionWithreason:(NSString *)reason
{
	@throw [NSException exceptionWithName:NSInvalidArgumentException
                                   reason:reason
                                 userInfo:nil];
}

@end
