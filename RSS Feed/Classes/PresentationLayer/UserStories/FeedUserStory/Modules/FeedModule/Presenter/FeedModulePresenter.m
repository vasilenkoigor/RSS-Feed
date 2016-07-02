//
//  FeedModuleFeedModulePresenter.m
//  RSS-Feed
//
//  Created by Igor Vasilenko on 02/07/2016.
//  Copyright © 2016 Igor Vasilenko. All rights reserved.
//

#import "FeedModulePresenter.h"

#import "FeedModuleViewInput.h"
#import "FeedModuleInteractorInput.h"
#import "FeedModuleRouterInput.h"

@implementation FeedModulePresenter

#pragma mark - Методы FeedModuleModuleInput

- (void)configureModule {
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы FeedModuleViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
}

#pragma mark - Методы FeedModuleInteractorOutput

@end
