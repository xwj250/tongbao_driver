//
//  Delete_carinfo.m
//  tongbao
//
//  Created by 薛文进 on 16/4/10.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import "Delete_carinfo.h"
#import "Deletecar_service.h"

@interface Delete_carinfo ()

@end

@implementation Delete_carinfo
@synthesize truck;

@synthesize truckNum;
@synthesize authState;
@synthesize typeName;
@synthesize length;
@synthesize capacity;
@synthesize phoneNum;
@synthesize realName;
// truckNum":车牌号,"authState":审核状态(0未验证，1正在验证，2验证成功,3验证失败),"typeName":车型名称,"length":车长,"capacity":载重,"phoneNum":随车电话,"realName":车主姓名
- (void)viewDidLoad {
    self.navigationController.navigationBarHidden = YES;
    [super viewDidLoad];
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

@end
