//
//  Personal.h
//  tongbao
//
//  Created by 薛文进 on 16/2/26.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Personal : UIViewController<UIActionSheetDelegate>
@property (strong,nonatomic) IBOutlet UILabel *nicheng;
@property (strong,nonatomic) IBOutlet UILabel *phonenum;
@property (strong,nonatomic) IBOutlet UIImageView *touxiang;

-(IBAction)   test1;
-(IBAction)   wallet;
-(IBAction)   message;
-(IBAction)   my_info;
-(IBAction) showSheet;
-(IBAction) set;
-(IBAction)toorder;
@end
