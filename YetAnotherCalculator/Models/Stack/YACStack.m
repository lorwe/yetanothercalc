//
// Created by Farid on 25.05.16.
// Copyright (c) 2016 Farid. All rights reserved.
//

#import "YACStack.h"


@implementation YACStack {
	NSMutableArray *_items;
}

- (instancetype)init {
	self = [super init];
	if (self) {
		_items = [NSMutableArray array];
	}

	return self;
}

- (void)push:(id)item {
	[_items addObject:item];
}

- (id)pop {
	id item = _items.lastObject;
	[_items removeLastObject];
	return item;
}

- (id)peek {
	return _items.lastObject;
}

- (NSUInteger)count {
	return _items.count;
}

@end