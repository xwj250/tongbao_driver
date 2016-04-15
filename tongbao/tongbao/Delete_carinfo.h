//
//  Delete_carinfo.h
//  tongbao
//
//  Created by 薛文进 on 16/4/10.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Delete_carinfo : UIViewController

@property (nonatomic, retain) NSString *truck;

@property (strong,nonatomic) IBOutlet UILabel *truckNum;
@property (strong,nonatomic) IBOutlet UILabel *authState;
@property (strong,nonatomic) IBOutlet UILabel *typeName;
@property (strong,nonatomic) IBOutlet UILabel *length;
@property (strong,nonatomic) IBOutlet UILabel *capacity;
@property (strong,nonatomic) IBOutlet UILabel *phoneNum;
@property (strong,nonatomic) IBOutlet UILabel *realName;
// truckNum":车牌号,"authState":审核状态(0未验证，1正在验证，2验证成功,3验证失败),"typeName":车型名称,"length":车长,"capacity":载重,"phoneNum":随车电话,"realName":车主姓名
-(IBAction)carinfo_return;
-(IBAction)carinfo_delete;
@end
