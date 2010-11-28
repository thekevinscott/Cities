//
//  AddressAnnotation.h
//  Cities
//
//  Created by Kevin Scott on 11/1/10.
//  Copyright 2010 Kevin Scott. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>

@interface AddressAnnotation : NSObject<MKAnnotation> {
	CLLocationCoordinate2D coordinate;
	NSString *mTitle;
	NSString *mSubTitle;
}


- (id) initWithCoordinate:(CLLocationCoordinate2D) c andTitle:(NSString*) title andSubtitle:(NSString*) subtitle;
@end
