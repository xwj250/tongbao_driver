//
//  MyOrdersService.h
//  tongbao
//
//  Created by 夏明瑞 on 16/4/8.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyOrdersService : NSObject
@property(nonatomic,retain) NSMutableArray *array;
@property(nonatomic,assign) int type;

- (NSMutableArray*) showMyOrdersInType:(int)type;

@end
