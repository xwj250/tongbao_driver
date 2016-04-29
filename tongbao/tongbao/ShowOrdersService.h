//
//  ShowOrdersService.h
//  tongbao
//
//  Created by 夏明瑞 on 16/4/27.
//  Copyright © 2016年 薛文进. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface ShowOrdersService : NSObject
//@property(nonatomic,retain) NSMutableData *receiveData;
@property(nonatomic,retain) NSString *fromAddress;
@property(nonatomic,retain) NSString *toAddress;
@property(nonatomic,retain) NSMutableArray *array;

- (NSMutableArray*) showOrdersFrom:(NSString*) fromAddress To:(NSString*) toAddress;
@end
