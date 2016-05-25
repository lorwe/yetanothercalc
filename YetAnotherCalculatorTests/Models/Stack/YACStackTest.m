//
//  YACStackTest.m
//  YetAnotherCalculator
//
//  Created by Farid on 25.05.16.
//  Copyright (c) 2016 Farid. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YACStack.h"

@interface YACStackTest : XCTestCase

@end

@implementation YACStackTest

- (void)testIfItPushesAndPeeksItem {
	YACStack *stack = [YACStack new];
	NSString *item = @"an item";

	[stack push:item];
	id pushedItem = [stack peek];

	XCTAssertEqual(item, pushedItem);
}

- (void)testIfItPopsItem {
	YACStack *stack = [YACStack new];
	NSString *item = @"an item";
	[stack push:item];

	id poppedItem = [stack pop];

	XCTAssertEqual(item, poppedItem);
}

- (void)testIfItPushesAndPopsItems {
	YACStack *stack = [YACStack new];
	NSArray *itemsToPush = @[@"item 1", @"item2", @"item 3"];
	NSMutableArray *poppedItems = [NSMutableArray array];

	for (id item in itemsToPush) {
		[stack push:item];
	}
	id item = [stack pop];
	while (item) {
		[poppedItems insertObject:item
						  atIndex:0];
		item = [stack pop];
	}

	XCTAssertEqualObjects(itemsToPush, poppedItems);
}

- (void)testIfReturnsCount {
	YACStack *stack = [YACStack new];
	[stack push:@"item1"];
	[stack push:@"item2"];

	NSUInteger count = stack.count;

	XCTAssertEqual(count, 2);
}

@end
