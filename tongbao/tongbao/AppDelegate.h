//
//  AppDelegate.h
//  tongbao
//
//  Created by 薛文进 on 16/2/26.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) NSString *nickName;
@property (nonatomic, retain) NSString *iconUrl;
@property (nonatomic, retain) NSString *token;
@property (nonatomic, retain) NSString *phone;
//"nickName":"夏明","iconUrl":"abc.com","point":23(积分),"money":34(账户余额),"token":用户识别的token,"id":1(用户id)
@end

