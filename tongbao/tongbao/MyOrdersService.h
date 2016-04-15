//
//  MyOrdersService.h
//  tongbao
//
//  Created by 夏明瑞 on 16/4/8.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyOrdersService : NSObject
@property(nonatomic,retain) NSMutableData *receiveData;
@property(nonatomic,assign) int dataPackSerialNo;
@property(nonatomic,retain) UIViewController *myView;
@property(nonatomic,assign) int type;

- (void) showMyOrdersForView:(UIViewController*) view type:(int)type;

@end
