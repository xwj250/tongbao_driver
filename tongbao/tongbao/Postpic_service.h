//
//  Postpic_service.h
//  tongbao
//
//  Created by 薛文进 on 16/4/17.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Postpic_service : NSObject
@property(nonatomic,retain) NSMutableData *receiveData;
@property(nonatomic,assign)int dataPackSerialNo;

@property (nonatomic, retain) UIViewController* help;

- (void)httpPostNoSyn:(NSString*)num second:(UIViewController*) control;


@end