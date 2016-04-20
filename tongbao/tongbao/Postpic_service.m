//
//  Postpic_service.m
//  tongbao
//
//  Created by 薛文进 on 16/4/17.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import "Postpic_service.h"


@implementation Postpic_service
@synthesize receiveData=_receiveData;
@synthesize dataPackSerialNo=_dataPackSerialNo;

@synthesize help;


- (void)httpPostNoSyn:(NSString*)num second:(UIViewController*) control{
    help=control;

    
    NSString *URLString=@"http://120.27.112.9:8080/tongbao/user/uploadPicture";
    NSURL *URL = [NSURL URLWithString:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest *URLRequest=[[NSMutableURLRequest alloc] initWithURL:URL cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:60];
    
    
    NSString *param=[NSString stringWithFormat:@"file=%@",@"1"];
    NSData *postData=[param dataUsingEncoding:NSUTF8StringEncoding];
    [URLRequest setHTTPMethod:@"POST"];
    [URLRequest setHTTPBody:postData];
    NSURLConnection *connection=[[NSURLConnection alloc] initWithRequest:URLRequest delegate:self];
    
    [connection start];
    NSLog(@"请求已经发送");
    // Do any additional setup after loading the view.
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
    
    //    for(id key in dict) {
    //        NSLog(@"key :%@  value :%@", key, [dict objectForKey:key]);
    //    }
    NSLog(@"%@",[dict objectForKey:@"result"]);
    if([[dict objectForKey:@"result"] intValue]==1){
      
    }
    else if([[dict objectForKey:@"result"] intValue] ==0){
        NSLog(@"wrong");
        
        //        First *vc = [[First alloc] init];
        //        [help.navigationController pushViewController:vc animated:YES];
        UIAlertView *myAlertView;
        myAlertView = [[UIAlertView alloc]initWithTitle:@"上传结果" message:@"失败" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
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

