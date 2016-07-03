//
// Created by Igor Vasilenko on 03/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Nimbus/NimbusModels.h>
#import "FeedDataDisplayManager.h"
#import "FeedCellObject.h"
#import "FeedCellObjectsBuilder.h"
#import "FeedCellSummaryObject.h"

@interface FeedDataDisplayManager () <UITableViewDelegate>

@property (strong, nonatomic) NITableViewModel *tableViewModel;
@property (strong, nonatomic) NITableViewActions *tableViewActions;
@property (strong, nonatomic) NSArray *cellObjects;

@end

@implementation FeedDataDisplayManager

#pragma mark - Public

- (void)configureDataDisplayManagerWithFeed:(NSArray *)feed
{
    self.cellObjects = [self.feedCellObjectsBuilder cellObjectsForFeed:feed];
}

#pragma mark - DataDisplayManager protocol

- (id <UITableViewDataSource>)dataSourceForTableView:(UITableView *)tableView
{
    self.tableViewModel = [self configureTableViewModel];
    return self.tableViewModel;
}

- (id <UITableViewDelegate>)delegateForTableView:(UITableView *)tableView baseTableViewDelegate:(id <UITableViewDelegate>)baseTableViewDelegate
{
    if (!self.tableViewActions) {
        [self configureTableViewActions];
    }
    return [self.tableViewActions forwardingTo:self];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = [NICellFactory tableView:tableView heightForRowAtIndexPath:indexPath model:self.tableViewModel];
    return height;
}

#pragma mark - Private

- (void)configureTableViewActions
{
    self.tableViewActions = [[NITableViewActions alloc] initWithTarget:self];

    NIActionBlock feedItemActionBlock = ^BOOL(id object, UIViewController *controller, NSIndexPath *indexPath) {
        self.cellObjects = [self.feedCellObjectsBuilder cellObjectsWithReplacedObjectCellClass:object
                                                                               fromCellObjects:self.cellObjects];
        self.tableViewModel = [self configureTableViewModel];
        [self.delegate shouldReloadTableViewRowAtIndexPath:indexPath updatedDataSource:self.tableViewModel];
        return YES;
    };
    [self.tableViewActions attachToClass:[FeedCellObject class] tapBlock:feedItemActionBlock];
}

- (NITableViewModel *)configureTableViewModel
{
    NITableViewModel *tableViewModel = [[NITableViewModel alloc] initWithListArray:self.cellObjects
                                                                          delegate:(id)([NICellFactory class])];
    return tableViewModel;
}

@end
