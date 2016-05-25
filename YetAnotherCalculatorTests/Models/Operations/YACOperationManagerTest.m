//
//  YACOperationManagerTest.m
//  YetAnotherCalculator
//
//  Created by Farid on 25.05.16.
//  Copyright (c) 2016 Farid. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YACOperationManager.h"
#import "YACOperationAddition.h"

@interface YACOperationManagerTest : XCTestCase

@end


@interface MockOperation : NSObject <YACOperationProtocol>

@end


@implementation YACOperationManagerTest

- (void)testIfItAddsOperation {
	YACOperationManager *operationManager = [YACOperationManager new];
	id operation = [MockOperation new];
	NSString *token = @"+";

	XCTAssertNoThrow([operationManager addOperation:operation withToken:token]);
}

- (void)testIfItReturnsOperation {
	YACOperationAddition *operationAddition = [YACOperationAddition new];
	NSString *token = @"+";
	YACOperationManager *operationManager = [YACOperationManager new];
	[operationManager addOperation:operationAddition withToken:token];

	id result = [operationManager operationByToken:token];

	XCTAssertEqual(result, operationAddition);
}

- (void)testIfItThrowsUndefinedOperationException {
	NSString *token = @"@";
	YACOperationManager *operationManager = [YACOperationManager new];

	XCTAssertThrows([operationManager operationByToken:token]);
}

@end


@implementation MockOperation

- (NSInteger)priority {
	return 0;
}

- (NSInteger)numberOfArguments {
	return 0;
}

- (NSNumber *)evaluateWithArguments:(NSArray *)arguments {
	return nil;
}

@end