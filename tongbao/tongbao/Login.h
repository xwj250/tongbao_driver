//
//  Login.h
//  tongbao
//
//  Created by 薛文进 on 16/3/29.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Login : UIViewController
@property (strong,nonatomic) IBOutlet UITextField* name;
@property (strong,nonatomic) IBOutlet UITextField* pw;


-(IBAction) login;

-(void) enter;
-(void) login_again;
@end
