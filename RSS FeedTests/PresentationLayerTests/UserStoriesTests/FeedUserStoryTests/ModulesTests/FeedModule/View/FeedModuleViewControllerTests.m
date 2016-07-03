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
#import "ItemInfoModel.h"
#import "FeedDataDisplayManager.h"

@interface FeedModuleViewControllerTests : XCTestCase

@property (nonatomic, strong) FeedModuleViewController *controller;

@property (nonatomic, strong) id mockOutput;
@property (nonatomic, strong) FeedDataDisplayManager *mockDataDisplayManager;
@property (nonatomic, strong) UITableView *mockTableView;

@end

@implementation FeedModuleViewControllerTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp
{
    [super setUp];

    self.controller = [[FeedModuleViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(FeedModuleViewOutput));
    self.mockDataDisplayManager = OCMClassMock([FeedDataDisplayManager class]);
    self.mockTableView = OCMClassMock([UITableView class]);

    self.controller.output = self.mockOutput;
    self.controller.feedDataDisplayManager = self.mockDataDisplayManager;
    self.controller.tableView = self.mockTableView;
}

- (void)tearDown
{
    self.controller = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование жизненного цикла

- (void)testThatControllerNotifiesPresenterOnDidLoad
{
	// given

	// when
	[self.controller viewDidLoad];

	// then
	OCMVerify([self.mockOutput didTriggerViewReadyEvent]);
}

#pragma mark - Тестирование методов интерфейса

#pragma mark - Тестирование методов FeedModuleViewInput

- (void)testSuccessConfigureViewWithEvent
{
    // given
    NSArray *feed = @[[ItemInfoModel new], [ItemInfoModel new]];

    id dataSource = OCMProtocolMock(@protocol(UITableViewDataSource));
    id delegate = OCMProtocolMock(@protocol(UITableViewDelegate));

    OCMStub([self.mockDataDisplayManager dataSourceForTableView:self.mockTableView]).andReturn(dataSource);
    OCMStub([self.mockDataDisplayManager delegateForTableView:self.mockTableView baseTableViewDelegate:nil]).andReturn(delegate);

    // when
    [self.controller updateStateWithFeed:feed];

    // then
    OCMVerify([self.mockTableView setDataSource:dataSource]);
    OCMVerify([self.mockTableView setDelegate:delegate]);
    OCMVerify([self.mockDataDisplayManager configureDataDisplayManagerWithFeed:feed]);
}


@end
