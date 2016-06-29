//
// Created by Igor Vasilenko on 28/06/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <MWFeedParser/MWFeedParser.h>
#import "NetworkClientsAssembly.h"
#import "NetworkClient.h"
#import "CommonNetworkClient.h"

@implementation NetworkClientsAssembly

- (id <NetworkClient>)networkClientWithURL:(NSURL *)baseURL
{
    return [TyphoonDefinition withClass:[CommonNetworkClient class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithFeedParser:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self feedParserWithURL:baseURL]];
        }];
    }];
}

- (MWFeedParser *)feedParserWithURL:(NSURL *)baseURL
{
    return [TyphoonDefinition withClass:[MWFeedParser class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithFeedURL:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:baseURL];
        }];
    }];
}

@end