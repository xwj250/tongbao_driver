//
//  MyOrdersService.m
//  tongbao
//
//  Created by 夏明瑞 on 16/4/8.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import "MyOrdersService.h"
#import "AppDelegate.h"
#import "Mission.h"
#import "History_order.h"

@implementation MyOrdersService

- (NSMutableArray*) showMyOrdersInType:(int)type{
    
    _array = [[NSMutableArray alloc] initWithCapacity:0];
    AppDelegate *delegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    NSString *URLString = @"http://120.27.112.9:8080/tongbao/driver/auth/showMyOrderList";
    NSURL *URL = [NSURL URLWithString:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest *URLRequset = [[NSMutableURLRequest alloc] initWithURL:URL cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:60];
    
    NSString *param = [NSString stringWithFormat:@"token=%@&type=%d",delegate.token,type];
    NSData *postData = [param dataUsingEncoding:NSUTF8StringEncoding];
    [URLRequset setHTTPMethod:@"POST"];
    [URLRequset setHTTPBody:postData];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:URLRequset delegate:self];
    [connection start];
    NSData *receiveData = [NSURLConnection sendSynchronousRequest:URLRequset returningResponse:nil error:nil];
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:receiveData options:NSJSONReadingMutableLeaves error:nil];
    
    NSLog(@"result = %@",[dict objectForKey:@"result"]);
    
    if([[dict objectForKey:@"result"] intValue] == 1){
        @try{
            for(NSDictionary *s in [dict objectForKey:@"data"]){
                NSString *item = [NSString stringWithFormat:@"订单编号：%@;下单时间：%@;开始地点：%@;终止地点：%@;金额：%@;车型：%@;起点联系人姓名：%@;起点联系人号码：%@;终点联系人姓名：%@;终点联系人号码：%@;装车时间：%@",[s objectForKey:@"id"],[s objectForKey:@"time"],[s objectForKey:@"addressFrom"],[s objectForKey:@"addressTo"],[s objectForKey:@"money"],[s objectForKey:@"truckTypes"],[s objectForKey:@"fromContactName"],[s objectForKey:@"fromContactPhone"],[s objectForKey:@"toContactName"],[s objectForKey:@"toContactPhone"],[s objectForKey:@"loadTime"]];
                [_array addObject:item];
            }
            
            
        }@catch(NSException *e){
            _array = [[NSMutableArray alloc] initWithObjects:@"没有订单",nil];
        }
        
        
    }else if([[dict objectForKey:@"result"] intValue] == 0){
        NSLog(@"wrong");
        UIAlertView *myAlertView;
        myAlertView = [[UIAlertView alloc]initWithTitle:@"结果" message:@"服务器异常" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [myAlertView show];
    }
    
    return _array;
}

@end
