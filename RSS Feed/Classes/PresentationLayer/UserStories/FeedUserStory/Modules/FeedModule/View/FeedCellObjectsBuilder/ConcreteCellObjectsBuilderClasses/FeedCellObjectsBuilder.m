//
// Created by Igor Vasilenko on 03/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "FeedCellObjectsBuilder.h"
#import "ItemInfoModel.h"
#import "FeedCellObject.h"
#import "FeedCellSummaryObject.h"

@implementation FeedCellObjectsBuilder

- (NSArray *)cellObjectsForFeed:(NSArray *)feed
{
    NSMutableArray *mutableArray = [NSMutableArray array];

    for (ItemInfoModel *itemInfoModel in feed) {
        FeedCellObject *feedCellObject = [FeedCellObject objectWithTitle:itemInfoModel.title
                                                                 summary:itemInfoModel.summary
                                                                imageUrl:itemInfoModel.itemImageUrl];
        [mutableArray addObject:feedCellObject];
    }

    return mutableArray;
}

- (NSArray *)cellObjectsWithReplacedObjectCellClass:(id)object fromCellObjects:(NSArray *)cellObjects
{
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:cellObjects];

    if ([object isMemberOfClass:[FeedCellObject class]]) {
        FeedCellObject *feedCellObject = object;
        FeedCellSummaryObject *cellSummaryObject = [FeedCellSummaryObject objectWithTitle:feedCellObject.title
                                                                                  summary:feedCellObject.summary
                                                                                 imageUrl:feedCellObject.imageUrl];
        NSUInteger index = [mutableArray indexOfObject:object];
        mutableArray[index] = cellSummaryObject;
        return [mutableArray copy];
    } else {
        FeedCellSummaryObject *feedCellObject = object;
        FeedCellObject *cellSummaryObject = [FeedCellObject objectWithTitle:feedCellObject.title
                                                                    summary:feedCellObject.summary
                                                                   imageUrl:feedCellObject.imageUrl];
        NSUInteger index = [mutableArray indexOfObject:object];
        mutableArray[index] = cellSummaryObject;
        return [mutableArray copy];
    }
}

@end
