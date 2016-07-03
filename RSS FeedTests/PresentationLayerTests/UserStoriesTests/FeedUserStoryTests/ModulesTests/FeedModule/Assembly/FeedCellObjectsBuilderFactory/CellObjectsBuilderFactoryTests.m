//
//  CellObjectsBuilderFactoryTests.m
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

@interface CellObjectsBuilderFactoryTests : RamblerTyphoonAssemblyTests

@property (strong, nonatomic) CellObjectsBuilderFactory *assembly;

@end

@implementation CellObjectsBuilderFactoryTests

- (void)setUp
{
    [super setUp];

    self.assembly = [[CellObjectsBuilderFactory assembly] activate];
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
    NSArray *protocols = @[@protocol(CellObjectsBuilderProtocol)];

    // when
    id result = [self.assembly dataDisplayManager];

    // then
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass andProtocols:protocols];
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:nil];
}

@end
