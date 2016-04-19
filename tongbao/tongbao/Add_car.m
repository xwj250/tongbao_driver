//
//  Add_car.m
//  tongbao
//
//  Created by 薛文进 on 16/2/26.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import "Add_car.h"
#import "Addcar_service.h"

@interface Add_car ()

@end

@implementation Add_car
@synthesize name;
@synthesize type;
@synthesize phone;
@synthesize weight;
@synthesize length;
@synthesize carId;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)enter_add{
    Addcar_service *a=[[Addcar_service alloc]init];
    NSLog(@"%@",carId.text);
     NSLog(@"%@",phone.text);

    [a httpPostNoSyn:carId.text second:0 third:phone.text forth:self];
//type.text.integerValue
}
-(IBAction)rewrite{
    name.clearButtonMode = UITextFieldViewModeWhileEditing;
    type.clearButtonMode = UITextFieldViewModeWhileEditing;
    phone.clearButtonMode = UITextFieldViewModeWhileEditing;
    weight.clearButtonMode = UITextFieldViewModeWhileEditing;
    length.clearButtonMode = UITextFieldViewModeWhileEditing;
    carId.clearButtonMode = UITextFieldViewModeWhileEditing;

    
}
-(IBAction)addcar_return{
 [self.navigationController popViewControllerAnimated:YES];
    
}
@end
