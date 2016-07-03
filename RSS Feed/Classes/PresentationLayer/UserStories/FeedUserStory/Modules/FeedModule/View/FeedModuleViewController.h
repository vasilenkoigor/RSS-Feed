//
//  FeedModuleFeedModuleViewController.h
//  RSS-Feed
//
//  Created by Igor Vasilenko on 02/07/2016.
//  Copyright © 2016 Igor Vasilenko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FeedModuleViewInput.h"
#import "FeedDataDisplayManager.h"

@protocol FeedModuleViewOutput;
@class FeedDataDisplayManager;

@interface FeedModuleViewController : UIViewController <FeedModuleViewInput, FeedDataDisplayManagerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

@property (nonatomic, strong) id<FeedModuleViewOutput> output;

@property (nonatomic, strong) FeedDataDisplayManager *feedDataDisplayManager;

@end
