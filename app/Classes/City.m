    //
//  City.m
//  Cities
//
//  Created by Kevin Scott on 11/30/10.
//  Copyright 2010 Kevin Scott. All rights reserved.
//

#import "City.h"


@implementation City

@synthesize city, state, stateAbbr, locationString;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


-(id)initWithCityAndState: (NSString *)_city state:(NSString *)_state stateAbbr:(NSString *)_stateAbbr{
	self.city = _city;
	self.state = _state;
	self.stateAbbr = _stateAbbr;
	return self;
}
-(id)initWithCityAndStateAndLocation: (NSString *)_city state:(NSString *)_state locationString:(NSString *)_location {
//-(id)initWithCityAndState: (NSString *)_city state:(NSString *)_state stateAbbr:(NSString *)_stateAbbr{
	self.city = _city;
	self.state = _state;
	self.locationString = _location;
	
	/*
	
    NSArray *locationItems = [_location componentsSeparatedByString:@","];
	
	//CLLocationCoordinate2D location;
	location.latitude = [[locationItems objectAtIndex:0] doubleValue];
    location.longitude = [[locationItems objectAtIndex:1] doubleValue];
	
	//CLLocationCoordinate2D location = loc;
	
	
	[locationItems release];
	*/
	return self;
}

- (CLLocationCoordinate2D )location{
//	NSLog(@"Location");
//	NSLog(@"%@",self.locationString);
	NSArray *locationItems = [self.locationString componentsSeparatedByString:@","];
//	NSLog(@"%@",locationItems);
	CLLocationCoordinate2D loc;
	loc.latitude = [[locationItems objectAtIndex:0] doubleValue];
    loc.longitude = [[locationItems objectAtIndex:1] doubleValue];
	return loc;
	
	
}


- (NSString *)description {
	NSString *output = [NSString stringWithFormat:@"City: %@, State: %@",self.city,self.state];
	return output;
}

- (void)dealloc {
	[city release];
	[state release];
	[stateAbbr release];
	[locationString release];
    [super dealloc];
}


@end
