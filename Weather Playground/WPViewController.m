//
//  WPViewController.m
//  Weather Playground
//
//  Created by Joshua Howland on 6/17/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "WPViewController.h"
#import "ObjectController.h"
#import "Weather.h"
#import "NetworkController.h"
#import "UIImageView+AFNetworking.h"

@interface WPViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UILabel *main;
@property (weak, nonatomic) IBOutlet UILabel *information;
@property (weak, nonatomic) IBOutlet UILabel *temp;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation WPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

- (double)celsiusFromKelvinString:(NSString *)kelvin
{
	double kelvinDouble = [kelvin doubleValue];
	return kelvinDouble - 273.15;
}

- (IBAction)search:(id)sender {
	
	[[ObjectController sharedInstance] getWeatherWithName:[self.textField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] completion:^(Weather *weather) {
		self.location.text = weather.locationName;
		self.temp.text = [NSString stringWithFormat:@"%.1fº C", [self celsiusFromKelvinString:weather.weatherTemp]];
		self.main.text = weather.weatherMain;
		self.information.text = weather.weatherDescription;
		
		NSString *iconString = [NSString stringWithFormat:@"http://openweathermap.org/img/w%@.png", weather.weatherIcon];
		NSURL *iconURL = [NSURL URLWithString:iconString];
		[self.image setImageWithURL:iconURL];
	}];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
