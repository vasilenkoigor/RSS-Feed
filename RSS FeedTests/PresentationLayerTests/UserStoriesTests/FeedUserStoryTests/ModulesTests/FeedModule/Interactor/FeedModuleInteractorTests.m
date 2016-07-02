//
//  FeedModuleFeedModuleInteractorTests.m
//  RSS-Feed
//
//  Created by Igor Vasilenko on 02/07/2016.
//  Copyright © 2016 Igor Vasilenko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "FeedModuleInteractor.h"

#import "FeedModuleInteractorOutput.h"

@interface FeedModuleInteractorTests : XCTestCase

@property (nonatomic, strong) FeedModuleInteractor *interactor;

@property (nonatomic, strong) id mockOutput;

@end

@implementation FeedModuleInteractorTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.interactor = [[FeedModuleInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(FeedModuleInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов FeedModuleInteractorInput

@end
