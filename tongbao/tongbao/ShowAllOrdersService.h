//
//  ShowAllOrdersService.h
//  tongbao
//
//  Created by 夏明瑞 on 16/4/13.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowAllOrdersService : NSObject
@property(nonatomic,retain) NSMutableData *receiveData;
@property(nonatomic,assign) int dataPackSerialNo;
@property(nonatomic,retain) UIViewController *myView;
@property(nonatomic,retain) NSString *fromAddress;
@property(nonatomic,retain) NSString *toAddress;
@property(nonatomic,retain) NSMutableArray *array;

- (NSArray*) showAllOrdersForView:(UIViewController*) view From:(NSString*) fromAddress To:(NSString*) toAddress;

@end
