//
// Created by Farid on 25.05.16.
// Copyright (c) 2016 Farid. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface YACCalculator : NSObject

@property(nonatomic, readonly) NSString *expression;

- (instancetype)initWithOperationManager:(id)operationManager;

- (NSNumber *)evaluateExpression:(NSString *)expression;

@end