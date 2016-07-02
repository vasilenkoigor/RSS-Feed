//
//  FeedModuleFeedModuleViewInput.h
//  RSS-Feed
//
//  Created by Igor Vasilenko on 02/07/2016.
//  Copyright © 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FeedModuleViewInput <NSObject>

/**
 @author Igor Vasilenko

 Метод настраивает начальный стейт view
 */
- (void)setupInitialState;

/**
 * @author Igor Vasilenko
 *
 * Метод показывающий алерт с title и message
 */
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;

@end
