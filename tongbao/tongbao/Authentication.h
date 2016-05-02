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

@property (strong, nonatomic) IBOutlet UITextField *manTruckNumTextField;
@property (strong, nonatomic) IBOutlet UITextField *manLicenseNumTextField;
@property (strong, nonatomic) IBOutlet UITextField *manNameTextField;

@property (weak, nonatomic) IBOutlet UILabel *carIsOkLabel;
@property (strong, nonatomic) IBOutlet UITextField *carTruckNumTextField;

@property (weak, nonatomic) IBOutlet UIButton *tijiaoButton;

@property (strong, nonatomic) NSString *authState;
@property (strong, nonatomic) NSString *currentUrl;
@property (nonatomic, assign) int currentPicNum;
@property (strong, nonatomic) NSString *driverHeadPicUrl;
@property (strong, nonatomic) NSString *driverLicensePicUrl;
@property (strong, nonatomic) NSString *carHeadPicUrl;
@property (strong, nonatomic) NSString *carLicensePicUrl;



@end
