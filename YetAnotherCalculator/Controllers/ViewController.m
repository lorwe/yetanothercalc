//
//  ViewController.m
//  YetAnotherCalculator
//
//  Created by Farid on 25.05.16.
//  Copyright © 2016 Farid. All rights reserved.
//

#import "ViewController.h"
#import "YACCalculator.h"
#import "YACMyCalculator.h"


@implementation ViewController {
	YACCalculator *_calculator;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	_calculator = [YACMyCalculator instance];
}

- (IBAction)didEvaluateButtonTouch:(id)sender {
	NSError *error = nil;

	NSNumber *result = [_calculator evaluateExpression:self.fldExpreassion.text
												 error:&error];
	if (error) {
		[[[UIAlertView alloc] initWithTitle:@"Error"
									message:error.localizedDescription
								   delegate:nil
						  cancelButtonTitle:@"Ok"
						  otherButtonTitles:nil] show];

		self.lblResult.text = @"= ERROR";
	} else {
		self.lblResult.text = [NSString stringWithFormat:@"= %@", result];
	}
}

@end
