//
// Created by Igor Vasilenko on 28/06/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <MWFeedParser/MWFeedParser.h>
#import "CommonNetworkClient.h"

@interface CommonNetworkClient () <MWFeedParserDelegate>

@property (strong, nonatomic, readwrite) MWFeedParser *parser;
@property (copy, nonatomic) NetworkClientCompletionBlock completionBlock;

@end

@implementation CommonNetworkClient

- (instancetype)initWithFeedParser:(MWFeedParser *)parser
{
    self = [super init];
    if (self) {
        self.parser = parser;
        self.parser.delegate = self;
    }
    return self;
}

- (void)sendRequestWithCompletionBlock:(NetworkClientCompletionBlock)completionBlock
{
    self.completionBlock = completionBlock;
    [self.parser parse];
}

#pragma mark - MWFeedParserDelegate

- (void)feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item
{
    if (self.completionBlock) {
        self.completionBlock(item, nil);
    }
}

- (void)feedParser:(MWFeedParser *)parser didFailWithError:(NSError *)error
{
    if (self.completionBlock) {
        self.completionBlock(nil, error);
    }
}

@end