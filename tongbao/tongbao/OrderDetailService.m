//
//  OrderDetailService.m
//  tongbao
//
//  Created by 夏明瑞 on 16/4/27.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import "OrderDetailService.h"
#import "AppDelegate.h"
#import "Order_detials.h"

@implementation OrderDetailService

-(void) showDetailFromView:(UIViewController*) view ForID:(int) id InType:(int) type{
    _myView = view;
    _id = id;
    _type = type;
    AppDelegate *delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    NSString *URLString=@"http://120.27.112.9:8080/tongbao/driver/auth/getOrderDetail";
    NSURL *URL = [NSURL URLWithString:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest *URLRequest=[[NSMutableURLRequest alloc] initWithURL:URL cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:60];
    
    
    NSString *param=[NSString stringWithFormat:@"token=%@&id=%d",delegate.token,_id];
    NSData *postData=[param dataUsingEncoding:NSUTF8StringEncoding];
    [URLRequest setHTTPMethod:@"POST"];
    [URLRequest setHTTPBody:postData];
    NSURLConnection *connection=[[NSURLConnection alloc] initWithRequest:URLRequest delegate:self];
    
    [connection start];

}
#pragma mark- NSURLConnectionDataDelegate代理方法
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
    self.receiveData = [NSMutableData data];//数据存储对象的的初始化
    self.dataPackSerialNo=0;
    NSLog(@"收到服务器回应。。。");
}

//接收到服务器传输数据的时候调用，此方法根据数据大小执行若干次
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    
    [self.receiveData appendData:data];
    self.dataPackSerialNo+=1;
}

//数据传完之后调用此方法
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:self.receiveData options:NSJSONReadingMutableLeaves error:nil];
    
//    NSLog(@"data=%@",[dict objectForKey:@"data"]);
    
    if([[dict objectForKey:@"result"] intValue]==1){
        
        @try
        {
            Order_detials *vc = [[Order_detials alloc] init];
            vc.Id = [NSString stringWithFormat:@"%@",[[dict objectForKey:@"data"] objectForKey:@"id"]];
            vc.to = [NSString stringWithFormat:@"%@",[[dict objectForKey:@"data"] objectForKey:@"addressTo"]];
            vc.from = [NSString stringWithFormat:@"%@",[[dict objectForKey:@"data"] objectForKey:@"addressFrom"]];
            vc.startTime = [NSString stringWithFormat:@"%@",[[dict objectForKey:@"data"] objectForKey:@"time"]];
            vc.endTime = [NSString stringWithFormat:@"%@",[[dict objectForKey:@"data"] objectForKey:@"loadTime"]];
            
//            vc.type = [NSString stringWithFormat:@"%@",[[dict objectForKey:@"data"] objectForKey:@"truckTypes"]];
            
            NSArray *types = [[dict objectForKey:@"data"] objectForKey:@"truckTypes"];
            vc.type = [types componentsJoinedByString:@","];
            
            vc.detail = [NSString stringWithFormat:@"%@",[[dict objectForKey:@"data"] objectForKey:@"goodsType"]];

            switch (_type) {
                case 1://历史订单详情
                    vc.buttonName = @"删除";
                    break;
                case 2://任务订单详情
                    vc.buttonName = @"取消";
                    break;
                case 3://抢单详情
                    vc.buttonName = @"抢单";
                    break;
                default:
                    break;
            }
            
            [_myView.navigationController pushViewController:vc animated:YES];
        }@catch (NSException * e) {
            UIAlertView *myAlertView;
            myAlertView = [[UIAlertView alloc]initWithTitle:@"结果" message:@"没有信息" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [myAlertView show];
        }
        
    }
    else if([[dict objectForKey:@"result"] intValue] ==0){
        NSLog(@"wrong");
        UIAlertView *myAlertView;
        myAlertView = [[UIAlertView alloc]initWithTitle:@"结果" message:@"服务器异常" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [myAlertView show];
        
        
    }
    else{NSLog(@"wrong2222");}
    
}

//网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法
-(void)connection:(NSURLConnection *)connection
 didFailWithError:(NSError *)error
{
    NSLog(@"网络请求出错：%@",[error localizedDescription]);
}

@end
