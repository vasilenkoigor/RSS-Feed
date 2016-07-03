//
// Created by Igor Vasilenko on 03/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Nimbus/NimbusModels.h>
#import "FeedDataDisplayManager.h"

@interface FeedDataDisplayManager () <UITableViewDelegate>

@property (strong, nonatomic) NITableViewModel *tableViewModel;
@property (strong, nonatomic) NSArray *cellObjects;

@end

@implementation FeedDataDisplayManager

#pragma mark - DataDisplayManager protocol

- (id <UITableViewDataSource>)dataSourceForTableView:(UITableView *)tableView
{
    if (!self.tableViewModel) {
        self.tableViewModel = [self configureTableViewModel];
    }
    return self.tableViewModel;
}

- (id <UITableViewDelegate>)delegateForTableView:(UITableView *)tableView baseTableViewDelegate:(id <UITableViewDelegate>)baseTableViewDelegate
{
    NITableViewActions *tableViewActions = [[NITableViewActions alloc] initWithTarget:self];
    return [tableViewActions forwardingTo:self];
}

#pragma mark - Private

- (NITableViewModel *)configureTableViewModel
{
    NITableViewModel *tableViewModel = [[NITableViewModel alloc] initWithListArray:self.cellObjects
                                                                          delegate:(id)([NICellFactory class])];
    return tableViewModel;
}

@end
