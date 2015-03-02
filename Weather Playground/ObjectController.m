//
//  ObjectController.m
//  Weather Playground
//
//  Created by Cal Henrie on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ObjectController.h"
#import "NetworkController.h"
#import "Weather.h"
#import <AFNetworking/AFNetworking.h>

@implementation ObjectController

+ (instancetype)sharedInstance {
	static ObjectController *sharedInstance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedInstance = [[self alloc] init];
	});
	return sharedInstance;
}

- (void)getWeatherWithName:(NSString *)name completion:(void (^)(Weather *weather))completion {
	
	NSString *path = [NSString stringWithFormat:@"weather?q=%@", name];
	
	[[NetworkController api] GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
		
		NSLog(@"getWeatherWithName: %@", responseObject);
		NSDictionary *responseDictionary = responseObject;
		Weather *weatherObject = [[Weather alloc] initWithDictionary:responseDictionary];
		completion(weatherObject);
		
	} failure:^(NSURLSessionDataTask *task, NSError *error) {
		NSLog(@"Error getting weather: %@", error);
		completion(nil);
	}];
	
}


@end
