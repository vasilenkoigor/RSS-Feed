//
// Created by Igor Vasilenko on 03/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataDisplayManager.h"

@class FeedCellObjectsBuilder;

@protocol FeedDataDisplayManagerDelegate <NSObject>

- (void)shouldReloadTableViewRowAtIndexPath:(NSIndexPath *)indexPath
                          updatedDataSource:(id <UITableViewDataSource>)dataSource;

@end

@interface FeedDataDisplayManager : NSObject <DataDisplayManager>

@property (strong, nonatomic) FeedCellObjectsBuilder *feedCellObjectsBuilder;
@property (weak, nonatomic) id <FeedDataDisplayManagerDelegate> delegate;

- (void)configureDataDisplayManagerWithFeed:(NSArray *)feed;

@end
