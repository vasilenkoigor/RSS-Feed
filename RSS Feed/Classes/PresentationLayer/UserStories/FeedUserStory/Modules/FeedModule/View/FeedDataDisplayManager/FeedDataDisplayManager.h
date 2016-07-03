//
// Created by Igor Vasilenko on 03/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataDisplayManager.h"

@class FeedCellObjectsBuilder;

@interface FeedDataDisplayManager : NSObject <DataDisplayManager>

@property (strong, nonatomic) FeedCellObjectsBuilder *feedCellObjectsBuilder;

- (void)configureDataDisplayManagerWithFeed:(NSArray *)feed;

@end
