//
//  SFAnnotation.m
//  ShareFactorySTNDALN
//
//  Created by Sergio on 07/01/11.
//  Copyright 2011 HappyBee. All rights reserved.
//

#import "SFAnnotation.h"

@implementation SFAnnotation
@synthesize coordinate = _coordinate;
@synthesize title = _title;
@synthesize subtitle = _subtitle;
@synthesize identifier = _identifier;
@synthesize service = _service;

+ (id)annotationWithCoordinate:(CLLocationCoordinate2D)coordinate 
{
	return [[[[self class] alloc] initWithCoordinate:coordinate] autorelease];
}

- (id) init
{
	self = [super init];
	if (self != nil) {
		
	}
	return self;
}

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate
{
	self = [super init];
	if(nil != self)
	{
		self.coordinate = coordinate;
	}
	
	return self;
}

- (id)initWithDictionary:(NSDictionary*)dict
{
	self = [super init];
	if(nil != self)
	{
		[self load:dict];
	}
	
	return self;
}

- (NSString*)newGetKey
{
	return [[NSString alloc] initWithFormat: @"%@%@", _service, _identifier];
}

- (void)save:(NSMutableDictionary *)dict
{
	[dict setObject:_title forKey:@"title"];
	[dict setObject:_subtitle forKey:@"subtitle"];
	[dict setObject:_identifier forKey:@"identifier"];
	[dict setObject:_service forKey:@"service"];
	[dict setObject:[NSNumber numberWithDouble: _coordinate.latitude] forKey:@"lat"];
	[dict setObject:[NSNumber numberWithDouble: _coordinate.longitude] forKey:@"lon"];
}

- (void)load:(NSDictionary *)dict
{
	self.title = [dict objectForKey:@"title"];
	self.subtitle = [dict objectForKey:@"subtitle"];
	self.identifier = [dict objectForKey:@"identifier"];
	self.service = [dict objectForKey:@"service"];
	NSNumber *lat = [dict objectForKey:@"lat"];
	NSNumber *lon = [dict objectForKey:@"lon"];
	CLLocationCoordinate2D c = { [lat doubleValue], [lon doubleValue] };
	self.coordinate = c;
}

- (void) dealloc
{
	[_title release];
	[_subtitle release];
	[_identifier release];
	[_service release];
	[super dealloc];
}

@end
