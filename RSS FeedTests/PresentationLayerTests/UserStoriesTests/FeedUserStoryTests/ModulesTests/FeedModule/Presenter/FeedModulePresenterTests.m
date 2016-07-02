//
//  FeedModuleFeedModulePresenterTests.m
//  RSS-Feed
//
//  Created by Igor Vasilenko on 02/07/2016.
//  Copyright © 2016 Igor Vasilenko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "FeedModulePresenter.h"

#import "FeedModuleViewInput.h"
#import "FeedModuleInteractorInput.h"
#import "FeedModuleRouterInput.h"

@interface FeedModulePresenterTests : XCTestCase

@property (nonatomic, strong) FeedModulePresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation FeedModulePresenterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.presenter = [[FeedModulePresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(FeedModuleInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(FeedModuleRouterInput));
    self.mockView = OCMProtocolMock(@protocol(FeedModuleViewInput));

    self.presenter.interactor = self.mockInteractor;
    self.presenter.router = self.mockRouter;
    self.presenter.view = self.mockView;
}

- (void)tearDown {
    self.presenter = nil;

    self.mockView = nil;
    self.mockRouter = nil;
    self.mockInteractor = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов FeedModuleModuleInput

#pragma mark - Тестирование методов FeedModuleViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
}

#pragma mark - Тестирование методов FeedModuleInteractorOutput

@end
