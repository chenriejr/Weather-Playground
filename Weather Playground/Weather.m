//
//  Weather.m
//  Weather Playground
//
//  Created by Cal Henrie on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Weather.h"

static NSString * const locationKey = @"name";
static NSString * const mainKey = @"main";
static NSString * const descriptionKey = @"description";
static NSString * const iconKey = @"icon";
static NSString * const tempKey = @"temp";



@implementation Weather

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
	self = [super init];
	
	if (self) {
		self.locationName = dictionary[@"name"];
		self.weatherMain = dictionary[@"weather"][0][@"main"];
		self.weatherDescription = dictionary[@"weather"][0][@"description"];
		self.weatherIcon = dictionary[@"weather"][0][@"icon"];
		self.weatherTemp = dictionary[@"main"][@"temp"];
	}
	return self;
	
}

@end
