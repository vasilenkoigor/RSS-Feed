//
// Created by Igor Vasilenko on 03/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol DataDisplayManager <NSObject>

/*
 * @author Igor Vasilenko
 *
 * Метод, отдающий указанной таблице data source
 */
- (id <UITableViewDataSource>)dataSourceForTableView:(UITableView *)tableView;

/*
 * @author Igor Vasilenko
 *
 * Метод, отдающий указанной таблице delegate
 */
- (id <UITableViewDelegate>)delegateForTableView:(UITableView *)tableView
                           baseTableViewDelegate:(id <UITableViewDelegate>)baseTableViewDelegate;

@end
