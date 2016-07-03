//
// Created by Igor Vasilenko on 03/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "FeedCellObject.h"
#import "FeedCell.h"

@implementation FeedCellObject

- (instancetype)initWithTitle:(NSString *)title
                      summary:(NSString *)summary
                     imageUrl:(NSURL *)imageUrl
{
    self = [super init];
    if (self) {
        _title = title;
        _summary = summary;
        _imageUrl = imageUrl;
    }
    return self;
}

+ (instancetype)objectWithTitle:(NSString *)title
                        summary:(NSString *)summary
                       imageUrl:(NSURL *)imageUrl
{
    return [[self alloc] initWithTitle:title
                               summary:summary
                              imageUrl:imageUrl];
}

#pragma mark - NICellObject protocol implementation

- (Class)cellClass
{
    return [FeedCell class];
}

- (UINib *)cellNib
{
    return [UINib nibWithNibName:NSStringFromClass([FeedCell class]) bundle:[NSBundle mainBundle]];
}

@end
