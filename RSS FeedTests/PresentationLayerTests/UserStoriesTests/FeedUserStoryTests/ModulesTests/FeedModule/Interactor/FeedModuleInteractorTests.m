//
//  FeedModuleFeedModuleInteractorTests.m
//  RSS-Feed
//
//  Created by Igor Vasilenko on 02/07/2016.
//  Copyright © 2016 Igor Vasilenko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <ReactiveCocoa/RACSignal.h>
#import <MWFeedParser/MWFeedItem.h>

#import "FeedModuleInteractor.h"

#import "FeedModuleInteractorOutput.h"
#import "FeedServiceImpl.h"
#import "CommonNetworkClient.h"
#import "ItemInfoModel.h"

@interface FeedModuleInteractorTests : XCTestCase

@property (nonatomic, strong) FeedModuleInteractor *interactor;

@property (nonatomic, strong) id mockFeedService;
@property (nonatomic, strong) id mockOutput;

@end

@implementation FeedModuleInteractorTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp
{
    [super setUp];

    self.interactor = [[FeedModuleInteractor alloc] init];

    id mockNetworkClient = OCMPartialMock([CommonNetworkClient new]);
    self.mockFeedService = OCMPartialMock([[FeedServiceImpl alloc] initWithNetworkClient:mockNetworkClient]);

    self.interactor.gazetaFeedService = self.mockFeedService;
    self.interactor.lentaFeedService = self.mockFeedService;

    self.mockOutput = OCMProtocolMock(@protocol(FeedModuleInteractorOutput));
    self.interactor.output = self.mockOutput;
}

- (void)tearDown
{
    self.interactor = nil;
    self.mockOutput = nil;
    self.mockFeedService = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов FeedModuleInteractorInput

- (void)testThatInteractorCallDidLoadRssFeedOnFinishRssRequest
{
    // when
    RACSignal *rac_stubSignal = [RACSignal return:@[[MWFeedItem new]]];
    OCMStub([self.mockFeedService rac_requestRssFeed]).andReturn(rac_stubSignal);
    [self.interactor loadRssFeedFromAllServicesList];

    // then
    OCMVerify([self.mockOutput didLoadRssFeed:OCMOCK_ANY error:OCMOCK_ANY]);
}

- (void)testThatInteractorCallDidLoadRssFeedOnFailingRssRequest
{
    // when
    RACSignal *rac_stubSignal = [RACSignal error:[NSError new]];
    OCMStub([self.mockFeedService rac_requestRssFeed]).andReturn(rac_stubSignal);
    [self.interactor loadRssFeedFromAllServicesList];

    // then
    OCMVerify([self.mockOutput didLoadRssFeed:OCMOCK_ANY error:OCMOCK_ANY]);
}

@end
