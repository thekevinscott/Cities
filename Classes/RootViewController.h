//
//  RootViewController.h
//  Cities
//
//  Created by Kevin Scott on 11/27/10.
//  Copyright 2010 Kevin Scott. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface RootViewController : UIViewController <MKMapViewDelegate> {
	
	IBOutlet MKMapView *mapview;
}

@property(nonatomic, retain) IBOutlet MKMapView *mapview;



@end
