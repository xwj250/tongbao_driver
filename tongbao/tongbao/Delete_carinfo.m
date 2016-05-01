//
//  Delete_carinfo.m
//  tongbao
//
//  Created by 薛文进 on 16/4/10.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import "Delete_carinfo.h"
#import "Deletecar_service.h"
#import "Authentication.h"

@interface Delete_carinfo ()

@end

@implementation Delete_carinfo
@synthesize truck;

@synthesize truckNum=_truckNum;
@synthesize authState=_authState;
@synthesize typeName=_typeName;
@synthesize length=_length;
@synthesize capacity=_capacity;
@synthesize phoneNum=_phoneNum;
@synthesize realName=_realName;
@synthesize a=_a;
@synthesize b=_b;
@synthesize c=_c;
@synthesize d=_d;
@synthesize e=_e;
@synthesize f=_f;
@synthesize g=_g;
// truckNum":车牌号,"authState":审核状态(0未验证，1正在验证，2验证成功,3验证失败),"typeName":车型名称,"length":车长,"capacity":载重,"phoneNum":随车电话,"realName":车主姓名
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.truckNum.text=self.a;
    if([self.b isEqualToString:@"0"]){
      self.authState.text=@"未验证";
    }
    
    else if ([self.b isEqualToString:@"1"]){
        self.authState.text=@"正在验证";
    }
    else if ([self.b isEqualToString:@"2"]){
        self.authState.text=@"验证成功";
    }
    else if ([self.b isEqualToString:@"3"]){
        self.authState.text=@"验证失败";
    }
    
    self.typeName.text=self.c;
    self.length.text=self.d;
    self.capacity.text=self.e;
    self.phoneNum.text=self.f;
    self.realName.text=self.g;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)carinfo_return{
     [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)carinfo_delete{
    Deletecar_service *a=[[Deletecar_service alloc]init];
    [a httpPostNoSyn:truck second:self];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)authButton:(UIButton *)sender {
    Authentication *vc = [[Authentication alloc] init];
    if([self.b isEqualToString:@"0"]){
        vc.authState=@"未验证";
    }
    
    else if ([self.b isEqualToString:@"1"]){
        vc.authState=@"正在验证";
    }
    else if ([self.b isEqualToString:@"2"]){
        vc.authState=@"验证成功";
    }
    else if ([self.b isEqualToString:@"3"]){
        vc.authState=@"验证失败";
    }
    [self.navigationController pushViewController:vc animated:YES];
}

@end
