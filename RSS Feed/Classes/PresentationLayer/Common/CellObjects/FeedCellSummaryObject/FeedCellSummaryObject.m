//
// Created by Igor Vasilenko on 03/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "FeedCellSummaryObject.h"
#import "FeedCellSummary.h"

@implementation FeedCellSummaryObject

#pragma mark - NICellObject protocol implementation

- (Class)cellClass
{
    return [FeedCellSummary class];
}

- (UINib *)cellNib
{
    return [UINib nibWithNibName:NSStringFromClass([FeedCellSummary class]) bundle:[NSBundle mainBundle]];
}

@end
