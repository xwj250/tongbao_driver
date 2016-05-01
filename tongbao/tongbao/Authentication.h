//
//  Authentication.h
//  tongbao
//
//  Created by 薛文进 on 16/2/29.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Authentication : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIView *manView;
@property (weak, nonatomic) IBOutlet UIView *carView;

@property (weak, nonatomic) IBOutlet UILabel *manIsOkLabel;
@property (weak, nonatomic) IBOutlet UITextField *manNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *manTruckNumTextField;
@property (weak, nonatomic) IBOutlet UITextField *manLicenseNumTextField;

@property (weak, nonatomic) IBOutlet UILabel *carIsOkLabel;
@property (weak, nonatomic) IBOutlet UITextField *carTruckNumTextField;

@property (weak, nonatomic) IBOutlet UIButton *tijiaoButton;

@property (strong, nonatomic) NSString *authState;

@end
