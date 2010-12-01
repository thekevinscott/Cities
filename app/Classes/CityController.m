    //
//  CityController.m
//  Cities
//
//  Created by Kevin Scott on 11/27/10.
//  Copyright 2010 Kevin Scott. All rights reserved.
//

#import "CityController.h"


@implementation CityController

@synthesize webview, city, cityState;


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
	webview.delegate = self;
	[webview loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"www"]isDirectory:NO]]];
}



- (void)webViewDidFinishLoad:(UIWebView *)wv {
	cityState = [[NSString stringWithFormat:@"%@_%@",[city title],[city subtitle]] stringByReplacingOccurrencesOfString:@" " withString:@"_"];

	NSString *data;
	
	if ([cityState isEqualToString:@"Portland_Oregon"]) {
		data = @"test";
		
		data = @"{"
		"			title: 'Portland, Oregon', "
		"			slideshow: [\"photos/Portland_Oregon/medium/382904443.jpg\",\"photos/Portland_Oregon/medium/4409585311.jpg\",\"photos/Portland_Oregon/medium/2701013246.jpg\",\"photos/Portland_Oregon/medium/55550318.jpg\",\"photos/Portland_Oregon/medium/3785009524.jpg\",\"photos/Portland_Oregon/medium/487660912.jpg\",\"photos/Portland_Oregon/medium/2663909610.jpg\",\"photos/Portland_Oregon/medium/2652791069.jpg\",\"photos/Portland_Oregon/medium/4695278658.jpg\",\"photos/Portland_Oregon/medium/4172713690.jpg\",\"photos/Portland_Oregon/medium/3033782184.jpg\",\"photos/Portland_Oregon/medium/2646795994.jpg\",\"photos/Portland_Oregon/medium/3637323413.jpg\",\"photos/Portland_Oregon/medium/4255126286.jpg\",\"photos/Portland_Oregon/medium/2777229711.jpg\",\"photos/Portland_Oregon/medium/95178823.jpg\",\"photos/Portland_Oregon/medium/4639955289.jpg\",\"photos/Portland_Oregon/medium/3752265964.jpg\",\"photos/Portland_Oregon/medium/4361034525.jpg\",\"photos/Portland_Oregon/medium/2650822735.jpg\",\"photos/Portland_Oregon/medium/2996084985.jpg\",\"photos/Portland_Oregon/medium/2657726223.jpg\",\"photos/Portland_Oregon/medium/4645503688.jpg\",\"photos/Portland_Oregon/medium/4059980448.jpg\",\"photos/Portland_Oregon/medium/3867873351.jpg\",\"photos/Portland_Oregon/medium/2740661357.jpg\",\"photos/Portland_Oregon/medium/83685227.jpg\",\"photos/Portland_Oregon/medium/3124814946.jpg\",\"photos/Portland_Oregon/medium/193056952.jpg\",\"photos/Portland_Oregon/medium/2686823791.jpg\",\"photos/Portland_Oregon/medium/354382244.jpg\",\"photos/Portland_Oregon/medium/3782715922.jpg\",\"photos/Portland_Oregon/medium/88102183.jpg\",\"photos/Portland_Oregon/medium/2655690728.jpg\",\"photos/Portland_Oregon/medium/4489599059.jpg\",\"photos/Portland_Oregon/medium/3857885853.jpg\",\"photos/Portland_Oregon/medium/3884304357.jpg\",\"photos/Portland_Oregon/medium/4928246624.jpg\",\"photos/Portland_Oregon/medium/4372164934.jpg\",\"photos/Portland_Oregon/medium/2710425297.jpg\",\"photos/Portland_Oregon/medium/242825257.jpg\",\"photos/Portland_Oregon/medium/435342679.jpg\",\"photos/Portland_Oregon/medium/3641646257.jpg\",\"photos/Portland_Oregon/medium/4415908017.jpg\",\"photos/Portland_Oregon/medium/3970785697.jpg\",\"photos/Portland_Oregon/medium/4918285629.jpg\",\"photos/Portland_Oregon/medium/4058915240.jpg\",\"photos/Portland_Oregon/medium/4312536798.jpg\",\"photos/Portland_Oregon/medium/3109392219.jpg\",\"photos/Portland_Oregon/medium/4608073012.jpg\",\"photos/Portland_Oregon/medium/2689002677.jpg\",\"photos/Portland_Oregon/medium/4747313697.jpg\",\"photos/Portland_Oregon/medium/4308467926.jpg\",\"photos/Portland_Oregon/medium/2273282663.jpg\",\"photos/Portland_Oregon/medium/4419430968.jpg\",\"photos/Portland_Oregon/medium/4299828782.jpg\",\"photos/Portland_Oregon/medium/4231572091.jpg\",\"photos/Portland_Oregon/medium/4610427107.jpg\",\"photos/Portland_Oregon/medium/4145744331.jpg\",\"photos/Portland_Oregon/medium/4686667205.jpg\",\"photos/Portland_Oregon/medium/4957274459.jpg\",\"photos/Portland_Oregon/medium/5207356598.jpg\",\"photos/Portland_Oregon/medium/4267294681.jpg\",\"photos/Portland_Oregon/medium/2357461696.jpg\",\"photos/Portland_Oregon/medium/4305883026.jpg\",\"photos/Portland_Oregon/medium/2957735266.jpg\",\"photos/Portland_Oregon/medium/2119884234.jpg\",\"photos/Portland_Oregon/medium/4331925814.jpg\",\"photos/Portland_Oregon/medium/3505684515.jpg\",\"photos/Portland_Oregon/medium/4029683967.jpg\",\"photos/Portland_Oregon/medium/3422110954.jpg\",\"photos/Portland_Oregon/medium/4568387260.jpg\",\"photos/Portland_Oregon/medium/4093777432.jpg\",\"photos/Portland_Oregon/medium/4602616434.jpg\",\"photos/Portland_Oregon/medium/3693567432.jpg\",\"photos/Portland_Oregon/medium/4290069830.jpg\",\"photos/Portland_Oregon/medium/5162341217.jpg\",\"photos/Portland_Oregon/medium/3416309800.jpg\",\"photos/Portland_Oregon/medium/3833115084.jpg\",\"photos/Portland_Oregon/medium/773180276.jpg\"],"
		"			introduction: \"<p>Portland is a city located in the Northwestern United States, near the confluence of the Willamette and Columbia rivers in the state of Oregon. As of July 2009, it has an estimated population of 582,130, making it the 30th most populous in the United States. Portland is Oregon's most populous city, and the third most populous city in the Pacific Northwest, after Seattle, Washington and Vancouver, British Columbia, Canada. Approximately 2.2 million people live in the Portland metropolitan area (MSA), the 23rd most populous in the United States as of July 2006.</p><p>Portland was incorporated in 1851 and is the county seat of Multnomah County. The city extends slightly into Washington County to the west and Clackamas County to the south. It is governed by a commission-based government headed by a mayor and four other commissioners.</p>\","
		"			sections: ["
		"				{"
		"					title: \"History\","
		"					excerpt: \"Portland started as a spot known as \"the clearing,\" which was on the banks of the Willamette about halfway between Oregon City and Fort Vancouver. In 1843, William Overton saw great commercial potential for this land ...\","
		"					content: \"Portland started as a spot known as \"the clearing,\" which was on the banks of the Willamette about halfway between Oregon City and Fort Vancouver. In 1843, William Overton saw great commercial potential for this land but lacked the funds required to file a land claim. He struck a bargain with his partner, Asa Lovejoy of Boston, Massachusetts: for 25¢, Overton would share his claim to the 640 acre (2.6 km²) site. Overton later sold his half of the claim to Francis W. Pettygrove of Portland, Maine. Pettygrove and Lovejoy each wished to name the new city after his respective home town; this was decided with a coin toss, which Pettygrove won in a series of two out of three tosses.[13] The coin used for this decision, now known as the Portland Penny, is on display in the headquarters of the Oregon Historical Society.</p><p>At the time of its incorporation on February 8, 1851 Portland had over 800 inhabitants,[14] a steam sawmill, a log cabin hotel, and a newspaper, the Weekly Oregonian. By 1879, the population had grown to 17,500.[15] The city merged with Albina and East Portland in 1891, and annexed the cities of Linnton and St. Johns in 1915.</p><p>Portland's location, with access both to the Pacific Ocean via the Willamette and the Columbia rivers and to the agricultural Tualatin Valley via the \"Great Plank Road\" through a canyon in the West Hills (the route of current-day U.S. Route 26), gave it an advantage over nearby ports, and it grew very quickly.[16] It remained the major port in the Pacific Northwest for much of the 19th century, until the 1890s, when Seattle's deepwater harbor was connected to the rest of the mainland by rail, affording an inland route without the treacherous navigation of the Columbia River.\""
		"				},"
		"				{"
		"					title: \"Geography\","
		"					excerpt: \"Portland lies at the northern end of Oregon's most populated region, the Willamette Valley. However, as the metropolitan area is culturally and politically distinct from the rest of the valley, local usage often excludes Portland.\","
		"					content: \"Portland lies at the northern end of Oregon's most populated region, the Willamette Valley. However, as the metropolitan area is culturally and politically distinct from the rest of the valley, local usage often excludes Portland from the valley proper. Although almost all of Portland lies within Multnomah County, small portions of the city lie within Clackamas and Washington counties with mid-2005 populations estimated at 785 and 1,455, respectively. The Willamette River runs north through the city center, separating the east and west sections of the city before veering northwest to join with the Columbia River (which separates the state of Washington from the state of Oregon) a short distance north of the city.</p><p>According to the United States Census Bureau, the city has a total area of 145.4 sq mi (376.5 km²). 134.3 sq mi (347.9 km²) of it is land and 11.1 sq mi (28.6 km²), or 7.6%, is water.[30]</p><p>Portland lies on top of an extinct Plio-Pleistocene volcanic field known as the Boring Lava Field.[31] The Boring Lava Field includes at least 32 cinder cones such as Mount Tabor,[32] and its center lies in Southeast Portland. The dormant but potentially active volcano Mount Hood to the east of Portland is easily visible from much of the city during clear weather. The active volcano Mount Saint Helens to the north in Washington is visible in the distance from high-elevation locations in the city and is close enough to have dusted the city with volcanic ash after an eruption on May 18, 1980.[33] Mount Adams, another prominent volcano in Washington state to the northeast of Portland, is also visible from parts of the city.\""
		"				},"
		"				{"
		"					title: \"Culture\","
		"					excerpt: \"Portland is often awarded the \"Greenest City in America\", and ranks among the world's top 10 greenest cities. Popular Science has continued to award Portland the title of the Greenest City in America.\","
		"					content: \"Portland is often awarded the \"Greenest City in America\", and ranks among the world's top 10 greenest cities. Popular Science has continued to award Portland the title of the Greenest City in America and Grist magazine lists it as the second greenest city in the world. Portland is well known as a hub of American DIY youth culture. From the late 1980s through today, Portland has been a major center for movements such as zine-making. Portland is also home to radical feminist and lesbian activist movements as well as the home city of The World's Oldest Teenage Drag Queen Pageant Rose Bud and Thorn Pageant started in 1975 and modeled after the Imperial Sovereign Rose Court of Oregon, and the city is also considered a haven for punk, hardcore, crust punk and anarchist movements and subgenres, including the self-reliant DIY culture movement that has been part of the aforementioned subcultures.\""
		"				}			"
		"			],"
		"			articles: ["
		"				{title: \"Voodoo Doughnut\", excerpt: 'Voodoo Doughnut is an independent doughnut shop based in Portland, Oregon USA. It is known for its unusual doughnuts and decor.'},"
		"				{title: \"Shanghai tunnels\", excerpt: 'The Shanghai Tunnels, less commonly known as the Portland Underground, are a group of passages running underneath Old Town/Chinatown down to the central downtown section of Portland, Oregon, United States.'},"
		"				{title: \"Satyricon nightclub\", excerpt: 'Satyricon Nightclub was a nightclub best known for providing a place for local and touring alternative rock bands to play.'}"
		"			]"
		"		"
		"		}";
	}
	
	//NSLog(@"%@",cityState);
	
	[webview stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"run('%@')",@"{}"]];
	[data release];
	//[cityState release];
	//NSLog(@"Here");
}

- (void)webView:(UIWebView *)wv didFailLoadWithError:(NSError *)error {
    NSLog (@"webView:didFailLoadWithError");
    if (error != NULL) {
        UIAlertView *errorAlert = [[UIAlertView alloc]
								   initWithTitle: [error localizedDescription]
								   message: [error localizedFailureReason]
								   delegate:nil
								   cancelButtonTitle:@"OK" 
								   otherButtonTitles:nil];
        [errorAlert show];
        [errorAlert release];
    }
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
	[cityState release];
	[city release];
	[webview release];
    [super dealloc];
}


@end