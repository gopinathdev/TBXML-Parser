//
//  PlaceBO.m
//  SaxParserPOC
//
//  Created by Gopinath on 2/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlaceBO.h"

@implementation PlaceBO
@synthesize strName;
@synthesize strVicinity;

-(void)dealloc
{
    [strName release];
    [strVicinity release];
    
    [super dealloc];
}

@end
