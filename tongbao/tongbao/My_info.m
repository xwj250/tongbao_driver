//
//  My_info.m
//  tongbao
//
//  Created by 薛文进 on 16/2/29.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import "My_info.h"
#import "Personal.h"

@interface My_info ()

@end

@implementation My_info
@synthesize nicheng;
@synthesize phonenum;
@synthesize touxiang;

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationController.navigationBarHidden = YES;
    nicheng.text=@"12345";
    phonenum.text=@"54321";
    touxiang.image=[UIImage imageNamed:(@"test.png")];

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

-(IBAction) return{
    Personal *vc = [[Personal alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
