//
//  Weather.m
//  Weather Playground
//
//  Created by Cal Henrie on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Weather.h"

static NSString * const locationKey = @"location";
static NSString * const mainKey = @"main";
static NSString * const descriptionKey = @"description";
static NSString * const iconKey = @"icon";
static NSString * const tempKey = @"temp";



@implementation Weather

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
	self = [super init];
	
	if (self) {
		self.locationName = dictionary[locationKey];
		self.weatherMain = dictionary[mainKey];
		self.weatherDescription = dictionary[descriptionKey];
		self.weatherIcon = dictionary[iconKey];
		self.weatherTemp = dictionary[tempKey];
	}
	return self;
	
}

@end
