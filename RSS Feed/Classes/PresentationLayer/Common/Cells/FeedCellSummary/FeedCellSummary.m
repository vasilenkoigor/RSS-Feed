//
// Created by Igor Vasilenko on 03/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "FeedCellSummary.h"
#import "FeedCellSummaryObject.h"
#import "UIImageView+AFNetworking.h"

static NSInteger const FeedCellSummaryHeight = 150;

@interface FeedCellSummary ()

@property (weak, nonatomic) IBOutlet UIImageView *feedImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;


@end

@implementation FeedCellSummary

- (BOOL)shouldUpdateCellWithObject:(FeedCellSummaryObject *)object
{
    self.titleLabel.text = object.title;
    self.summaryLabel.text = object.summary;
    [self.feedImageView setImageWithURL:object.imageUrl];
    return YES;
}

+ (CGFloat)heightForObject:(id)object atIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView
{
    return FeedCellSummaryHeight;
}

@end
