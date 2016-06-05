//
//  Login.m
//  tongbao
//
//  Created by 薛文进 on 16/3/29.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import "Login.h"
#import "First.h"
#import "Login_service.h"

@interface Login ()

@end

@implementation Login
@synthesize name;
@synthesize pw;

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationController.navigationBarHidden = YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)login{
    Login_service *a=[[Login_service alloc]init];
    [a httpPostNoSyn:name.text second:pw.text third:1 forth:self];

}
-(void) enter{
   
}
-(void) login_again{
    name.clearButtonMode = UITextFieldViewModeWhileEditing;
    pw.clearButtonMode= UITextFieldViewModeWhileEditing;

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [name resignFirstResponder];
    [pw resignFirstResponder];
}

@end
