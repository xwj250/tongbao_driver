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
@synthesize receiveData=_receiveData;
@synthesize dataPackSerialNo=_dataPackSerialNo;
@synthesize myView=myView;
@synthesize type=_type;

- (void) showMyOrdersForView:(UIViewController*) view type:(int)type{
    myView = view;
    _type = type;
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
    NSLog(@"请求已经发送");
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
    
    NSMutableArray *anyItems = [[NSMutableArray alloc] initWithCapacity:0];
    
    if([[dict objectForKey:@"result"] intValue] == 1){
        @try{
        for(NSDictionary *s in [dict objectForKey:@"data"]){
            NSString *item = [NSString stringWithFormat:@"订单编号：%@;下单时间：%@;开始地点：%@;终止地点：%@;金额：%@;车型：%@;起点联系人姓名：%@;起点联系人号码：%@;终点联系人姓名：%@;终点联系人号码：%@;装车时间：%@",[s objectForKey:@"id"],[s objectForKey:@"time"],[s objectForKey:@"addressFrom"],[s objectForKey:@"addressTo"],[s objectForKey:@"money"],[s objectForKey:@"truckTypes"],[s objectForKey:@"fromContactName"],[s objectForKey:@"fromContactPhone"],[s objectForKey:@"toContactName"],[s objectForKey:@"toContactPhone"],[s objectForKey:@"loadTime"]];
           [anyItems addObject:item];
        }
        
        
    }@catch(NSException *e){
        anyItems = [[NSMutableArray alloc] initWithObjects:@"没有订单", @"1",@"2",nil];
    }
        
    switch (_type) {
        case 1:{
//                NSLog(@"跳转任务界面。。。");
                Mission *vc = [[Mission alloc] init];
                vc.array = anyItems;
                [myView.navigationController pushViewController:vc animated:YES];
                break;
        }
        case 2:{
//                NSLog(@"跳转订单界面。。。");
                History_order *vc = [[History_order alloc] init];
                vc.array = anyItems;
                [myView.navigationController pushViewController:vc animated:YES];
                break;
        }
        default:
                break;
        }
    
    }else if([[dict objectForKey:@"result"] intValue] == 0){
        NSLog(@"wrong");
        UIAlertView *myAlertView;
        myAlertView = [[UIAlertView alloc]initWithTitle:@"结果" message:@"服务器异常" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [myAlertView show];
    }
    
}

//网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法
-(void)connection:(NSURLConnection *)connection
 didFailWithError:(NSError *)error
{
    NSLog(@"网络请求出错：%@",[error localizedDescription]);
}

@end
