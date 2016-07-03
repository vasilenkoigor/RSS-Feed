//
//  FeedDataDisplayManagerTests.m
//  RSS Feed
//
//  Created by Igor Vasilenko on 03/07/16.
//  Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface FeedDataDisplayManagerTests : XCTestCase

@property (strong, nonatomic) FeedDataDisplayManager *feedDataDisplayManager;

@end

@implementation FeedDataDisplayManagerTests

- (void)setUp
{
    [super setUp];

    self.feedDataDisplayManager = [FeedDataDisplayManager new];
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

@end
