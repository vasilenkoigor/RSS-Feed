//
//  FeedModuleFeedModuleInteractorOutput.h
//  RSS-Feed
//
//  Created by Igor Vasilenko on 02/07/2016.
//  Copyright © 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ItemInfoModel;

@protocol FeedModuleInteractorOutput <NSObject>

- (void)didLoadRssFeed:(NSArray <ItemInfoModel *> *)rssFeedArray error:(NSError *)error;

@end
