//
//  FeedModuleFeedModuleModuleInput.h
//  RSS-Feed
//
//  Created by Igor Vasilenko on 02/07/2016.
//  Copyright © 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FeedModuleModuleInput

/**
 @author Igor Vasilenko

 Метод инициирует стартовую конфигурацию текущего модуля
 */
- (void)configureModule;

@end
