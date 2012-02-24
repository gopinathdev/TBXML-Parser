//
//  PlacesParser.m
//  TBXmlPOC
//
//  Created by Gopinath on 2/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlacesParser.h"
#import "PlaceBO.h"

@implementation PlacesParser
@synthesize arrPlaces;

- (void)loadRecords:(NSString *)records {
    
    arrPlaces = [[NSMutableArray alloc] init];
    
    NSString *someXML = @"https://maps.googleapis.com/maps/api/place/search/xml?location=-33.8670522,151.1957362&radius=500&types=food&sensor=true&key=AIzaSyARSAsQ0iRdO_zxTRII88ZAa5L3DV9g8yU";
    
    tbxml = [[TBXML alloc] initWithURL:[NSURL URLWithString:someXML]];
    // If TBXML found a root node, process element and iterate all children
	if (tbxml.rootXMLElement)
		[self traverseElement:tbxml.rootXMLElement];
	
	// release resources
	[tbxml release];

    for(PlaceBO *ob in arrPlaces)
    {
        NSLog(@"----------");
        NSLog(@"Name :%@",ob.strName);
    }
}

- (void) traverseElement:(TBXMLElement *)element {
    do {
        if (element->firstChild) 
            [self traverseElement:element->firstChild];
        
        if ([[TBXML elementName:element] isEqualToString:@"result"]) {
            
            TBXMLElement *NameElement = [TBXML childElementNamed:@"name" parentElement:element];
            TBXMLElement *VicinityElement = [TBXML childElementNamed:@"vicinity" parentElement:element];
            
            PlaceBO *ob = [[PlaceBO alloc] init];
            ob.strName = [TBXML textForElement:NameElement];
            ob.strVicinity = [TBXML textForElement:VicinityElement];

            [arrPlaces addObject:ob];  
            [ob release];
            ob = nil;
        }
    } while ((element = element->nextSibling));  
}
 

@end
