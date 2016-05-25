//
//  YACOperationDivisionTest.m
//  YetAnotherCalculator
//
//  Created by Farid on 25.05.16.
//  Copyright (c) 2016 Farid. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YACOperationProtocol.h"
#import "YACOperationDivision.h"

@interface YACOperationDivisionTest : XCTestCase

@end

@implementation YACOperationDivisionTest

- (void)testIfItAddsNumbers {
	id <YACOperationProtocol> operation = [YACOperationDivision new];
	NSArray *arguments = @[@9, @2];

	NSNumber *result = [operation evaluateWithArguments:arguments];

	XCTAssertEqualObjects(result, @4.5);
}

- (void)testIfItThrowsInvalidArgumentExceptionWithSingleArgument {
	id <YACOperationProtocol> operation = [YACOperationDivision new];
	NSArray *arguments = @[@8];

	XCTAssertThrowsSpecificNamed([operation evaluateWithArguments:arguments], NSException, NSInvalidArgumentException);
}

- (void)testIfItThrowsInvalidArgumentExceptionOnInvalidArgument {
	id <YACOperationProtocol> operation = [YACOperationDivision new];
	NSArray *arguments1 = @[@"foo", @2];
	NSArray *arguments2 = @[@2, @"foo"];

	XCTAssertThrowsSpecificNamed([operation evaluateWithArguments:arguments1], NSException, NSInvalidArgumentException);
	XCTAssertThrowsSpecificNamed([operation evaluateWithArguments:arguments2], NSException, NSInvalidArgumentException);
}

- (void)testIfItReturnsPriority {
	id <YACOperationProtocol> operation = [YACOperationDivision new];

	NSInteger priority = operation.priority;

	XCTAssertEqual(priority, 2);
}

- (void)testIfItReturnsNumberOfArguments {
	id <YACOperationProtocol> operation = [YACOperationDivision new];

	NSInteger numberOfArguments = operation.numberOfArguments;

	XCTAssertEqual(numberOfArguments, 2);
}
@end
