//
//  FeedModuleFeedModuleAssembly_Testable.h
//  RSS-Feed
//
//  Created by Igor Vasilenko on 02/07/2016.
//  Copyright © 2016 Igor Vasilenko. All rights reserved.
//

#import "FeedModuleAssembly.h"

@class FeedModuleViewController;
@class FeedModuleInteractor;
@class FeedModulePresenter;
@class FeedModuleRouter;
@class FeedDataDisplayManager;

@interface FeedModuleAssembly ()

- (FeedModuleViewController *)viewFeedModuleModule;
- (FeedModulePresenter *)presenterFeedModuleModule;
- (FeedModuleInteractor *)interactorFeedModuleModule;
- (FeedModuleRouter *)routerFeedModuleModule;
- (FeedDataDisplayManager *)dataDisplayManager;

@end
