//
// Created by Farid on 26.05.16.
// Copyright (c) 2016 Farid. All rights reserved.
//

#import "YACMyCalculator.h"
#import "YACOperationManager.h"
#import "YACOperationAddition.h"
#import "YACOperationSubstraction.h"
#import "YACOperationMultiplication.h"
#import "YACOperationDivision.h"


@implementation YACMyCalculator

static YACOperationManager *_operationManager;

+ (void)initialize {
	[super initialize];

	_operationManager = [YACOperationManager new];
	[_operationManager addOperation:[YACOperationAddition new] withToken:@"+"];
	[_operationManager addOperation:[YACOperationSubstraction new] withToken:@"-"];
	[_operationManager addOperation:[YACOperationMultiplication new] withToken:@"*"];
	[_operationManager addOperation:[YACOperationDivision new] withToken:@"/"];

}

+ (YACCalculator *)instance {
	return [[YACCalculator alloc] initWithOperationManager:_operationManager];
}

@end