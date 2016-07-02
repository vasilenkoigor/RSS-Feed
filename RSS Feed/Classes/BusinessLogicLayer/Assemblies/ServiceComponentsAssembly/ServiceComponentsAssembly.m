//
// Created by Igor Vasilenko on 02/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Typhoon/TyphoonDefinition.h>
#import <Typhoon/TyphoonDefinition+Config.h>
#import <Typhoon/TyphoonAssembly.h>
#import <Typhoon/TyphoonConfigPostProcessor.h>
#import "ServiceComponentsAssembly.h"
#import "NetworkClientsFactory.h"
#import "FeedServiceImpl.h"

static NSString *const kServiceComponentsConfigFilePath = @"ServiceComponentsURLs.plist";

@implementation ServiceComponentsAssembly

- (id <FeedService>)gazetaFeedService
{
    return [TyphoonDefinition withClass:[FeedServiceImpl class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithNetworkClient:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self.networkClientsFactory networkClientWithURL:TyphoonConfig(@"GazetaRssURL")]];
        }];
    }];
}

- (id <FeedService>)lentaFeedService
{
    return [TyphoonDefinition withClass:[FeedServiceImpl class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithNetworkClient:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self.networkClientsFactory networkClientWithURL:TyphoonConfig(@"LentaRssURL")]];
        }];
    }];
}

#pragma mark - Configuration

- (id)configurer
{
    return [TyphoonDefinition withConfigName:kServiceComponentsConfigFilePath];
}

@end
