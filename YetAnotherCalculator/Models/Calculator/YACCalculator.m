//
// Created by Farid on 25.05.16.
// Copyright (c) 2016 Farid. All rights reserved.
//

#import "YACCalculator.h"
#import "YACOperationManager.h"
#import "YACStack.h"
#import "YACCommons.h"
#import "YACOperationProtocol.h"


@implementation YACCalculator {
	YACOperationManager *_operationManager;
}

- (instancetype)initWithOperationManager:(id)operationManager {
	self = [super init];
	if (self) {
		_operationManager = operationManager;
	}

	return self;
}

- (NSNumber *)evaluateExpression:(NSString *)expression error:(NSError **)error {
	*error = nil;
	NSNumber *result;

	@try {
		result = [self p_evaluateExpression:expression];
	}
	@catch (NSException *e) {
		*error = [NSError errorWithDomain:YACErrorDomain code:0 userInfo:@{NSLocalizedDescriptionKey : @"Invalid expression"}];
		return nil;
	}

	return result;
}

- (NSNumber *)p_evaluateExpression:(NSString *)expression {

	NSScanner *scanner = [NSScanner scannerWithString:expression];
	scanner.charactersToBeSkipped = [NSCharacterSet whitespaceAndNewlineCharacterSet];

	YACStack *operands = [YACStack new];
	YACStack *operations = [YACStack new];

	while (!scanner.atEnd) {

		double nextOperand;
		if ([scanner scanDouble:&nextOperand]) {
			[operands push:@(nextOperand)];
			continue;
		}

		NSString *token;
		if ([scanner scanUpToCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:&token]) {

			token = [token stringByTrimmingCharactersInSet:scanner.charactersToBeSkipped];

			id <YACOperationProtocol> nextOperation = [_operationManager operationByToken:token];
			id <YACOperationProtocol> recentOperation = [operations peek];

			while (recentOperation && recentOperation.priority >= nextOperation.priority) {
				[operations pop];
				[self p_evaluateOperation:recentOperation withOperands:operands];
				recentOperation = [operations peek];
			}

			[operations push:nextOperation];
		}
	}

	while ([operations peek]) {
		[self p_evaluateOperation:[operations pop] withOperands:operands];
	}

	return [operands pop];
}

- (void)p_evaluateOperation:(id <YACOperationProtocol>)operation withOperands:(YACStack *)operands {
	NSMutableArray *arguments = [NSMutableArray array];
	for (NSInteger nOperands = 0; nOperands < operation.numberOfArguments; nOperands++) {
		[arguments insertObject:operands.pop atIndex:0];
	}

	NSNumber *result = [operation evaluateWithArguments:arguments];
	[operands push:result];
}

@end