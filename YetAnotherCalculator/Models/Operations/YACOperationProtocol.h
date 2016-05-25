//
// Created by Farid on 25.05.16.
// Copyright (c) 2016 Farid. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YACOperationProtocol <NSObject>

- (NSInteger)priority;

- (NSInteger)numberOfArguments;

- (NSNumber *)evaluateWithArguments:(NSArray *)arguments;

@end