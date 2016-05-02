//
//  PicService.m
//  tongbao
//
//  Created by 夏明瑞 on 16/5/1.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import "PicService.h"

@implementation PicService

-(NSString*) upLoadPicture:(UIImage*) image{
    //创建Request对象
    NSString *URLString=@"http://120.27.112.9:8080/tongbao/user/uploadPicture";
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLString]
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                       timeoutInterval:10];
    [request setHTTPMethod:@"POST"];
    NSMutableData *body = [NSMutableData data];
    
    //设置表单项分隔符
    NSString *boundary = @"------------------14737809831466499882746641449";
    
    //根据时间设置图片名称
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMddHHmmss";// 设置时间格式
    NSString *str = [formatter stringFromDate:[NSDate date]];
    NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
    NSData* data = UIImagePNGRepresentation(image);
    
    
    //设置内容类型
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    //写入图片的内容
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n",@"file",fileName] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Type: image/png\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:data];
    [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    //写入INFO的内容
//    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",@"PIC_INFO"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:jsonData];
//    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    //写入尾部内容
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [request setHTTPBody:body];
    
    NSHTTPURLResponse *urlResponese = nil;
    NSError *error = [[NSError alloc]init];
    NSData* resultData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponese error:&error];
    
    

    NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableLeaves error:nil];
    
    NSLog(@"uploadPicResult = %d",[[responseDic objectForKey:@"result"] intValue]);
    
    NSDictionary *temp = [responseDic objectForKey:@"data"];
    _url = [NSString stringWithFormat:@"%@",[temp objectForKey:@"url"]];
    NSLog(@"url = %@",_url);
    
    return _url;
}

@end
