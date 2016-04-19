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
#import "Message_service.h"
#import "Password_change.h"
#import "AppDelegate.h"
#import "History_order.h"


@interface Personal ()

@end

@implementation Personal
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction) toorder{
    History_order *vc = [[History_order alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(IBAction) test1{
    First *vc = [[First alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(IBAction) wallet{
    Wallet *vc = [[Wallet alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(IBAction) message{
    Message_service *a=[[Message_service alloc]init];
    [a httpPostNoSyn:self];
}
-(IBAction) my_info{
    My_info *vc = [[My_info alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(IBAction)set{
    Password_change *vc=[[Password_change alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}



-(IBAction)showSheet{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"联系我们"
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:@"110"
                                  otherButtonTitles:nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [actionSheet showInView:self.view];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://110"]];

    }
}
- (void)actionSheetCancel:(UIActionSheet *)actionSheet{
    
}
-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    
}
-(void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex{
    
}

@end
