//
//  PlacesParser.h
//  TBXmlPOC
//
//  Created by Gopinath on 2/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBXML.h"

@interface PlacesParser : NSObject
{
    NSMutableArray *arrPlaces;   

    TBXML *tbxml;
}

@property(nonatomic,retain) NSMutableArray *arrPlaces;

-(void)loadRecords:(NSString *)records;
-(void)traverseElement:(TBXMLElement *)element;

@end
