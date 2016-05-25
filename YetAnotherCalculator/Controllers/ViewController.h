//
//  ViewController.h
//  YetAnotherCalculator
//
//  Created by Farid on 25.05.16.
//  Copyright © 2016 Farid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic, strong) IBOutlet UITextField *fldExpreassion;
@property(nonatomic, strong) IBOutlet UILabel *lblResult;

- (IBAction)didEvaluateButtonTouch:(id)sender;

@end

