    //
//  RootViewController.m
//  Cities
//
//  Created by Kevin Scott on 11/27/10.
//  Copyright 2010 Kevin Scott. All rights reserved.
//

#import "RootViewController.h"
#import "CityController.h"
#import "AddressAnnotation.h"

@implementation RootViewController

@synthesize mapview, cities, city;
@synthesize managedObjectContext;

-(CLLocationCoordinate2D) addressLocation:(NSString *)address {
	
    NSString *urlString = [NSString stringWithFormat:@"http://maps.google.com/maps/geo?q=%@&output=csv", 
						   [address stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
	
	NSError* error;
    NSString *locationString = [NSString stringWithContentsOfURL:[NSURL URLWithString:urlString] encoding:NSASCIIStringEncoding error:&error];
    NSArray *listItems = [locationString componentsSeparatedByString:@","];
	
    CLLocationCoordinate2D location;
	
	location.latitude = [[listItems objectAtIndex:2] doubleValue];
    location.longitude = [[listItems objectAtIndex:3] doubleValue];
	return location;
}



/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	cities = [NSMutableArray arrayWithCapacity: 50];
	
	// will this cause a memory leak? Do I need to release this somehow?
	
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"New York" state:@"New York" locationString:@"40.7143528,-74.0059731"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Los Angeles" state:@"California" locationString:@"34.0522342,-118.2436849"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Chicago" state:@"Illinois" locationString:@"41.8781136,-87.6297982"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Houston" state:@"Texas" locationString:@"29.7628844,-95.3830615"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Phoenix" state:@"Arizona" locationString:@"33.4483771,-112.0740373"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Philadelphia" state:@"Pennsylvania" locationString:@"39.9523350,-75.1637890"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"San Antonio" state:@"Texas" locationString:@"29.4241219,-98.4936282"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"San Diego" state:@"California" locationString:@"32.7153292,-117.1572551"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Dallas" state:@"Texas" locationString:@"32.8029550,-96.7699230"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"San Jose" state:@"California" locationString:@"37.3393857,-121.8949555"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Detroit" state:@"Michigan" locationString:@"42.3314270,-83.0457538"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"San Francisco" state:@"California" locationString:@"37.7749295,-122.4194155"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Jacksonville" state:@"Florida" locationString:@"30.3321838,-81.6556510"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Indianapolis" state:@"Indiana" locationString:@"39.7683765,-86.1580423"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Austin" state:@"Texas" locationString:@"30.2671530,-97.7430608"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Columbus" state:@"Ohio" locationString:@"39.9611755,-82.9987942"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Fort Worth" state:@"Texas" locationString:@"32.7254090,-97.3208496"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Charlotte" state:@"North Carolina" locationString:@"35.2270869,-80.8431267"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Memphis" state:@"Tennessee" locationString:@"35.1495343,-90.0489801"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Boston" state:@"Massachusetts" locationString:@"42.3584308,-71.0597732"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Baltimore" state:@"Maryland" locationString:@"39.2903848,-76.6121893"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"El Paso" state:@"Texas" locationString:@"31.7587198,-106.4869314"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Seattle" state:@"Washington" locationString:@"47.6062095,-122.3320708"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Denver" state:@"Colorado" locationString:@"39.7391536,-104.9847034"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Nashville" state:@"Tennessee" locationString:@"36.1658899,-86.7844432"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Milwaukee" state:@"Wisconsin" locationString:@"43.0389025,-87.9064736"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Washington" state:@"District of Columbia" locationString:@"38.8951118,-77.0363658"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Las Vegas" state:@"Nevada" locationString:@"36.1146460,-115.1728160"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"LouisvilleÂ e[â€º]" state:@"Kentucky" locationString:@"38.2483754,-85.6948458"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Portland" state:@"Oregon" locationString:@"45.5234515,-122.6762071"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Oklahoma City" state:@"Oklahoma" locationString:@"35.4675602,-97.5164276"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Tucson" state:@"Arizona" locationString:@"32.2217429,-110.9264790"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Atlanta" state:@"Georgia" locationString:@"33.7489954,-84.3879824"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Albuquerque" state:@"New Mexico" locationString:@"35.0844909,-106.6511367"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Kansas City" state:@"Missouri" locationString:@"39.0997265,-94.5785667"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Fresno" state:@"California" locationString:@"36.7477272,-119.7723661"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Mesa" state:@"Arizona" locationString:@"33.4222685,-111.8226402"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Sacramento" state:@"California" locationString:@"38.5815719,-121.4943996"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Long Beach" state:@"California" locationString:@"33.8041667,-118.1580556"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Omaha" state:@"Nebraska" locationString:@"41.2540060,-95.9992580"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Virginia Beach" state:@"Virginia" locationString:@"36.8529263,-75.9779850"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Miami" state:@"Florida" locationString:@"25.7889689,-80.2264393"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Cleveland" state:@"Ohio" locationString:@"41.4994954,-81.6954088"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Oakland" state:@"California" locationString:@"37.8043722,-122.2708026"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Raleigh" state:@"North Carolina" locationString:@"35.7720960,-78.6386145"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Colorado Springs" state:@"Colorado" locationString:@"38.8338816,-104.8213634"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Tulsa" state:@"Oklahoma" locationString:@"36.1539816,-95.9927750"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Minneapolis" state:@"Minnesota" locationString:@"44.9799654,-93.2638361"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Arlington" state:@"Texas" locationString:@"32.7356870,-97.1080656"]];
	[cities addObject: [[City alloc] initWithCityAndStateAndLocation:@"Honolulu" state:@"Hawaii" locationString:@"21.3069444,-157.8583333"]];
	
	
	
	
	
	
	mapview.mapType = MKMapTypeHybrid;
	mapview.showsUserLocation=TRUE;
	mapview.zoomEnabled=YES;
	mapview.scrollEnabled=YES;
	MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } }; 
	region.center.latitude = 38.065392 ;
	region.center.longitude = -94.746094;
	region.span.longitudeDelta = 60.0f;
	region.span.latitudeDelta = 60.0f;
	mapview.region=region;
	
	
	
	for(City *c in cities) {
		//NSLog(@"%@",c);
		//[mapview addAnnotation:[[AddressAnnotation alloc] initWithCoordinate:[self addressLocation:[NSString stringWithFormat:@"%@, %@",c.city,c.state] ] 
		
		[mapview addAnnotation:[[AddressAnnotation alloc] initWithCoordinate:c.location andTitle:c.city andSubtitle:c.state]];
	
	}
	
