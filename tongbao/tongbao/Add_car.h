//
//  Add_car.h
//  tongbao
//
//  Created by 薛文进 on 16/2/26.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Add_car : UIViewController
@property (strong,nonatomic) IBOutlet UITextField* name;
@property (strong,nonatomic) IBOutlet UITextField* type;
@property (strong,nonatomic) IBOutlet UITextField* carId;
@property (strong,nonatomic) IBOutlet UITextField* weight;
@property (strong,nonatomic) IBOutlet UITextField* length;
@property (strong,nonatomic) IBOutlet UITextField* phone;
-(IBAction) enter_add;
-(IBAction)rewrite;
-(IBAction)addcar_return;
@end
