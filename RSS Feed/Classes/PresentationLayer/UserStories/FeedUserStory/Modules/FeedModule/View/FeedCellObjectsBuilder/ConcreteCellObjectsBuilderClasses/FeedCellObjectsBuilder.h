//
// Created by Igor Vasilenko on 03/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedCellObjectsBuilder : NSObject

- (NSArray *)cellObjectsForFeed:(NSArray *)feed;

- (NSArray *)cellObjectsWithReplacedObjectCellClass:(id)object fromCellObjects:(NSArray *)cellObjects;

@end
