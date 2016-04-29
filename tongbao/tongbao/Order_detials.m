//
//  Order_detials.m
//  tongbao
//
//  Created by 夏明瑞 on 16/3/1.
//  Copyright © 2016年 夏明瑞. All rights reserved.
//

#import "Order_detials.h"
#import "getOrderService.h"
#import "CancelOrderService.h"
#import "DeleteOrderService.h"

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
- (IBAction)bottomButton:(UIButton *)sender {
    int result;
    UIAlertView *myAlertView;

    if([sender.titleLabel.text isEqualToString:@"抢单"]){
        getOrderService *s = [[getOrderService alloc] init];
        result = [s getOrderWithId:[_Id intValue]];
        
    }else if([sender.titleLabel.text isEqualToString:@"取消"]){
        CancelOrderService *s = [[CancelOrderService alloc] init];
        result = [s cancelOrderWithId:[_Id intValue]];
        
        
    }else if([sender.titleLabel.text isEqualToString:@"删除"]){
        DeleteOrderService *s = [[DeleteOrderService alloc] init];
        result = [s deleteOrderWithId:[_Id intValue]];
        
    }
    switch (result) {
        case 0:
            myAlertView = [[UIAlertView alloc]initWithTitle:@"结果" message:[NSString stringWithFormat:@"%@失败",_buttonName] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [myAlertView show];
            break;
        case 1:
            myAlertView = [[UIAlertView alloc]initWithTitle:@"结果" message:[NSString stringWithFormat:@"%@成功",_buttonName] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [myAlertView show];
            break;
        default:
            break;
    }
}

- (IBAction)backButton:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
