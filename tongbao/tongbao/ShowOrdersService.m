//
//  ShowOrdersService.m
//  tongbao
//
//  Created by 夏明瑞 on 16/4/27.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import "ShowOrdersService.h"
#import "AppDelegate.h"

@implementation ShowOrdersService

- (NSMutableArray*) showOrdersFrom:(NSString*) fromAddress To:(NSString*) toAddress{
    _fromAddress = fromAddress;
    _toAddress = toAddress;
    _array = [[NSMutableArray alloc] initWithCapacity:0];
    
    AppDelegate *delegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    NSString *URLString = @"http://120.27.112.9:8080/tongbao/driver/auth/showAllOrders";
    NSURL *URL = [NSURL URLWithString:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest *URLRequset = [[NSMutableURLRequest alloc] initWithURL:URL cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:10];
    [URLRequset setHTTPMethod:@"POST"];
    NSString *param = [NSString stringWithFormat:@"token=%@&fromAddress=%@&toAddress=%@",delegate.token,fromAddress,toAddress];
    NSData *postData = [param dataUsingEncoding:NSUTF8StringEncoding];
    [URLRequset setHTTPBody:postData];
    NSData *receiveData = [NSURLConnection sendSynchronousRequest:URLRequset returningResponse:nil error:nil];
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:receiveData options:NSJSONReadingMutableLeaves error:nil];
    
    NSLog(@"result = %@",[dict objectForKey:@"result"]);
    
    if([[dict objectForKey:@"result"] intValue] == 1){
        @try{
            for(NSDictionary *s in [dict objectForKey:@"data"]){
                NSString *item = [NSString stringWithFormat:@"订单编号：%@;下单时间：%@;开始地点：%@;终止地点：%@;金额：%@;车型：%@;起点联系人姓名：%@;起点联系人号码：%@;终点联系人姓名：%@;终点联系人号码：%@;装车时间：%@",[s objectForKey:@"id"],[s objectForKey:@"time"],[s objectForKey:@"addressFrom"],[s objectForKey:@"addressTo"],[s objectForKey:@"money"],[s objectForKey:@"truckTypes"],[s objectForKey:@"fromContactName"],[s objectForKey:@"fromContactPhone"],[s objectForKey:@"toContactName"],[s objectForKey:@"toContactPhone"],[s objectForKey:@"loadTime"]];
                [_array addObject:item];
                //NSLog(@"item = %@",item);
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
