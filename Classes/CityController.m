    //
//  CityController.m
//  Cities
//
//  Created by Kevin Scott on 11/27/10.
//  Copyright 2010 Kevin Scott. All rights reserved.
//

#import "CityController.h"


@implementation CityController

@synthesize webview;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];	
	
	//NSString *path = [[NSBundle mainBundle] bundlePath];
	//NSURL *baseURL = [NSURL fileURLWithPath:path];
	//[webview loadHTMLString:@"style.css" baseURL:baseURL];
	
	[webview loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"]isDirectory:NO]]];
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
	[webview release];
    [super dealloc];
}


@end
