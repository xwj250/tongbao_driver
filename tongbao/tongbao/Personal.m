//
//  Personal.m
//  tongbao
//
//  Created by 薛文进 on 16/2/26.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import "Personal.h"
#import "First.h"
#import "Wallet.h"
#import "Message.h"
#import "My_info.h"


@interface Personal ()

@end

@implementation Personal

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
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

-(IBAction) test1{
    First *vc = [[First alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(IBAction) wallet{
    Wallet *vc = [[Wallet alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(IBAction) message{
    Message *vc = [[Message alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(IBAction) my_info{
    My_info *vc = [[My_info alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
