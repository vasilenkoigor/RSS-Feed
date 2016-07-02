//
//  FeedModuleFeedModuleViewInput.h
//  RSS-Feed
//
//  Created by Igor Vasilenko on 02/07/2016.
//  Copyright © 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ItemInfoModel;

@protocol FeedModuleViewInput <NSObject>

/**
 @author Igor Vasilenko

 Метод настраивает начальный стейт view
 */
- (void)setupInitialState;

/**
 @author Igor Vasilenko

 Метод обновляет сейт view после успешной загрузки rss feed
 */
- (void)updateStateWithFeed:(NSArray <ItemInfoModel *> *)feed;

/**
 @author Igor Vasilenko

 Метод обновляет стейт view и показывает progress hud
 */
- (void)initiateStartRefreshingFeedState;

/**
 @author Igor Vasilenko

Метод обновляет стейт view и убирает progress hud
 */
- (void)stopRefreshingFeedState;

/**
 * @author Igor Vasilenko
 *
 * Метод показывающий алерт с title и message
 */
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;

@end
