//
//  CancelOrderService.h
//  tongbao
//
//  Created by 夏明瑞 on 16/4/29.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CancelOrderService : NSObject

@property(nonatomic,assign) int type;

-(int) cancelOrderWithId:(int) Id;
@end
