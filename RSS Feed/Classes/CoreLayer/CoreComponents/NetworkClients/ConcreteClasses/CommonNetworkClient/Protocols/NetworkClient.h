//
// Created by Igor Vasilenko on 28/06/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MWFeedItem;

typedef void (^NetworkClientCompletionBlock)(MWFeedItem *item, NSError *error);

@protocol NetworkClient <NSObject>

- (void)sendRequestWithCompletionBlock:(NetworkClientCompletionBlock)completionBlock;

@end