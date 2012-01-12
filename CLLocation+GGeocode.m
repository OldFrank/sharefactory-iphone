//
//  CLLocation+GGeocode.m
//  ShareFactorySTNDALN
//
//  Created by Sergio on 07/01/11.
//  Copyright 2011 HappyBee. All rights reserved.
//

#import "CLLocation+GGeocode.h"

@implementation CLLocation (GGeocode)

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

@end
