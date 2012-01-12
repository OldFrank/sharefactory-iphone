//
//  SFString.h
//  ShareFactorySTNDALN
//
//  Created by Sergio on 07/01/11.
//  Copyright 2011 HappyBee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface SFString : NSString
{

}

- (NSUInteger)length;
- (unichar)characterAtIndex:(NSUInteger)index;
- (id)initWithFormatString:(SFString *)format;

@end
