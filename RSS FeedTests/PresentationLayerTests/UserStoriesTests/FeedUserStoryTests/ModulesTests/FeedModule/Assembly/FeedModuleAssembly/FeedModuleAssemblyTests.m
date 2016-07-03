//
//  FeedModuleFeedModuleAssemblyTests.m
//  RSS-Feed
//
//  Created by Igor Vasilenko on 02/07/2016.
//  Copyright © 2016 Igor Vasilenko. All rights reserved.
//

#import <RamblerTyphoonUtils/AssemblyTesting.h>
#import <Typhoon/Typhoon.h>

#import "FeedModuleAssembly.h"
#import "FeedModuleAssembly_Testable.h"

#import "FeedModuleViewController.h"
#import "FeedModulePresenter.h"
#import "FeedModuleInteractor.h"
#import "FeedModuleRouter.h"
#import "ServiceComponentsAssembly.h"
#import "NetworkClientsAssembly.h"
#import "FeedDataDisplayManager.h"

@interface FeedModuleAssemblyTests : RamblerTyphoonAssemblyTests

@property (nonatomic, strong) FeedModuleAssembly *assembly;

@end

@implementation FeedModuleAssemblyTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp
{
    [super setUp];

    self.assembly = [[FeedModuleAssembly alloc] init];
    [self.assembly activateWithCollaboratingAssemblies:
            @[
                    [ServiceComponentsAssembly new],
                    [NetworkClientsAssembly assembly]
            ]
    ];
}

- (void)tearDown
{
    self.assembly = nil;

    [super tearDown];
}

#pragma mark - Тестирование создания элементов модуля

- (void)testThatAssemblyCreatesViewController
{
    // given
    Class targetClass = [FeedModuleViewController class];
    NSArray *protocols = @[
            @protocol(FeedModuleViewInput)
    ];
    NSArray *dependencies = @[
            RamblerSelector(output)
    ];

    // when
    id result = [self.assembly viewFeedModuleModule];

    // then
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesPresenter
{
    // given
    Class targetClass = [FeedModulePresenter class];
    NSArray *protocols = @[
            @protocol(FeedModuleModuleInput),
            @protocol(FeedModuleViewOutput),
            @protocol(FeedModuleInteractorOutput)
    ];
    NSArray *dependencies = @[
            RamblerSelector(interactor),
            RamblerSelector(view),
            RamblerSelector(router)
    ];

    // when
    id result = [self.assembly presenterFeedModuleModule];

    // then
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesInteractor
{
    // given
    Class targetClass = [FeedModuleInteractor class];
    NSArray *protocols = @[
            @protocol(FeedModuleInteractorInput)
    ];
    NSArray *dependencies = @[
            RamblerSelector(output),
            RamblerSelector(gazetaFeedService),
            RamblerSelector(lentaFeedService)
    ];

    // when
    id result = [self.assembly interactorFeedModuleModule];

    // then
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesRouter
{
    // given
    Class targetClass = [FeedModuleRouter class];
    NSArray *protocols = @[
            @protocol(FeedModuleRouterInput)
    ];

    // when
    id result = [self.assembly routerFeedModuleModule];

    // then
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:nil];
}

- (void)testThatAssemblyCreatesDataDisplayManager
{
    // given
    Class targetClass = [FeedDataDisplayManager class];
    NSArray *protocols = @[@protocol(DataDisplayManager)];

    // when
    id result = [self.assembly dataDisplayManager];

    // then
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass andProtocols:protocols];
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:nil];
}

@end
