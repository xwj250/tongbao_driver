//
//  History_order.m
//  tongbao
//
//  Created by 薛文进 on 16/3/1.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import "History_order.h"
#import "First.h"
#import "Personal.h"

@interface History_order ()

@end

@implementation History_order

- (IBAction)firstTouch:(UIBarButtonItem *)sender {
    First *first = [[First alloc] init];
    [self.navigationController pushViewController:first animated:YES];
}

- (IBAction)meTouch:(UIBarButtonItem *)sender {
    Personal *personal = [[Personal alloc] init];
    [self.navigationController pushViewController:personal animated:YES];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
