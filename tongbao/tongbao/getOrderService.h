//
//  getOrderService.h
//  tongbao
//
//  Created by 夏明瑞 on 16/4/29.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface getOrderService : NSObject

@property(nonatomic,assign) int type;

-(int) getOrderWithId:(int) Id;

@end