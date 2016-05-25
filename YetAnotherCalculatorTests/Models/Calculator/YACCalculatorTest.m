//
//  YACCalculatorTest.m
//  YetAnotherCalculator
//
//  Created by Farid on 25.05.16.
//  Copyright (c) 2016 Farid. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YACCalculator.h"
#import "YACOperationManager.h"
#import "YACOperationAddition.h"
#import "YACOperationSubstraction.h"
#import "YACOperationMultiplication.h"
#import "YACOperationDivision.h"
#import "YACOperationOpeningBracket.h"
#import "YACOperationClosingBracket.h"

@interface YACCalculatorTest : XCTestCase

@end

@implementation YACCalculatorTest

YACOperationManager *_operationManager;

+ (void)setUp {
	[super setUp];

	_operationManager = [YACOperationManager new];
	[_operationManager addOperation:[YACOperationAddition new] withToken:@"+"];
	[_operationManager addOperation:[YACOperationSubstraction new] withToken:@"-"];
	[_operationManager addOperation:[YACOperationMultiplication new] withToken:@"*"];
	[_operationManager addOperation:[YACOperationDivision new] withToken:@"/"];
	[_operationManager addOperation:[YACOperationOpeningBracket new] withToken:@"("];
	[_operationManager addOperation:[YACOperationClosingBracket new] withToken:@")"];
}

- (void)testIfItEvaluatesSimpleExpression {
	YACCalculator *calculator = [[YACCalculator alloc] initWithOperationManager:_operationManager];
	NSString *expression = @"3+2+1";
	NSError *error;

	NSNumber *result = [calculator evaluateExpression:expression error:&error];

	XCTAssertNil(error);
	XCTAssertEqual(result.doubleValue, 3 + 2 + 1);
}

- (void)testIfItEvaluatesComplexExpression {
	YACCalculator *calculator = [[YACCalculator alloc] initWithOperationManager:_operationManager];
	NSString *expression = @"4 + 2 - 6 / 2 + 5 * 2 + 1";
	NSError *error;

	NSNumber *result = [calculator evaluateExpression:expression error:&error];

	XCTAssertNil(error);
	XCTAssertEqual(result.doubleValue, 4 + 2 - 6 / 2 + 5 * 2 + 1);
}

- (void)testIfItEvaluatesFloatingPointExpression {
	YACCalculator *calculator = [[YACCalculator alloc] initWithOperationManager:_operationManager];
	NSString *expression = @"3.5+2.1 / 2";
	NSError *error;

	NSNumber *result = [calculator evaluateExpression:expression error:&error];

	XCTAssertNil(error);
	XCTAssertEqual(result.doubleValue, 3.5 + 2.1 / 2);
}

- (void)testIfItEvaluatesSimpleExpressionWithBrackets {
	YACCalculator *calculator = [[YACCalculator alloc] initWithOperationManager:_operationManager];
	NSString *expression = @"5*(1+2)";
	NSError *error;

	NSNumber *result = [calculator evaluateExpression:expression error:&error];

	XCTAssertNil(error);
	XCTAssertEqual(result.doubleValue, 5 * (1 + 2));
}

- (void)testIfItEvaluatesExpressionWithBrackets {
	YACCalculator *calculator = [[YACCalculator alloc] initWithOperationManager:_operationManager];
	NSString *expression = @"3+(5+3*(4-2))*2";
	NSError *error;

	NSNumber *result = [calculator evaluateExpression:expression error:&error];

	XCTAssertNil(error);
	XCTAssertEqual(result.doubleValue, 3 + (5 + 3 * (4 - 2)) * 2);
}

+ (void)tearDown {
	[super tearDown];
	_operationManager = nil;
}

@end
