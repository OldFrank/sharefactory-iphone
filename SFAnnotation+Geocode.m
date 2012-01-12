//
//  SFAnnotation+Additions.m
//  ShareFactorySTNDALN
//
//  Created by Sergio on 07/01/11.
//  Copyright 2011 HappyBee. All rights reserved.
//

#import "SFAnnotation+Geocode.h"

@implementation SFAnnotation (Geocode)

- (NSString *)forwardGeocodeWithLanguage:(NSString *)language
{
	NSString *gUrl = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/json?latlng=%.10f,%.10f&language=%@&sensor=false", self.coordinate.latitude, self.coordinate.longitude, language];
	
	NSString *infoData = [[[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:gUrl] 
														 encoding:NSUTF8StringEncoding 
															error:nil] autorelease];
	
	NSString *value = @"";
	
	if ((infoData == nil) || 
		([infoData isEqualToString:@"[]"])) 
	{
		return value;
	} 
	else 
	{
		NSDictionary *jsonArray = [infoData JSONValue]; 
		NSDictionary *dict = [(NSDictionary *)jsonArray objectForKey:@"results"];
		
		for (id key in dict)
		{
			value = [NSString stringWithFormat:@"%@", [key objectForKey:@"formatted_address"]];
			break;
		}
	}	
	
	return value;
}

- (BOOL)isAnnotationInMap:(MKMapView *)map
{
	for (SFAnnotation *ann in [map annotations])
	{
		if ([self isEqual:ann])
		{
			return YES;
		}
	}
	
	return NO;
}

- (BOOL)isPinInRegionWithMap:(MKMapView *)viewMap
{
	double minLong = viewMap.region.center.longitude - viewMap.region.span.longitudeDelta/2.0;
	double maxLong = viewMap.region.center.longitude + viewMap.region.span.longitudeDelta/2.0;
	double minLat = viewMap.region.center.latitude - viewMap.region.span.latitudeDelta/2.0;
	double maxLat = viewMap.region.center.latitude + viewMap.region.span.latitudeDelta/2.0;
	
	BOOL pinRegion = self.coordinate.longitude>=minLong && self.coordinate.longitude<=maxLong && self.coordinate.latitude>=minLat && self.coordinate.latitude<=maxLat;
	return pinRegion;
}

@end