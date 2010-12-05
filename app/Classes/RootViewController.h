//
//  RootViewController.h
//  Cities
//
//  Created by Kevin Scott on 11/27/10.
//  Copyright 2010 Kevin Scott. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreData/CoreData.h>
#import "City.h"

@interface RootViewController : UIViewController <MKMapViewDelegate> {
	NSMutableArray *cities;
	IBOutlet MKMapView *mapview;
    
    NSManagedObjectContext *managedObjectContext;
	
}

@property(nonatomic, retain) IBOutlet MKMapView *mapview;
@property(nonatomic, retain) NSMutableArray *cities;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;


@end
