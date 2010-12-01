//
//  City.h
//  Cities
//
//  Created by Kevin Scott on 11/30/10.
//  Copyright 2010 Kevin Scott. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface City : UIViewController {
	NSString *city;
	NSString *state;
	NSString *stateAbbr;
	NSString *locationString;
	
	
}
@property (nonatomic, retain) NSString *city;
@property (nonatomic, retain) NSString *state;
@property (nonatomic, retain) NSString *stateAbbr;
@property (nonatomic, retain) NSString *locationString;

-(id)initWithCityAndState: (NSString *)_city state:(NSString *)_state stateAbbr:(NSString *)_stateAbbr;
-(id)initWithCityAndStateAndLocation: (NSString *)_city state:(NSString *)_state locationString:(NSString *)_location;
- (CLLocationCoordinate2D)location;
@end
