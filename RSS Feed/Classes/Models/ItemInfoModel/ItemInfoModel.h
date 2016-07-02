//
// Created by Igor Vasilenko on 02/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MWFeedItem;

@interface ItemInfoModel : NSObject

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSDate *date;
@property (copy, nonatomic) NSString *summary;
@property (strong, nonatomic) NSURL *itemImageUrl;

- (instancetype)initWithFeedItem:(MWFeedItem *)feedItem;

@end
