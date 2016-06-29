//
//  NetwokClientTest.m
//  RSS Feed
//
//  Created by Igor Vasilenko on 30/06/16.
//  Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <MWFeedParser/MWFeedParser.h>
#import "CommonNetworkClient.h"

@interface NetwokClientTest : XCTestCase

@property (strong, nonatomic) id <NetworkClient> networkClient;
@property (strong, nonatomic) id mockFeedParser;

@end

@implementation NetwokClientTest

- (void)setUp
{
    [super setUp];

    self.mockFeedParser = OCMClassMock([MWFeedParser class]);
    self.networkClient = [[CommonNetworkClient alloc] initWithFeedParser:self.mockFeedParser];
}

- (void)tearDown
{
    self.networkClient = nil;
    [super tearDown];
}

- (void)testNetworkClientInitiateParsingFeed
{
    // when
    [self.networkClient sendRequestWithCompletionBlock:OCMOCK_ANY];

    // then
    OCMVerify([self.mockFeedParser parse]);
}

@end
