//
//  My_info.m
//  tongbao
//
//  Created by 薛文进 on 16/2/29.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import "My_info.h"
#import "Personal.h"
#import "AppDelegate.h"

@interface My_info ()

@end

@implementation My_info
@synthesize nicheng;
@synthesize phonenum;
@synthesize touxiang;

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationController.navigationBarHidden = YES;
    AppDelegate *delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    nicheng.text=delegate.nickName;
    phonenum.text=delegate.phone;
    if(!delegate.iconUrl){
    touxiang.image=[UIImage imageNamed:(@"test.png")];
    }
    else{
        NSURL *url=[NSURL URLWithString:delegate.iconUrl];
        NSData *data=[NSData dataWithContentsOfURL:url];
        touxiang.image=[[UIImage alloc] initWithData:data];
    }

    // Do any additional setup after loading the view from its nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction) return{
    Personal *vc = [[Personal alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
