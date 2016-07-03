//
// Created by Igor Vasilenko on 03/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "FeedCellObjectsBuilder.h"
#import "ItemInfoModel.h"
#import "FeedCellObject.h"

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

@end
