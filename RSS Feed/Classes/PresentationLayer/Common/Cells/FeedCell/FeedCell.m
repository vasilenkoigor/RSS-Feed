//
// Created by Igor Vasilenko on 03/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import "FeedCell.h"
#import "FeedCellObject.h"
#import "UIImageView+AFNetworking.h"

static NSInteger const FeedCellHeight = 52;

@interface FeedCell ()

@property (weak, nonatomic) IBOutlet UIImageView *feedImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation FeedCell

- (BOOL)shouldUpdateCellWithObject:(FeedCellObject *)object
{
    self.titleLabel.text = object.title;
    [self.feedImageView setImageWithURL:object.imageUrl];
    return YES;
}

- (CGFloat)heightForObject:(id)object atIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView
{
    return FeedCellHeight;
}

@end
