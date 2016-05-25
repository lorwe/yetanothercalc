//
// Created by Farid on 25.05.16.
// Copyright (c) 2016 Farid. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const YACInvalidOperationException;


@protocol YACOperationProtocol;


@interface YACOperationManager : NSObject

- (void)addOperation:(id <YACOperationProtocol>)operation withToken:(NSString *)token;

- (id <YACOperationProtocol>)operationByToken:(NSString *)token;

@end