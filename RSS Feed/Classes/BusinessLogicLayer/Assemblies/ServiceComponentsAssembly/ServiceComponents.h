//
// Created by Igor Vasilenko on 02/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FeedService;

@protocol ServiceComponents <NSObject>

- (id <FeedService>)gazetaFeedService;
- (id <FeedService>)lentaFeedService;

@end
