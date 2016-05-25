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
}

- (void)testIfItEvalutesSimpleExpression {
	YACCalculator *calculator = [[YACCalculator alloc] initWithOperationManager:_operationManager];
	NSString *expression = @"4 + 2 - 6 / 2 + 5 * 2";

	NSNumber *result = [calculator evaluateExpression:expression];

	XCTAssertEqual(result.doubleValue, 4 + 2 - 6 / 2 + 5 * 2);
}

+ (void)tearDown {
	[super tearDown];
	_operationManager = nil;
}

@end
