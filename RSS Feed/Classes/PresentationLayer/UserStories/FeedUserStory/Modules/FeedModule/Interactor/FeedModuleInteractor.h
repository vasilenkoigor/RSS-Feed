//
//  FeedModuleFeedModuleInteractor.h
//  RSS-Feed
//
//  Created by Igor Vasilenko on 02/07/2016.
//  Copyright © 2016 Igor Vasilenko. All rights reserved.
//

#import "FeedModuleInteractorInput.h"

@protocol FeedModuleInteractorOutput;
@protocol FeedService;

@interface FeedModuleInteractor : NSObject <FeedModuleInteractorInput>

@property (nonatomic, weak) id<FeedModuleInteractorOutput> output;
@property (nonatomic, strong, readonly) id <FeedService> gazetaFeedService;
@property (nonatomic, strong, readonly) id <FeedService> lentaFeedService;

@end
