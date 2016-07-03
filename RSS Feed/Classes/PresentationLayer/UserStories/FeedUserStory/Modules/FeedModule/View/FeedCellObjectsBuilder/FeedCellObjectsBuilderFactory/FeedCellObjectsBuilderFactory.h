//
// Created by Igor Vasilenko on 03/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAssembly.h"

@class FeedCellObjectsBuilder;

@interface FeedCellObjectsBuilderFactory : TyphoonAssembly

- (FeedCellObjectsBuilder *)feedCellObjectsBuilder;

@end
