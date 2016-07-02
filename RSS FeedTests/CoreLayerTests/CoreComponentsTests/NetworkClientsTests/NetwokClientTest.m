//
//  NetwokClientTest.m
//  RSS Feed
//
//  Created by Igor Vasilenko on 30/06/16.
//  Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <XCTest/XCTestCase.h>
#import <OCMock/OCMock.h>
#import <MWFeedParser/MWFeedParser.h>
#import "CommonNetworkClient.h"

@interface NetwokClientTest : XCTestCase

@property (strong, nonatomic) id <NetworkClient> networkClient;
@property (strong, nonatomic) id mockFeedParser;
@property (copy, nonatomic) NetworkClientCompletionBlock completionBlock;

@end

@implementation NetwokClientTest

- (void)setUp
{
    [super setUp];

    self.completionBlock = ^(NSArray <MWFeedItem *> *result, NSError *error) {

    };
    self.mockFeedParser = OCMPartialMock([MWFeedParser new]);
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
    [self.networkClient sendRequestWithCompletionBlock:self.completionBlock];

    // then
    OCMVerify([self.mockFeedParser parse]);
}

- (void)testNetworkClientFinishParsingFeedSuccessCallback
{
    // when
    [self.networkClient sendRequestWithCompletionBlock:self.completionBlock];

    // then
    OCMVerify(self.completionBlock(nil, OCMClassMock([NSError class])));
}

- (void)testNetworkClientFinishParsingFeedFailCallback
{
    // when
    NSURL *stubURL = [[NSURL alloc] initWithString:@"http://www.gazeta.ru/export/rss/lenta.xml"];
    OCMStub([self.mockFeedParser url]).andReturn(stubURL);
    [self.networkClient sendRequestWithCompletionBlock:self.completionBlock];

    // then
    OCMVerify(self.completionBlock(nil, OCMClassMock([NSError class])));
}

@end
