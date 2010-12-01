//
//  CityController.h
//  Cities
//
//  Created by Kevin Scott on 11/27/10.
//  Copyright 2010 Kevin Scott. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressAnnotation.h"

@interface CityController : UIViewController <UIWebViewDelegate> {
	IBOutlet UIWebView *webview;
	AddressAnnotation *city;
	NSString *cityState;
}

@property (nonatomic, retain) IBOutlet UIWebView *webview;
@property (nonatomic, retain) AddressAnnotation *city;
@property (nonatomic, retain) NSString *cityState;

@end
