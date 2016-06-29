//
//  NetworkClientsAssemblyTest.m
//  RSS Feed
//
//  Created by Igor Vasilenko on 30/06/16.
//  Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <RamblerTyphoonUtils/RamblerTyphoonAssemblyTestsTypeDescriptor.h>
#import <RamblerTyphoonUtils/AssemblyTesting.h>
#import <OCMock/OCMock.h>
#import "NetworkClientsFactory.h"
#import "NetworkClientsAssembly.h"
#import "CommonNetworkClient.h"

@interface NetworkClientsAssemblyTest : RamblerTyphoonAssemblyTests

@property (strong, nonatomic) id <NetworkClientsFactory> networkClientsFactory;

@end

@implementation NetworkClientsAssemblyTest

- (void)setUp
{
    [super setUp];

    self.networkClientsFactory = [[NetworkClientsAssembly assembly] activate];
}

- (void)tearDown
{
    self.networkClientsFactory = nil;
    [super tearDown];
}

- (void)testThatAssemblyCreatesNetworkClient
{
    // given
    Class expectedClass = [CommonNetworkClient class];
    NSArray *expectedProtocols =
            @[
                    @protocol(NetworkClient)
            ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *resultTypeDescriptor =
            [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:expectedClass
                                                              andProtocols:expectedProtocols];
    NSArray *dependencies =
            @[
            RamblerSelector(parser)
            ];
    // when
    id result = [self.networkClientsFactory networkClientWithURL:OCMClassMock([NSURL class])];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:resultTypeDescriptor
                    dependencies:dependencies];
}

@end
