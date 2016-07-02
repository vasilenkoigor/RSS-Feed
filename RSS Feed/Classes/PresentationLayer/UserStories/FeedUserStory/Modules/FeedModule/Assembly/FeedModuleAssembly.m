//
//  FeedModuleFeedModuleAssembly.m
//  RSS-Feed
//
//  Created by Igor Vasilenko on 02/07/2016.
//  Copyright © 2016 Igor Vasilenko. All rights reserved.
//

#import "FeedModuleAssembly.h"

#import "FeedModuleViewController.h"
#import "FeedModuleInteractor.h"
#import "FeedModulePresenter.h"
#import "FeedModuleRouter.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation FeedModuleAssembly

- (FeedModuleViewController *)viewFeedModuleModule {
    return [TyphoonDefinition withClass:[FeedModuleViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterFeedModuleModule]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterFeedModuleModule]];
                          }];
}

- (FeedModuleInteractor *)interactorFeedModuleModule {
    return [TyphoonDefinition withClass:[FeedModuleInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterFeedModuleModule]];
                          }];
}

- (FeedModulePresenter *)presenterFeedModuleModule {
    return [TyphoonDefinition withClass:[FeedModulePresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewFeedModuleModule]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorFeedModuleModule]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerFeedModuleModule]];
                          }];
}

- (FeedModuleRouter *)routerFeedModuleModule {
    return [TyphoonDefinition withClass:[FeedModuleRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewFeedModuleModule]];
                          }];
}

@end
