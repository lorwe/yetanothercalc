//
// Created by Farid on 25.05.16.
// Copyright (c) 2016 Farid. All rights reserved.
//

#import "YACOperationAddition.h"


@implementation YACOperationAddition

- (NSInteger)priority {
	return 2;
}

- (NSInteger)numberOfArguments {
	return 2;
}

- (NSNumber *)evaluateWithArguments:(NSArray *)arguments {
	id leftArgument = arguments[0];
	id rightArgument = arguments[1];
	return @(((NSNumber *) leftArgument).doubleValue + ((NSNumber *) rightArgument).doubleValue );
}

@end