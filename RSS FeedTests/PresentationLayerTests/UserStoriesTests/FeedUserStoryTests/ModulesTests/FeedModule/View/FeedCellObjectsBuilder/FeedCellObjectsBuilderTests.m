//
//  FeedCellObjectsBuilderTests.m
//  RSS Feed
//
//  Created by Igor Vasilenko on 03/07/16.
//  Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ItemInfoModel.h"
#import "OCMArg.h"
#import "FeedCellObject.h"

@interface FeedCellObjectsBuilderTests : XCTestCase

@property (strong, nonatomic) FeedCellObjectsBuilder *feedCellObjectsBuilder;

@end

@implementation FeedCellObjectsBuilderTests

- (void)setUp
{
    [super setUp];

    self.feedCellObjectsBuilder = [[FeedCellObjectsBuilder alloc] init];
}

- (void)tearDown
{
    self.feedCellObjectsBuilder = nil;
    [super tearDown];
}

- (void)testThatFeedCellObjectsBuilderCreatesCorrectObjects
{
    // given
    NSArray *feedArray = @[[ItemInfoModel new], [ItemInfoModel new], [ItemInfoModel new]];
    static NSInteger expectedNumberOfItemsInFeed = 3;
    NSInteger actualNumberOfFeedCellObjects = 0;

    NSArray *cellObjects = [self.feedCellObjectsBuilder cellObjectsForFeed:feedArray];
    for (id cellObject in cellObjects) {
        if ([cellObject isKindOfClass:[FeedCellObject class]]) {
            actualNumberOfFeedCellObjects++;
        }
    }

    XCTAssertEqual(expectedNumberOfItemsInFeed, actualNumberOfFeedCellObjects);
}

@end
