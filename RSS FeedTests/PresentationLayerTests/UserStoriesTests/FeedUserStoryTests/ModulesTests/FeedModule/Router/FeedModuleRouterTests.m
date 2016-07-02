//
//  FeedModuleFeedModuleRouterTests.m
//  RSS-Feed
//
//  Created by Igor Vasilenko on 02/07/2016.
//  Copyright © 2016 Igor Vasilenko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "FeedModuleRouter.h"

@interface FeedModuleRouterTests : XCTestCase

@property (nonatomic, strong) FeedModuleRouter *router;

@end

@implementation FeedModuleRouterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.router = [[FeedModuleRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end
