//
//  YACOperationOpeningBracketTest.m
//  YetAnotherCalculator
//
//  Created by Farid on 26.05.16.
//  Copyright (c) 2016 Farid. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YACOperationProtocol.h"
#import "YACOperationOpeningBracket.h"

@interface YACOperationOpeningBracketTest : XCTestCase

@end

@implementation YACOperationOpeningBracketTest

- (void)testIfItEvaluatesToNil {
	id <YACOperationProtocol> operation = [YACOperationOpeningBracket new];
	NSArray *arguments = @[];

	NSNumber *result = [operation evaluateWithArguments:arguments];

	XCTAssertNil(result);
}

- (void)testIfItReturnsPriority {
	id <YACOperationProtocol> operation = [YACOperationOpeningBracket new];

	NSInteger priority = operation.priority;

	XCTAssertEqual(priority, 0);
}

- (void)testIfItReturnsNumberOfArguments {
	id <YACOperationProtocol> operation = [YACOperationOpeningBracket new];

	NSInteger numberOfArguments = operation.numberOfArguments;

	XCTAssertEqual(numberOfArguments, 0);
}

@end
