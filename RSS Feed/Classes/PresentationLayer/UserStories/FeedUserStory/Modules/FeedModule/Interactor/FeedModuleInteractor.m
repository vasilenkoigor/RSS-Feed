//
//  FeedModuleFeedModuleInteractor.m
//  RSS-Feed
//
//  Created by Igor Vasilenko on 02/07/2016.
//  Copyright © 2016 Igor Vasilenko. All rights reserved.
//

#import <ReactiveCocoa/RACSignal+Operations.h>
#import <MWFeedParser/MWFeedItem.h>
#import "FeedModuleInteractor.h"

#import "FeedModuleInteractorOutput.h"
#import "FeedService.h"
#import "ItemInfoModel.h"

@interface FeedModuleInteractor ()

@property (nonatomic, strong, readwrite) id <FeedService> gazetaFeedService;
@property (nonatomic, strong, readwrite) id <FeedService> lentaFeedService;

@end

@implementation FeedModuleInteractor

#pragma mark - Методы FeedModuleInteractorInput

- (void)loadRssFeedFromAllServicesList
{
    RACSignal *gazetaRssFeedSignal = [self.gazetaFeedService rac_requestRssFeed];
    RACSignal *lentaRssFeedSignal = [self.lentaFeedService rac_requestRssFeed];

    [[[RACSignal combineLatest:@[gazetaRssFeedSignal, lentaRssFeedSignal]
                        reduce:^id(NSArray <MWFeedItem *> *gazetaFeed, NSArray <MWFeedItem *> *lentaFeed) {
                            /// Converting to ItemInfoModel
                            NSMutableArray *newFeed = [NSMutableArray array];
                            NSArray *combinedResult = [gazetaFeed arrayByAddingObjectsFromArray:lentaFeed];
                            [combinedResult enumerateObjectsUsingBlock:^(MWFeedItem *obj, NSUInteger idx, BOOL *stop) {
                                [newFeed addObject:[[ItemInfoModel alloc] initWithFeedItem:obj]];
                            }];
                            return newFeed;
                        }] map:^id(NSArray <MWFeedItem *> *feed) {
        /// Map by date
        return [feed sortedArrayUsingComparator:^NSComparisonResult(MWFeedItem *obj1, MWFeedItem *obj2) {
            return [obj1.date compare:obj2.date];
        }];
    }] subscribeNext:^(NSArray <ItemInfoModel *> *result) {
        // Success
        [self.output didLoadRssFeed:result error:nil];
    } error:^(NSError *error) {
        // Error
        [self.output didLoadRssFeed:nil error:error];
    }];
}

@end
