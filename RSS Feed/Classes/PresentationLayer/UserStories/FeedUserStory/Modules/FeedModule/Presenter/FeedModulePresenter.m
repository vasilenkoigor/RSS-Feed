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

- (void)configureModule
{
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы FeedModuleViewOutput

- (void)didTriggerViewReadyEvent
{
	[self.view setupInitialState];
	[self.interactor loadRssFeedFromAllServicesList];
}

- (void)didTriggerPullToRefreshEvent
{
	[self.view initiateStartRefreshingFeedState];
	[self.interactor loadRssFeedFromAllServicesList];
}

#pragma mark - Методы FeedModuleInteractorOutput

- (void)didLoadRssFeed:(NSArray <ItemInfoModel *> *)rssFeedArray error:(NSError *)error
{
	[self.view stopRefreshingFeedState];

	if (error) {
		[self.view showAlertWithTitle:nil
							  message:@"Something went wrong"];
	} else {
		[self.view updateStateWithFeed:rssFeedArray];
	}
}

@end
