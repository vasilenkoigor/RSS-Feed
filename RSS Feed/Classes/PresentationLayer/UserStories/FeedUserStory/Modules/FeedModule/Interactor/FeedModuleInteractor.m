//
//  FeedModuleFeedModuleInteractor.m
//  RSS-Feed
//
//  Created by Igor Vasilenko on 02/07/2016.
//  Copyright © 2016 Igor Vasilenko. All rights reserved.
//

#import <ReactiveCocoa/RACSignal+Operations.h>
#import <MWFeedParser/MWFeedItem.h>
#import <ReactiveCocoa/RACTuple.h>
#import "FeedModuleInteractor.h"

#import "FeedModuleInteractorOutput.h"
#import "FeedService.h"
#import "ItemInfoModel.h"

@implementation FeedModuleInteractor

#pragma mark - Методы FeedModuleInteractorInput

- (void)loadRssFeedFromAllServicesList
{
    RACSignal *gazetaRssFeedSignal = [self.gazetaFeedService rac_requestRssFeed];
    RACSignal *lentaRssFeedSignal = [self.lentaFeedService rac_requestRssFeed];

    [[[RACSignal combineLatest:@[gazetaRssFeedSignal, lentaRssFeedSignal]
                        reduce:^id(NSArray <MWFeedItem *> *gazetaFeed, NSArray <MWFeedItem *> *lentaFeed) {
                            return [self convertedRequestResultWithTuple:RACTuplePack(gazetaFeed, lentaFeed)];
                        }] map:^id(NSArray <MWFeedItem *> *feedItems) {
        return [self sortedFeedItemsByDate:feedItems];
    }] subscribeNext:^(NSArray <ItemInfoModel *> *result) {
        [self.output didLoadRssFeed:result error:nil];
    } error:^(NSError *error) {
        [self.output didLoadRssFeed:nil error:error];
    }];
}

#pragma mark - Private

- (NSArray <ItemInfoModel *> *)convertedRequestResultWithTuple:(RACTuple *)resultTuple
{
    NSMutableArray *newFeed = [NSMutableArray array];

    NSArray *combinedResult = [resultTuple.first arrayByAddingObjectsFromArray:resultTuple.second];
    [combinedResult enumerateObjectsUsingBlock:^(MWFeedItem *obj, NSUInteger idx, BOOL *stop) {
        [newFeed addObject:[[ItemInfoModel alloc] initWithFeedItem:obj]];
    }];

    return newFeed;
}

- (NSArray <ItemInfoModel *> *)sortedFeedItemsByDate:(NSArray <ItemInfoModel *> *)feedItems
{
    return [feedItems sortedArrayUsingComparator:^NSComparisonResult(MWFeedItem *obj1, MWFeedItem *obj2) {
        return [obj2.date compare:obj1.date];
    }];
}

@end
