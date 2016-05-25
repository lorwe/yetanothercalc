//
// Created by Farid on 25.05.16.
// Copyright (c) 2016 Farid. All rights reserved.
//

#import "YACCalculator.h"
#import "YACOperationManager.h"
#import "YACStack.h"
#import "YACCommons.h"
#import "YACOperationProtocol.h"

NSString *const YACInvalidExpressionSyntaxException = @"YACInvalidExpressionSyntaxException";

NSString *const kOpeningBracket = @"(";
NSString *const kClosingBracket = @")";


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

	NSCharacterSet *numericCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789."];
	NSCharacterSet *numbersAndBracketsCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789("];

	while (!scanner.atEnd) {

		NSString *token;

		if ([scanner scanCharactersFromSet:numericCharacterSet intoString:&token]) {
			[operands push:@([token doubleValue])];
			continue;
		}

		if ([scanner scanString:kOpeningBracket intoString:&token]) {
			[operations push:[_operationManager operationByToken:token]];
			continue;
		}

		if ([scanner scanString:kClosingBracket intoString:&token]) {
			id <YACOperationProtocol> recentOperation = [operations peek];
			while (recentOperation && recentOperation != [_operationManager operationByToken:kOpeningBracket]) {
				[operations pop];
				[self p_evaluateOperation:recentOperation withOperands:operands];
				recentOperation = [operations peek];
			}
			[operations pop];
			continue;
		}

		if ([scanner scanUpToCharactersFromSet:numbersAndBracketsCharacterSet intoString:&token]) {

			token = [token stringByTrimmingCharactersInSet:scanner.charactersToBeSkipped];

			id <YACOperationProtocol> nextOperation = [_operationManager operationByToken:token];
			id <YACOperationProtocol> recentOperation = [operations peek];

			while (recentOperation && recentOperation.priority >= nextOperation.priority) {
				[operations pop];
				[self p_evaluateOperation:recentOperation withOperands:operands];
				recentOperation = [operations peek];
			}

			[operations push:nextOperation];

			continue;
		}

		@throw [NSException exceptionWithName:YACInvalidExpressionSyntaxException reason:@"Syntax mismatch in expression" userInfo:nil];
	}

	while ([operations peek]) {
		[self p_evaluateOperation:[operations pop] withOperands:operands];
	}

	if (operands.count != 1) {
		@throw [NSException exceptionWithName:YACInvalidExpressionSyntaxException reason:@"Syntax mismatch in expression" userInfo:nil];
	}

	return [operands pop];
}

- (void)p_evaluateOperation:(id <YACOperationProtocol>)operation withOperands:(YACStack *)operands {
	NSMutableArray *arguments = [NSMutableArray array];
	for (NSInteger nOperands = 0; nOperands < operation.numberOfArguments; nOperands++) {
		[arguments insertObject:[operands pop] atIndex:0];
	}

	NSNumber *result = [operation evaluateWithArguments:arguments];
	if (result) {
		[operands push:result];
	}
}

@end