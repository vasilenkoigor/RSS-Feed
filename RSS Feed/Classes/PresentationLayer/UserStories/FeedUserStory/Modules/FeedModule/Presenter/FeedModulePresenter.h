//
//  FeedModuleFeedModulePresenter.h
//  RSS-Feed
//
//  Created by Igor Vasilenko on 02/07/2016.
//  Copyright © 2016 Igor Vasilenko. All rights reserved.
//

#import "FeedModuleViewOutput.h"
#import "FeedModuleInteractorOutput.h"
#import "FeedModuleModuleInput.h"

@protocol FeedModuleViewInput;
@protocol FeedModuleInteractorInput;
@protocol FeedModuleRouterInput;

@interface FeedModulePresenter : NSObject <FeedModuleModuleInput, FeedModuleViewOutput, FeedModuleInteractorOutput>

@property (nonatomic, weak) id<FeedModuleViewInput> view;
@property (nonatomic, strong) id<FeedModuleInteractorInput> interactor;
@property (nonatomic, strong) id<FeedModuleRouterInput> router;

@end
