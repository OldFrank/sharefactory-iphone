//
//  NSString+SFString.h
//  ShareFactorySTNDALN
//
//  Created by Sergio on 07/01/11.
//  Copyright 2011 HappyBee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SFString.h"

@interface NSString (SFString)

- (SFString *)SFStringRepresentation;
- (NSString *)substringFrom:(NSInteger)a to:(NSInteger)b;
- (NSInteger)indexOf:(NSString *)substring from: (NSInteger)starts;
- (NSString *)trim;
- (BOOL)startsWith:(NSString *)s;
- (BOOL)containsString:(NSString *)aString;
- (NSString *)urlShortener;
- (NSString *)QRUrlRepresentation;
- (NSData *)QRJPGImageRepresentation;
- (NSData *)QRPNGImageRepresentation;
- (BOOL)validateURL;
- (NSString *)urlEncodeCopy;

@end
