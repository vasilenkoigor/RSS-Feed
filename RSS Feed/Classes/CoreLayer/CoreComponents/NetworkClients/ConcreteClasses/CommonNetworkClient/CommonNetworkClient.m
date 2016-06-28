//
// Created by Igor Vasilenko on 28/06/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <MWFeedParser/MWFeedParser.h>
#import "CommonNetworkClient.h"

@interface CommonNetworkClient ()

@property (strong, nonatomic, readwrite) MWFeedParser *parser;

@end

@implementation CommonNetworkClient

- (instancetype)initWithFeedParser:(MWFeedParser *)parser
{
    self = [super init];
    if (self) {
        self.parser = parser;
    }
    return self;
}

- (void)sendRequestWithCompletionBlock:(NetworkClientCompletionBlock)completionBlock
{

}

@end