//
//  FeedModuleFeedModuleViewController.h
//  RSS-Feed
//
//  Created by Igor Vasilenko on 02/07/2016.
//  Copyright © 2016 Igor Vasilenko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FeedModuleViewInput.h"

@protocol FeedModuleViewOutput;

@interface FeedModuleViewController : UITableViewController <FeedModuleViewInput>

@property (nonatomic, strong) id<FeedModuleViewOutput> output;

@end
