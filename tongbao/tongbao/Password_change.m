//
//  Password_change.m
//  tongbao
//
//  Created by 薛文进 on 16/2/29.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import "Password_change.h"
#import "First.h"
#import "Passwordchange_service.h"
#import "Personal.h"

@interface Password_change ()

@end

@implementation Password_change

@synthesize old;
@synthesize now;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)testServer{
    Passwordchange_service *a=[[Passwordchange_service alloc]init];
    [a httpPostNoSyn:old second:now third:self];
}
-(IBAction)return_set{
     [self.navigationController popViewControllerAnimated:YES];
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
