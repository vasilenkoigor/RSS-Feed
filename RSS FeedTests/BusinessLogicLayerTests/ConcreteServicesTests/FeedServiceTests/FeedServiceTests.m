//
//  FeedServiceTests.m
//  RSS Feed
//
//  Created by Igor Vasilenko on 02/07/16.
//  Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <XCTest/XCTestCase.h>
#import <OCMock/OCMock.h>
#import <ReactiveCocoa/RACSignal.h>
#import "FeedService.h"
#import "NetworkClient.h"
#import "FeedServiceImpl.h"
#import "CommonNetworkClient.h"

@interface FeedServiceTests : XCTestCase

@property (strong, nonatomic) id <FeedService> feedService;
@property (strong, nonatomic) id <NetworkClient> mockNetworkClient;

@end

@implementation FeedServiceTests

- (void)setUp
{
    [super setUp];

    self.mockNetworkClient = OCMClassMock([CommonNetworkClient class]);
    self.feedService = [[FeedServiceImpl alloc] initWithNetworkClient:self.mockNetworkClient];
}

- (void)tearDown
{
    self.mockNetworkClient = nil;
    self.feedService = nil;
    [super tearDown];
}

- (void)testThatNetworkClientSendRequest
{
    // when
    [[self.feedService rac_requestRssFeed] subscribeNext:^(id x) {

    }];

    // then
    OCMVerify([self.mockNetworkClient sendRequestWithCompletionBlock:OCMOCK_ANY]);
}

@end
