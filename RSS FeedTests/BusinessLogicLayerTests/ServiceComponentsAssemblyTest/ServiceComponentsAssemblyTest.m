//
//  ServiceComponentsAssemblyTest.m
//  RSS Feed
//
//  Created by Igor Vasilenko on 02/07/16.
//  Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Typhoon/TyphoonAssembly.h>
#import <RamblerTyphoonUtils/RamblerTyphoonAssemblyTestsTypeDescriptor.h>
#import <RamblerTyphoonUtils/RamblerTyphoonAssemblyTests.h>
#import "ServiceComponents.h"
#import "ServiceComponentsAssembly.h"
#import "FeedServiceImpl.h"
#import "NetworkClientsAssembly.h"

@interface ServiceComponentsAssemblyTest : RamblerTyphoonAssemblyTests

@property (strong, nonatomic) TyphoonAssembly <ServiceComponents> *serviceComponentsAssembly;

@end

@implementation ServiceComponentsAssemblyTest

- (void)setUp
{
    [super setUp];

    TyphoonAssembly *networkClientsAssembly = [[NetworkClientsAssembly assembly] activate];
    self.serviceComponentsAssembly = [[ServiceComponentsAssembly assembly] activateWithCollaboratingAssemblies:@[networkClientsAssembly]];
}

- (void)tearDown
{
    self.serviceComponentsAssembly = nil;
    [super tearDown];
}

- (void)testThatAssemblyCreatesGazetaFeedService
{
    // given
    Class expectedClass = [FeedServiceImpl class];
    NSArray *expectedProtocols =
            @[
                    @protocol(FeedService)
            ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *resultTypeDescriptor =
            [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:expectedClass
                                                              andProtocols:expectedProtocols];
    NSArray *dependencies =
            @[
                    RamblerSelector(networkClient)
            ];
    // when
    id result = [self.serviceComponentsAssembly gazetaFeedService];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:resultTypeDescriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesLentaFeedService
{
    // given
    Class expectedClass = [FeedServiceImpl class];
    NSArray *expectedProtocols =
            @[
                    @protocol(FeedService)
            ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *resultTypeDescriptor =
            [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:expectedClass
                                                              andProtocols:expectedProtocols];
    NSArray *dependencies =
            @[
                    RamblerSelector(networkClient)
            ];
    // when
    id result = [self.serviceComponentsAssembly lentaFeedService];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:resultTypeDescriptor
                    dependencies:dependencies];
}

@end
