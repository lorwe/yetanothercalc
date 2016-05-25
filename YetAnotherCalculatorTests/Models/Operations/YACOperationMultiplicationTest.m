//
//  YACOperationMultiplicationTest.m
//  YetAnotherCalculator
//
//  Created by Farid on 25.05.16.
//  Copyright (c) 2016 Farid. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YACOperationProtocol.h"
#import "YACOperationMultiplication.h"

@interface YACOperationMultiplicationTest : XCTestCase

@end

@implementation YACOperationMultiplicationTest

- (void)testIfItAddsNumbers {
	id <YACOperationProtocol> operation = [YACOperationMultiplication new];
	NSArray *arguments = @[@8, @2];

	NSNumber *result = [operation evaluateWithArguments:arguments];

	XCTAssertEqualObjects(result, @16);
}

- (void)testIfItThrowsInvalidArgumentExceptionWithSingleArgument {
	id <YACOperationProtocol> operation = [YACOperationMultiplication new];
	NSArray *arguments = @[@8];

	XCTAssertThrowsSpecificNamed([operation evaluateWithArguments:arguments], NSException, NSInvalidArgumentException);
}

- (void)testIfItThrowsInvalidArgumentExceptionOnInvalidArgument {
	id <YACOperationProtocol> operation = [YACOperationMultiplication new];
	NSArray *arguments1 = @[@"foo", @2];
	NSArray *arguments2 = @[@2, @"foo"];

	XCTAssertThrowsSpecificNamed([operation evaluateWithArguments:arguments1], NSException, NSInvalidArgumentException);
	XCTAssertThrowsSpecificNamed([operation evaluateWithArguments:arguments2], NSException, NSInvalidArgumentException);
}

- (void)testIfItReturnsPriority {
	id <YACOperationProtocol> operation = [YACOperationMultiplication new];

	NSInteger priority = operation.priority;

	XCTAssertEqual(priority, 3);
}

- (void)testIfItReturnsNumberOfArguments {
	id <YACOperationProtocol> operation = [YACOperationMultiplication new];

	NSInteger numberOfArguments = operation.numberOfArguments;

	XCTAssertEqual(numberOfArguments, 2);
}


@end
