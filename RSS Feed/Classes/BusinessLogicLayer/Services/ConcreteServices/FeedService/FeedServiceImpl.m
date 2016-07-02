//
// Created by Igor Vasilenko on 02/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "FeedServiceImpl.h"
#import "NetworkClient.h"

@interface FeedServiceImpl ()

@property (strong, nonatomic, readwrite) id <NetworkClient> networkClient;

@end

@implementation FeedServiceImpl

- (instancetype)initWithNetworkClient:(id <NetworkClient>)networkClient
{
    self = [super init];
    if (self) {
        self.networkClient = networkClient;
    }
    return self;
}

- (RACSignal *)rac_requestRssFeed
{
    return [RACSignal createSignal:^RACDisposable *(id <RACSubscriber> subscriber) {
        [self.networkClient sendRequestWithCompletionBlock:^(NSArray <MWFeedItem *> *result, NSError *error) {
            if (error) {
                [subscriber sendError:error];
            }
            if (result) {
                [subscriber sendNext:result];
                [subscriber sendCompleted];
            }
        }];
        return nil;
    }];
}

@end
