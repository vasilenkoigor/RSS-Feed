//
// Created by Igor Vasilenko on 03/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "FeedCellObject.h"

@implementation FeedCellObject

- (instancetype)initWithTitle:(NSString *)title
                      summary:(NSString *)summary
                        image:(UIImage *)image
{
    self = [super init];
    if (self) {
        _title = title;
        _summary = summary;
        _image = image;
    }
    return self;
}

+ (instancetype)objectWithøTitle:(NSString *)title
                         summary:(NSString *)summary
                           image:(UIImage *)image
{
    return [[self alloc] initWithTitle:title
                               summary:summary
                                 image:image];
}

@end
