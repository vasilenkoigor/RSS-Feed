//
// Created by Igor Vasilenko on 02/07/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceComponents.h"

@class TyphoonAssembly;
@protocol NetworkClientsFactory;

@interface ServiceComponentsAssembly : TyphoonAssembly <ServiceComponents>

@property (strong, nonatomic) TyphoonAssembly <NetworkClientsFactory> *networkClientsFactory;

@end
