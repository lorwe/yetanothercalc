//
//  YACOperationClosingBracketTest.m
//  YetAnotherCalculator
//
//  Created by Farid on 26.05.16.
//  Copyright (c) 2016 Farid. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YACOperationProtocol.h"
#import "YACOperationClosingBracket.h"

@interface YACOperationClosingBracketTest : XCTestCase

@end

@implementation YACOperationClosingBracketTest

- (void)testIfItEvaluatesToNil {
	id <YACOperationProtocol> operation = [YACOperationClosingBracket new];
	NSArray *arguments = @[];

	NSNumber *result = [operation evaluateWithArguments:arguments];

	XCTAssertNil(result);
}

- (void)testIfItReturnsPriority {
	id <YACOperationProtocol> operation = [YACOperationClosingBracket new];

	NSInteger priority = operation.priority;

	XCTAssertEqual(priority, 1);
}

- (void)testIfItReturnsNumberOfArguments {
	id <YACOperationProtocol> operation = [YACOperationClosingBracket new];

	NSInteger numberOfArguments = operation.numberOfArguments;

	XCTAssertEqual(numberOfArguments, 0);
}

@end
