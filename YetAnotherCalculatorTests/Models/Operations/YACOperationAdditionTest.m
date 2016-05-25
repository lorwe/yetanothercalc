//
//  YACOperationAdditionTest.m
//  YetAnotherCalculator
//
//  Created by Farid on 25.05.16.
//  Copyright (c) 2016 Farid. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YACOperationProtocol.h"
#import "YACOperationAddition.h"

@interface YACOperationAdditionTest : XCTestCase

@end

@implementation YACOperationAdditionTest

- (void)testIfItAddsNumbers {
	id <YACOperationProtocol> operation = [YACOperationAddition new];
	NSArray *arguments = @[@8, @2];

	NSNumber *result = [operation evaluateWithArguments:arguments];

	XCTAssertEqualObjects(result, @10);
}

- (void)testIfItThrowsInvalidArgumentExceptionWithSingleArgument {
	id <YACOperationProtocol> operation = [YACOperationAddition new];
	NSArray *arguments = @[@8];

	XCTAssertThrowsSpecificNamed([operation evaluateWithArguments:arguments], NSException, NSInvalidArgumentException);
}

- (void)testIfItThrowsInvalidArgumentExceptionOnInvalidArgument {
	id <YACOperationProtocol> operation = [YACOperationAddition new];
	NSArray *arguments1 = @[@"foo", @2];
	NSArray *arguments2 = @[@2, @"foo"];

	XCTAssertThrowsSpecificNamed([operation evaluateWithArguments:arguments1], NSException, NSInvalidArgumentException);
	XCTAssertThrowsSpecificNamed([operation evaluateWithArguments:arguments2], NSException, NSInvalidArgumentException);
}

@end
