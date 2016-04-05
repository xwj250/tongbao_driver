//
//  Password_change.h
//  tongbao
//
//  Created by 薛文进 on 16/2/29.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Password_change : UIViewController
@property (strong,nonatomic) IBOutlet UITextField* old;
@property (strong,nonatomic) IBOutlet UITextField* now;
-(IBAction)testServer;
-(IBAction)return_set;

@end
