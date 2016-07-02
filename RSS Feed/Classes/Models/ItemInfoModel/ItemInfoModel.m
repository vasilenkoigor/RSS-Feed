//
// Created by Igor Vasilenko on 02/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <MWFeedParser/MWFeedItem.h>
#import <OCMock/OCMArg.h>
#import "ItemInfoModel.h"

@implementation ItemInfoModel

- (instancetype)initWithFeedItem:(MWFeedItem *)feedItem
{
    self = [super init];
    if (self) {
        self.title = feedItem.title;
        self.date = feedItem.date;
        self.summary = feedItem.summary;

        if (feedItem.enclosures.count) {
            id enclosure = [feedItem.enclosures firstObject];
            if ([enclosure isKindOfClass:[NSDictionary class]]) {
                NSDictionary *enclosureDictionary = enclosure;
                NSString *urlString = enclosureDictionary[@"url"];
                self.itemImageUrl = [[NSURL alloc] initWithString:urlString];
            }
        }
    }
    return self;
}

@end
