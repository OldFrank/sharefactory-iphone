//
//  SFAnnotation.h
//  ShareFactorySTNDALN
//
//  Created by Sergio on 07/01/11.
//  Copyright 2011 HappyBee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface SFAnnotation : NSObject <MKAnnotation>
{
	CLLocationCoordinate2D _coordinate;
	NSString *_title;
	NSString *_subtitle;
	NSString *_identifier;
	NSString *_service;
}

+ (id)annotationWithCoordinate:(CLLocationCoordinate2D)coordinate;
- (id)init;
- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate;
- (id)initWithDictionary:(NSDictionary*)dict;
- (NSString*)newGetKey;
- (void)save:(NSMutableDictionary*)dict;
- (void)load:(NSDictionary*)dict;

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (retain) NSString *title;
@property (retain) NSString *subtitle;
@property (retain) NSString *identifier;
@property (retain) NSString *service;

@end
