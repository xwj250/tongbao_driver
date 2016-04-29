//
//  OrderDetailService.h
//  tongbao
//
//  Created by 夏明瑞 on 16/4/27.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderDetailService : NSObject
@property(nonatomic,retain) NSMutableData *receiveData;
@property(nonatomic,assign)int dataPackSerialNo;
@property (nonatomic, retain) UIViewController* myView;
@property(nonatomic,assign) int type;
@property(nonatomic,assign) int id;

-(void) showDetailFromView:(UIViewController*) view ForID:(int) id InType:(int) type;
@end
