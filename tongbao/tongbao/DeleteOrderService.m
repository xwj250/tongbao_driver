//
//  DeleteOrderService.m
//  tongbao
//
//  Created by 夏明瑞 on 16/4/29.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import "DeleteOrderService.h"
#import "AppDelegate.h"

@implementation DeleteOrderService
-(void) deleteOrderWithId:(int)Id{
    AppDelegate *delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    NSString *URLString=@"http://120.27.112.9:8080/tongbao/driver/auth/deleteOrder";
    NSURL *URL = [NSURL URLWithString:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest *URLRequest=[[NSMutableURLRequest alloc] initWithURL:URL cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:60];
    
    
    NSString *param=[NSString stringWithFormat:@"token=%@&id=%d",delegate.token,Id];
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
    
    if([[dict objectForKey:@"result"] intValue]==1){
        
        UIAlertView *myAlertView;
        myAlertView = [[UIAlertView alloc]initWithTitle:@"结果" message:@"删除成功" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [myAlertView show];
        
    }else if([[dict objectForKey:@"result"] intValue] ==0){
        UIAlertView *myAlertView;
        myAlertView = [[UIAlertView alloc]initWithTitle:@"结果" message:[NSString stringWithFormat:@"删除失败，％@" ,[dict objectForKey:@"errorMsg"]] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [myAlertView show];
    }
//    else{NSLog(@"wrong2222");}
    
}

//网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法
-(void)connection:(NSURLConnection *)connection
 didFailWithError:(NSError *)error
{
    NSLog(@"网络请求出错：%@",[error localizedDescription]);
}

@end
