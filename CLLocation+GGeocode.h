//
//  CLLocation+GGeocode.h
//  ShareFactorySTNDALN
//
//  Created by Sergio on 07/01/11.
//  Copyright 2011 HappyBee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "JSON.h"

@interface CLLocation (GGeocode)

- (NSString *)forwardGeocodeWithLanguage:(NSString *)language;

@end
