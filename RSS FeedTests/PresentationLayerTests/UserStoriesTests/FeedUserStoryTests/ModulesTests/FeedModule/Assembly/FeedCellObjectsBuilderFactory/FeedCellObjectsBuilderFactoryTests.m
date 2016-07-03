//
//  FeedCellObjectsBuilderFactoryTests.m
//  RSS Feed
//
//  Created by Igor Vasilenko on 03/07/16.
//  Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <RamblerTyphoonUtils/RamblerTyphoonAssemblyTestsTypeDescriptor.h>
#import <RamblerTyphoonUtils/RamblerTyphoonAssemblyTests.h>
#import "TyphoonAssembly.h"
#import "FeedCellObjectsBuilder.h"
#import "FeedCellObjectsBuilderFactory.h"

@interface FeedCellObjectsBuilderFactoryTests : RamblerTyphoonAssemblyTests

@property (strong, nonatomic) FeedCellObjectsBuilderFactory *assembly;

@end

@implementation FeedCellObjectsBuilderFactoryTests

- (void)setUp
{
    [super setUp];

    self.assembly = [[FeedCellObjectsBuilderFactory assembly] activate];
}

- (void)tearDown
{
    self.assembly = nil;
    [super tearDown];
}

- (void)testThatAssemblyCreatesFeedCellObjectsBuilder
{
    // given
    Class targetClass = [FeedCellObjectsBuilder class];

    // when
    id result = [self.assembly feedCellObjectsBuilder];

    // then
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass andProtocols:nil];
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:nil];
}

@end
