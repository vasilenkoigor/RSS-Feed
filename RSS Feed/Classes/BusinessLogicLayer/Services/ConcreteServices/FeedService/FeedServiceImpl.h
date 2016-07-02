//
// Created by Igor Vasilenko on 02/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FeedService.h"

@protocol NetworkClient;

@interface FeedServiceImpl : NSObject <FeedService>

@property (strong, nonatomic, readonly) id <NetworkClient> networkClient;

- (instancetype)initWithNetworkClient:(id <NetworkClient>)networkClient;

@end
