//
//  SFString+Additions.h
//  ShareFactorySTNDALN
//
//  Created by Sergio on 07/01/11.
//  Copyright 2011 HappyBee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SFString.h"

@interface SFString (Helper) 

- (SFString *)substringFrom:(NSInteger)a to:(NSInteger)b;
- (NSInteger)indexOf:(SFString *)substring from: (NSInteger)starts;
- (SFString *)trim;
- (BOOL)startsWith:(SFString *)s;
- (BOOL)containsString:(SFString *)aString;
- (SFString *)urlEncodeCopy;

@end