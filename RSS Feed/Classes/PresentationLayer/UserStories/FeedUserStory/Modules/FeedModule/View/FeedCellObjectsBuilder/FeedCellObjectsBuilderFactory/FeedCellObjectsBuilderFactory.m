//
// Created by Igor Vasilenko on 03/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "FeedCellObjectsBuilderFactory.h"
#import "FeedCellObjectsBuilder.h"

@implementation FeedCellObjectsBuilderFactory

- (FeedCellObjectsBuilder *)feedCellObjectsBuilder
{
    return [TyphoonDefinition withClass:[FeedCellObjectsBuilder class]];
}

@end
