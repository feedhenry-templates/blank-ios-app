//
//  ViewController.m
//  blank-ios-app
//
//  Created by Corinne Krych on 04/12/15.
//  Copyright © 2015 FeedHenry. All rights reserved.
//

#import "ViewController.h"
#import <FH/FH.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [FH initWithSuccess:^(FHResponse *response) {
    NSLog(@"initialized OK");
    self.statusLabel.text = @"FH init successful";
  } AndFailure:^(FHResponse *response) {
    NSLog(@"initialize fail, %@", response.rawResponseAsString);
    self.statusLabel.text = @"FH init in error";
  }];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
