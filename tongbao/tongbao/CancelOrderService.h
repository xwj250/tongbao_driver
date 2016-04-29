//
//  CancelOrderService.h
//  tongbao
//
//  Created by 夏明瑞 on 16/4/29.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CancelOrderService : NSObject
@property(nonatomic,retain) NSMutableData *receiveData;
@property(nonatomic,assign)int dataPackSerialNo;
@property(nonatomic,assign) int type;

-(void) cancelOrderWithId:(int) Id;
@end
