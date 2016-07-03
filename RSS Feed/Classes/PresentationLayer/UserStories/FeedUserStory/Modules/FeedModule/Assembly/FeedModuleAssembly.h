//
//  FeedModuleFeedModuleAssembly.h
//  RSS-Feed
//
//  Created by Igor Vasilenko on 02/07/2016.
//  Copyright © 2016 Igor Vasilenko. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import "ModuleAssemblyBase.h"

@class FeedCellObjectsBuilderFactory;

/**
 @author Igor Vasilenko

 FeedModule module
 */
@interface FeedModuleAssembly : ModuleAssemblyBase

@property (nonatomic, strong) FeedCellObjectsBuilderFactory *feedCellObjectsBuilderFactory;

@end
