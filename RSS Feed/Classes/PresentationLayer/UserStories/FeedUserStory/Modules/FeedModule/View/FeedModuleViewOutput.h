//
//  FeedModuleFeedModuleViewOutput.h
//  RSS-Feed
//
//  Created by Igor Vasilenko on 02/07/2016.
//  Copyright © 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FeedModuleViewOutput <NSObject>

/**
 @author Igor Vasilenko

 Метод сообщает презентеру о том, что view готова к работе
 */
- (void)didTriggerViewReadyEvent;

/**
 * @author Igor Vasilenko
 *
 * Метод сообщает презентеру о том, что был инициирован pull to refresh
 */
- (void)didTriggerPullToRefreshEvent;

@end
