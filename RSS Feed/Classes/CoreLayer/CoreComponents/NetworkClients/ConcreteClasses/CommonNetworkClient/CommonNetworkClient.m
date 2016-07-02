//
// Created by Igor Vasilenko on 28/06/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <MWFeedParser/MWFeedParser.h>
#import "CommonNetworkClient.h"

@interface CommonNetworkClient () <MWFeedParserDelegate>

@property (strong, nonatomic, readwrite) MWFeedParser *parser;
@property (copy, nonatomic) NetworkClientCompletionBlock completionBlock;
@property (strong, nonatomic) NSMutableArray *resultMutableArray;

@end

@implementation CommonNetworkClient

- (instancetype)initWithFeedParser:(MWFeedParser *)parser
{
    self = [super init];
    if (self) {
        self.parser = parser;
        self.parser.connectionType = ConnectionTypeAsynchronously;
        self.parser.feedParseType = ParseTypeFull;
        self.parser.delegate = self;
        self.resultMutableArray = [NSMutableArray array];
    }
    return self;
}

- (void)sendRequestWithCompletionBlock:(NetworkClientCompletionBlock)completionBlock
{
    self.completionBlock = completionBlock;
    [self.parser parse];
}

#pragma mark - MWFeedParserDelegate

- (void)feedParserDidStart:(MWFeedParser *)parser
{
    [self.resultMutableArray removeAllObjects];
}

- (void)feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item
{
    [self.resultMutableArray addObject:item];
}

- (void)feedParser:(MWFeedParser *)parser didFailWithError:(NSError *)error
{
    if (self.completionBlock) {
        self.completionBlock(nil, error);
    }
}

- (void)feedParserDidFinish:(MWFeedParser *)parser
{
    if (self.completionBlock) {
        self.completionBlock([self.resultMutableArray copy], nil);
    }
}

@end