//
//  First.m
//  tongbao
//
//  Created by 薛文进 on 16/2/29.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import "First.h"
#import "Personal.h"
#import "Message_service.h"
#import "Mission.h"
#import "Vehicle_management.h"
#import "Get_order.h"
#import "Wallet.h"
#import "History_order.h"
#import "MyOrdersService.h"
#import "Authentication.h"

@interface First ()

@end

@implementation First

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    //self.navigationController.navigationBarHidden = YES;
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


-(IBAction) click1{
    Personal *vc = [[Personal alloc] init];
    [self.navigationController pushViewController:vc animated:YES];

}
-(IBAction) click2{
    Message_service *a=[[Message_service alloc]init];
    [a httpPostNoSyn:self];
    
}
-(IBAction) click3{
    //Mission *vc = [[Mission alloc] init];
    //[self.navigationController pushViewController:vc animated:YES];
    MyOrdersService *service = [[MyOrdersService alloc] init];
    [service showMyOrdersForView:self type:1];
    
}
-(IBAction) click4{
   Vehiclemanagement_service *a=[[Vehiclemanagement_service alloc]init];
    [a httpPostNoSyn:self];
    
}
-(IBAction) click5{
    Get_order *vc = [[Get_order alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(IBAction) click6{
    Wallet *vc = [[Wallet alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(IBAction) click7{
    //History_order *vc = [[History_order alloc] init];
    //[self.navigationController pushViewController:vc animated:YES];
    MyOrdersService *service = [[MyOrdersService alloc] init];
    [service showMyOrdersForView:self type:2];
    
}

- (IBAction)click8:(UIButton *)sender {
    Authentication *vc = [[Authentication alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
