//
//  SFAnnotation+Additions.h
//  ShareFactorySTNDALN
//
//  Created by Sergio on 07/01/11.
//  Copyright 2011 HappyBee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSON.h"
#import "SFAnnotation.h"

@interface SFAnnotation (Geocode)

- (NSString *)forwardGeocodeWithLanguage:(NSString *)language;
- (BOOL)isAnnotationInMap:(MKMapView *)map;
- (BOOL)isPinInRegionWithMap:(MKMapView *)viewMap;

@end