//
// Created by Farid on 25.05.16.
// Copyright (c) 2016 Farid. All rights reserved.
//

#import "YACOperationDivision.h"


@implementation YACOperationDivision

- (NSInteger)priority {
	return 3;
}

- (NSInteger)numberOfArguments {
	return 2;
}

- (NSNumber *)evaluateWithArguments:(NSArray *)arguments {
	if (arguments.count < self.numberOfArguments) {
		@throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Not enough arguments" userInfo:nil];
	}

	id leftArgument = arguments[0];
	if (![leftArgument isKindOfClass:[NSNumber class]]) {
		@throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Invalid operand type" userInfo:nil];
	}

	id rightArgument = arguments[1];
	if (![rightArgument isKindOfClass:[NSNumber class]]) {
		@throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Invalid operand type" userInfo:nil];
	}

	return @(((NSNumber *) leftArgument).doubleValue / ((NSNumber *) rightArgument).doubleValue );
}

@end