//
//  FeedModuleFeedModuleViewControllerTests.m
//  RSS-Feed
//
//  Created by Igor Vasilenko on 02/07/2016.
//  Copyright © 2016 Igor Vasilenko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "FeedModuleViewController.h"

#import "FeedModuleViewOutput.h"

@interface FeedModuleViewControllerTests : XCTestCase

@property (nonatomic, strong) FeedModuleViewController *controller;

@property (nonatomic, strong) id mockOutput;

@end

@implementation FeedModuleViewControllerTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.controller = [[FeedModuleViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(FeedModuleViewOutput));

    self.controller.output = self.mockOutput;
}

- (void)tearDown {
    self.controller = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование жизненного цикла

- (void)testThatControllerNotifiesPresenterOnDidLoad {
	// given

	// when
	[self.controller viewDidLoad];

	// then
	OCMVerify([self.mockOutput didTriggerViewReadyEvent]);
}

#pragma mark - Тестирование методов интерфейса

#pragma mark - Тестирование методов FeedModuleViewInput

@end
