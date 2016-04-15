//
//  ShowAllOrdersService.m
//  tongbao
//
//  Created by 夏明瑞 on 16/4/13.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import "ShowAllOrdersService.h"
#import "Get_order.h"
#import "AppDelegate.h"


@implementation ShowAllOrdersService

@synthesize receiveData=_receiveData;
@synthesize dataPackSerialNo=_dataPackSerialNo;
@synthesize myView=myView;
@synthesize fromAddress = _fromAddress;
@synthesize toAddress = _toAddress;
@synthesize array = _array;

- (NSMutableArray*) showAllOrdersForView:(UIViewController*) view From:(NSString*) fromAddress To:(NSString*) toAddress{
    myView = view;
    _fromAddress = fromAddress;
    _toAddress = toAddress;
    AppDelegate *delegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    NSString *URLString = @"http://120.27.112.9:8080/tongbao/driver/auth/showAllOrders";
    NSURL *URL = [NSURL URLWithString:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest *URLRequset = [[NSMutableURLRequest alloc] initWithURL:URL cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:60];
    
    NSString *param = [NSString stringWithFormat:@"token=%@&fromAddress=%@&toAddress=%@",delegate.token,fromAddress,toAddress];
    NSData *postData = [param dataUsingEncoding:NSUTF8StringEncoding];
    [URLRequset setHTTPMethod:@"POST"];
    [URLRequset setHTTPBody:postData];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:URLRequset delegate:self];
    [connection start];
    NSLog(@"请求已经发送");
    if(_array == 0){
        NSLog(@"array为空");
    }
    for(id temp in _array){
        NSLog(@"%@",temp);
    }
    return _array;
}

#pragma mark- NSURLConnectionDataDelegate代理方法
- (void)connection:(NSURLConnection*) connection didReceiveResponse:(NSURLResponse *)response{
    NSHTTPURLResponse *res = (NSHTTPURLResponse*) response;
    self.receiveData = [NSMutableData data];
    self.dataPackSerialNo = 0;
    NSLog(@"收到服务器回应。。。");
}

//接收到服务器传输数据的时候调用，此方法根据数据大小执行若干次
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    
    [self.receiveData appendData:data];
    self.dataPackSerialNo+=1;
}

//数据传完之后调用此方法
-(void)connectionDidFinishLoading:(NSURLConnection*) connection{
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:self.receiveData options:NSJSONReadingMutableLeaves error:nil];
    NSLog(@"result = %@",[dict objectForKey:@"result"]);
    
    for(id key in dict) {
        NSLog(@"key :%@  value :%@", key, [dict objectForKey:key]);
    }
    
//    NSMutableArray *anyItems = [[NSMutableArray alloc] initWithCapacity:0];
    _array = [[NSMutableArray alloc] initWithCapacity:0];
    
    if([[dict objectForKey:@"result"] intValue] == 1){
        @try{
            for(NSDictionary *s in [[dict objectForKey:@"data"] allValues]){
                NSString *item = [NSString stringWithFormat:@"订单编号：%@;下单时间：%@;开始地点：%@;终止地点：%@;金额：%@;车型：%@;起点联系人姓名：%@;起点联系人号码：%@;终点联系人姓名：%@;终点联系人号码：%@;装车时间：%@",[s objectForKey:@"id"],[s objectForKey:@"time"],[s objectForKey:@"addressFrom"],[s objectForKey:@"addressTo"],[s objectForKey:@"money"],[s objectForKey:@"truckTypes"],[s objectForKey:@"fromContactName"],[s objectForKey:@"fromContactPhone"],[s objectForKey:@"toContactName"],[s objectForKey:@"toContactPhone"],[s objectForKey:@"loadTime"]];
                [_array addObject:item];
                NSLog(@"item = %@",item);
            }
            
            
        }@catch(NSException *e){
            _array = [[NSMutableArray alloc] initWithObjects:@"没有订单", @"1",@"2",nil];
        }
        
        
    }else if([[dict objectForKey:@"result"] intValue] == 0){
        NSLog(@"wrong");
        UIAlertView *myAlertView;
        myAlertView = [[UIAlertView alloc]initWithTitle:@"结果" message:@"服务器异常" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [myAlertView show];
    }
//    for(id temp in anyItems){
//        NSLog(@"%@",temp);
//    }
    
}

//网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法
-(void)connection:(NSURLConnection *)connection
 didFailWithError:(NSError *)error
{
    NSLog(@"网络请求出错：%@",[error localizedDescription]);
}
@end
