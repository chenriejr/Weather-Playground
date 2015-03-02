//
//  NetworkController.h
//  Weather Playground
//
//  Created by Cal Henrie on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPSessionManager;

@interface NetworkController : NSObject

+(AFHTTPSessionManager *)api;

@end
