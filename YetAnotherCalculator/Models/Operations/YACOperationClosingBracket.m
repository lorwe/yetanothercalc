//
// Created by Farid on 26.05.16.
// Copyright (c) 2016 Farid. All rights reserved.
//

#import "YACOperationClosingBracket.h"


@implementation YACOperationClosingBracket

- (NSInteger)priority {
	return 1;
}

- (NSInteger)numberOfArguments {
	return 0;
}

- (NSNumber *)evaluateWithArguments:(NSArray *)arguments {
	return nil;
}

@end