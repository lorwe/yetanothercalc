//
//  YACOperationAdditionTest.m
//  YetAnotherCalculator
//
//  Created by Farid on 25.05.16.
//  Copyright (c) 2016 Farid. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YACOperationProtocol.h"

@interface YACOperationAdditionTest : XCTestCase

@end

@implementation YACOperationAdditionTest

- (void)testIfItAddsNumbers {
	id <YACOperationProtocol> operation;
	NSArray *arguments = @[@8, @2];

	NSNumber *result = [operation evaluateWithArguments:arguments];

	XCTAssertEqualObjects(result, @10);
}

@end
