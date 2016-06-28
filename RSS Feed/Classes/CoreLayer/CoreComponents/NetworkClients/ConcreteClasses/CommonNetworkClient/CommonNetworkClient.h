//
// Created by Igor Vasilenko on 28/06/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MWFeedParser;

@interface CommonNetworkClient : NSObject

@property (strong, nonatomic, readonly) MWFeedParser *parser;

- (instancetype)initWithFeedParser:(MWFeedParser *)parser;

@end