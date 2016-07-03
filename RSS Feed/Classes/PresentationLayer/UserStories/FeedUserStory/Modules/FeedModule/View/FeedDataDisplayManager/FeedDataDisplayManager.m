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
    return [[NITableViewModel alloc] init];
}

@end
