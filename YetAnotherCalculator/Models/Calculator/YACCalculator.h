//
// Created by Farid on 25.05.16.
// Copyright (c) 2016 Farid. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const YACInvalidExpressionSyntaxException;


@interface YACCalculator : NSObject

- (instancetype)initWithOperationManager:(id)operationManager;

- (NSNumber *)evaluateExpression:(NSString *)expression error:(NSError **)error;

@end