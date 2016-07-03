//
//  FeedDataDisplayManagerTests.m
//  RSS Feed
//
//  Created by Igor Vasilenko on 03/07/16.
//  Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "FeedDataDisplayManager.h"
#import "FeedCellObjectsBuilder.h"
#import "ItemInfoModel.h"

@interface FeedDataDisplayManagerTests : XCTestCase

@property (strong, nonatomic) FeedDataDisplayManager *feedDataDisplayManager;
@property (strong, nonatomic) id mockedFeedCellObjectsBuilder;

@end

@implementation FeedDataDisplayManagerTests

- (void)setUp
{
    [super setUp];

    self.feedDataDisplayManager = [FeedDataDisplayManager new];
    self.mockedFeedCellObjectsBuilder = OCMClassMock([FeedCellObjectsBuilder class]);
    self.feedDataDisplayManager.feedCellObjectsBuilder = self.mockedFeedCellObjectsBuilder;
}

- (void)tearDown
{
    self.feedDataDisplayManager = nil;
    [super tearDown];
}

- (void)testThatFeedDataDisplayManagerReturnsTableViewDataSource
{
    // given

    // when
    id <UITableViewDataSource> dataSource = [self.feedDataDisplayManager dataSourceForTableView:nil];

    // then
    XCTAssertNotNil(dataSource);
}

- (void)testThatFeedDataDisplayManagerReturnsTableViewDelegate
{
    // given

    // when
    id <UITableViewDelegate> delegate = [self.feedDataDisplayManager delegateForTableView:nil
                                                                    baseTableViewDelegate:nil];

    // then
    XCTAssertNotNil(delegate);
}

- (void)testThatFeedCellObjectsBuilderCreatesObjectsOnSetupDisplayManager
{
    // given
    NSArray *feed = @[[ItemInfoModel new]];

    // when
    [self.feedDataDisplayManager configureDataDiplayManagerWithFeed:feed];

    // then
    OCMVerify([self.mockedFeedCellObjectsBuilder cellObjectsForFeed:OCMOCK_ANY]);
}

@end
