//
//  UITableView+VASCellNibRegistration.h
//  RSSFeed-iOS
//
//  Created by Igor Vasilenko on 11/07/15.
//  Copyright (c) 2015 Igor Vasilenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (VASCellNibRegistration)

- (void)registerNIBForClass:(Class)cellClass;
- (id)dequeueCellOfClass:(Class)cellClass;

@end
