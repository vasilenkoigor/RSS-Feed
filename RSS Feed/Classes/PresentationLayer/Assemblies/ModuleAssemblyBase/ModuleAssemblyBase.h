//
// Created by Igor Vasilenko on 02/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Typhoon/TyphoonAssembly.h>

@protocol ServiceComponents;

@interface ModuleAssemblyBase : TyphoonAssembly

@property (strong, nonatomic, readonly) TyphoonAssembly <ServiceComponents> *serviceComponents;

@end