/*
	[mapview addAnnotation:[[AddressAnnotation alloc] initWithCoordinate:[self addressLocation:@"New York, NY"] 
																andTitle:@"New York" andSubtitle:@"New York"]];
	[mapview addAnnotation:[[AddressAnnotation alloc] initWithCoordinate:[self addressLocation:@"Los Angeles, CA"] 
																andTitle:@"Los Angeles" andSubtitle:@"California"]];
	[mapview addAnnotation:[[AddressAnnotation alloc] initWithCoordinate:[self addressLocation:@"Chicago, IL"] 
																andTitle:@"Chicago" andSubtitle:@"Illinois"]];*/
	mapview.delegate = self;
	
	
	
	
	//CityController *cv = [[CityController alloc] initWithNibName:@"CityController" bundle:nil];
	//[self.navigationController pushViewController:cv animated:YES];
	//[cv release];
	
	
	
	//CityController *cityController = [[CityController alloc] initWithNibName:@"CityController" bundle:nil];
	//[self.navigationController pushViewController:cityController animated:YES];
	//[cityController release];
}


///// This is code to use a custom image for the pin
- (MKAnnotationView *) mapView:(MKMapView *) mapView viewForAnnotation:(id ) annotation {
	
    MKAnnotationView *customAnnotationView=[[[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil] autorelease];
    UIImage *pinImage = [UIImage imageNamed:@"conference.png"];
    [customAnnotationView setImage:pinImage];
    customAnnotationView.canShowCallout = YES;
	
    UIImageView *leftIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"small.jpg"]];
    customAnnotationView.leftCalloutAccessoryView = leftIconView;
	
	/*
	 
	 [button addTarget:self action:@selector(buttonPressed) 
	 forControlEvents:UIControlEventTouchUpInside];
	 */
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	
	
	rightButton.tag = annotation;
	
	//[detailButton addTarget:self action:@selector(showDetailView:) forControlEvents:UIControlEventTouchUpInside];

    [rightButton addTarget:self action:@selector(annotationViewClick:) forControlEvents:UIControlEventTouchUpInside];
	
    customAnnotationView.rightCalloutAccessoryView = rightButton;
    return customAnnotationView;
}

-(void)annotationViewClick:(UIView*)sender {
	
    //MyAnnotationObject *selectedObject = [self.annotations objectAtIndex:selectedIndex];
	
	
	CityController *cv = [[CityController alloc] initWithNibName:@"CityController" bundle:nil];
	cv.city = sender.tag;
	[self.navigationController pushViewController:cv animated:YES];
	[cv release];
}






- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[managedObjectContext release];
	
	[city release];
	[cities release];
	[mapview release];
    [super dealloc];
}


@end
