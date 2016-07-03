//
//  FeedModuleFeedModuleRouter.h
//  RSS-Feed
//
//  Created by Igor Vasilenko on 02/07/2016.
//  Copyright © 2016 Igor Vasilenko. All rights reserved.
//

#import "FeedModuleRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface FeedModuleRouter : NSObject <FeedModuleRouterInput>

@property (nonatomic, weak) id <RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
