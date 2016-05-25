//
// Created by Farid on 25.05.16.
// Copyright (c) 2016 Farid. All rights reserved.
//

#import "YACOperationManager.h"
#import "YACOperationProtocol.h"

NSString *const YACInvalidOperationException = @"YACInvalidOperationException";


@implementation YACOperationManager {
	NSMutableDictionary *_operations;
}

- (instancetype)init {
	self = [super init];
	if (self) {
		_operations = [NSMutableDictionary dictionary];
	}

	return self;
}

- (void)addOperation:(id <YACOperationProtocol>)operation withToken:(NSString *)token {
	_operations[token] = operation;
}

- (id <YACOperationProtocol>)operationByToken:(NSString *)token {
	if (!_operations[token]) {
		@throw [NSException exceptionWithName:YACInvalidOperationException
									   reason:[NSString stringWithFormat:@"Unsupported operation '%@'", token]
									 userInfo:nil];
	}
	return _operations[token];
}

@end