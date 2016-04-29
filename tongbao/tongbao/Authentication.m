//
//  Authentication.m
//  tongbao
//
//  Created by 薛文进 on 16/2/29.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import "Authentication.h"

@interface Authentication ()

@end

@implementation Authentication

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)driverHeadButton:(UIButton *)sender {
    
}

- (IBAction)driverLicenseButton:(UIButton *)sender {
    
}

- (IBAction)carHeadButton:(UIButton *)sender {
    
}

- (IBAction)carLicenseButton:(UIButton *)sender {
    
}

- (IBAction)segmentedControlClicked:(UISegmentedControl *)sender {
    switch (_segmentedControl.selectedSegmentIndex) {
        case 0:
            [_carView setHidden:YES];
            [_manView setHidden:NO];
            break;
        case 1:
            [_carView setHidden:NO];
            [_manView setHidden:YES];
            break;
        default:
            break;
    }
}


- (IBAction)tijiaoButton:(UIButton *)sender {
    
}


- (IBAction)backButton:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
