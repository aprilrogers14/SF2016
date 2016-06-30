//
//  ViewController.m
//  StitchFix
//
//  Created by Rogers, April on 6/29/16.
//  Copyright © 2016 Rogers, April. All rights reserved.
//

#import "StartCheckoutVC.h"
#import "StitchFixWebCalls.h"
#import "ItemFeedbackVC.h"

@interface StartCheckoutVC ()

@property NSArray *fixItems;

@end

@implementation StartCheckoutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [StitchFixWebCalls getCurrentFixWithSuccess:^(NSArray *items) {
        self.fixItems = items;
    } failure:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ItemFeedbackVC *vc = segue.destinationViewController;
    [vc setFixItems:self.fixItems];
}
@end
