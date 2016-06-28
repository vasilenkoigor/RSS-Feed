//
//  UITableView+VASCellNibRegistration.m
//  RSSFeed-iOS
//
//  Created by Igor Vasilenko on 11/07/15.
//  Copyright (c) 2015 Igor Vasilenko. All rights reserved.
//

#import "UITableView+VASCellNibRegistration.h"

@implementation UITableView (VASCellNibRegistration)

- (void)registerNIBForClass:(Class)cellClass
{
    NSString *className = NSStringFromClass(cellClass);
    UINib *cellNIB = [UINib nibWithNibName:className bundle:[NSBundle mainBundle]];
    [self registerNib:cellNIB forCellReuseIdentifier:className];
}

- (id)dequeueCellOfClass:(Class)cellClass
{
    return [self dequeueReusableCellWithIdentifier:NSStringFromClass(cellClass)];
}

@end
