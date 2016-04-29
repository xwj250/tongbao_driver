//
//  Order_detials.m
//  tongbao
//
//  Created by 夏明瑞 on 16/3/1.
//  Copyright © 2016年 夏明瑞. All rights reserved.
//

#import "Order_detials.h"

@interface Order_detials ()

@end

@implementation Order_detials

- (void)viewDidLoad {
    [super viewDidLoad];
    self.idLabel.text = _Id;
    self.toLabel.text = _to;
    self.fromLabel.text = _from;
    self.startTimeLabel.text = _startTime;
    self.endTimeLabel.text = _endTime;
    self.typeLabel.text = _type;
    self.detailLabel.text = _detail;
    [self.bottomButton setTitle:_buttonName forState:UIControlStateNormal];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButton:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
