//
//  DeliciousView.h
//
//  Created by Sergio on 24/02/11.
//  Copyright 2011 HappyBee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol DeliciousViewDelegate <NSObject>
@required

- (void)deliciousDidRequestWithUsername:(NSString *)user andPassword:(NSString *)pass isDeliciousService:(BOOL)isDelicious;

@end

@interface DeliciousView : UIViewController
{
	IBOutlet UILabel *labelUser;
	IBOutlet UILabel *labelPass;
	IBOutlet UITextField *username;
	IBOutlet UITextField *password;
	IBOutlet UILabel *labelTitle;
	BOOL isDelicious;
	id delegate;
}

@property(nonatomic, retain) IBOutlet UILabel *labelUser;
@property(nonatomic, retain) IBOutlet UILabel *labelPass;
@property(nonatomic, retain) IBOutlet UITextField *username;
@property(nonatomic, retain) IBOutlet UITextField *password;
@property(nonatomic, retain) IBOutlet UILabel *labelTitle;
@property(nonatomic) BOOL isDelicious;
@property(nonatomic, retain) id<DeliciousViewDelegate> delegate;

@end
