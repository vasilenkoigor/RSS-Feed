//
// Created by Igor Vasilenko on 03/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Nimbus/NimbusModels.h>
#import "FeedDataDisplayManager.h"

@interface FeedDataDisplayManager ()

@property (strong, nonatomic) NITableViewModel *tableViewModel;
@property (strong, nonatomic) NSArray *cellObjects;

@end

@implementation FeedDataDisplayManager

- (id <UITableViewDataSource>)dataSourceForTableView:(UITableView *)tableView
{
    if (!self.tableViewModel) {
        self.tableViewModel = [self configureTableViewModel];
    }
    return self.tableViewModel;
}

#pragma mark - Private

- (NITableViewModel *)configureTableViewModel
{
    NITableViewModel *tableViewModel = [[NITableViewModel alloc] initWithListArray:self.cellObjects
                                                                          delegate:(id)([NICellFactory class])];
    return tableViewModel;
}

@end
