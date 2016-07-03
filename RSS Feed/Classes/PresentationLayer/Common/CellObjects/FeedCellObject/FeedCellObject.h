//
// Created by Igor Vasilenko on 03/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Nimbus/NICellFactory.h>

@interface FeedCellObject : NSObject <NICellObject>

@property (copy, nonatomic, readonly) NSString *title;
@property (copy, nonatomic, readonly) NSString *summary;
@property (strong, nonatomic, readonly) UIImage *image;

+ (instancetype)objectWithøTitle:(NSString *)title
                        summary:(NSString *)summary
                          image:(UIImage *)image;

@end
