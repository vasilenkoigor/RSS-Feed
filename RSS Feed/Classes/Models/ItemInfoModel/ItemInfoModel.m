//
// Created by Igor Vasilenko on 02/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <MWFeedParser/MWFeedItem.h>
#import "ItemInfoModel.h"

@implementation ItemInfoModel

- (instancetype)initWithFeedItem:(MWFeedItem *)feedItem
{
    self = [super init];
    if (self) {
        self.title = feedItem.title;
        self.date = feedItem.date;
        self.summary = feedItem.summary;

        NSString *urlString = [feedItem.enclosures firstObject];
        self.itemImageUrl = [[NSURL alloc] initWithString:urlString];
    }
    return self;
}

@end
