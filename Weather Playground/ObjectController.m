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



@end
