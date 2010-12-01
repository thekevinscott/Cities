//
//  AddressAnnotation.m
//  Cities
//
//  Created by Kevin Scott on 11/1/10.
//  Copyright 2010 Kevin Scott. All rights reserved.
//

#import "AddressAnnotation.h"


@implementation AddressAnnotation
@synthesize coordinate;

- (NSString *)subtitle{
	return mSubTitle;
	//return @"Sub Title";
}

- (NSString *)title{
	//NSLog(@"TItle: %@",mTitle);
	//return @"Title: %@",mTitle;
	return mTitle;
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) c{
	coordinate=c;
	//NSLog(@"%f,%f",c.latitude,c.longitude);
	return self;
}
- (id) initWithCoordinate:(CLLocationCoordinate2D) c andTitle:(NSString*) title andSubtitle:(NSString*) subtitle {
    coordinate = c;
    mTitle = [title retain];
    mSubTitle = [subtitle retain];
	
	
	
    return self;
}


@end
