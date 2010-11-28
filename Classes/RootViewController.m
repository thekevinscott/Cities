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

@synthesize mapview;

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
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	
	
	
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
	
	[mapview addAnnotation:[[AddressAnnotation alloc] initWithCoordinate:[self addressLocation:@"New York, NY"] 
																andTitle:@"New York" andSubtitle:@"New York"]];
	[mapview addAnnotation:[[AddressAnnotation alloc] initWithCoordinate:[self addressLocation:@"Los Angeles, CA"] 
																andTitle:@"Los Angeles" andSubtitle:@"California"]];
	[mapview addAnnotation:[[AddressAnnotation alloc] initWithCoordinate:[self addressLocation:@"Chicago, IL"] 
																andTitle:@"Chicago" andSubtitle:@"Illinois"]];
	mapview.delegate = self;
	
	
	
	
	CityController *cv = [[CityController alloc] initWithNibName:@"CityController" bundle:nil];
	[self.navigationController pushViewController:cv animated:YES];
	[cv release];
	
	
	
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
    [rightButton addTarget:self action:@selector(annotationViewClick) forControlEvents:UIControlEventTouchUpInside];
	
    customAnnotationView.rightCalloutAccessoryView = rightButton;
    return customAnnotationView;
}

-(void)annotationViewClick {
	
	
	
	CityController *cv = [[CityController alloc] initWithNibName:@"CityController" bundle:nil];
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
	[mapview release];
    [super dealloc];
}


@end
