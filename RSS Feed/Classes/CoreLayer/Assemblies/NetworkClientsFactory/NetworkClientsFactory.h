//
// Created by Igor Vasilenko on 28/06/16.
// Copyright (c) 2016 Igor Vasilenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetworkClient;

@protocol NetworkClientsFactory <NSObject>

- (id <NetworkClient>)networkClientWithURL:(NSURL *)baseURL;

@end