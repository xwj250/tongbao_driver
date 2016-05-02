//
//  carAuthenticationService.m
//  tongbao
//
//  Created by 夏明瑞 on 16/4/30.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import "carAuthenticationService.h"
#import "AppDelegate.h"

@implementation carAuthenticationService

-(int) setTruckAuthInfoWithTruckNum:(NSString*) truckNum TruckHeadPicUrl:(NSString*) truckHeadPicUrl CarLiscensePicUrl:(NSString*)carLicensePicUrl{
    AppDelegate *delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    NSString *URLString=@"http://120.27.112.9:8080/tongbao/driver/auth/setTruckAuthInfo";
    NSURL *URL = [NSURL URLWithString:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest *URLRequest=[[NSMutableURLRequest alloc] initWithURL:URL cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:60];
    
    
    NSString *param=[NSString stringWithFormat:@"token=%@&truckNum=%@&truckHeadPicUrl=%@&driveLicensePicUrl=%@",delegate.token,truckNum,truckHeadPicUrl,carLicensePicUrl];
    NSData *postData=[param dataUsingEncoding:NSUTF8StringEncoding];
    [URLRequest setHTTPMethod:@"POST"];
    [URLRequest setHTTPBody:postData];
    NSData *receiveData = [NSURLConnection sendSynchronousRequest:URLRequest returningResponse:nil error:nil];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:receiveData options:NSJSONReadingMutableLeaves error:nil];
    
//    NSLog(@"carAuthResult = %d",[[dict objectForKey:@"result"] intValue]);
//    NSLog(@"carAuthErrMsg = %@",[NSString stringWithFormat:@"%@",[dict objectForKey:@"errorMsg"]]);
    
    return [[dict objectForKey:@"result"] intValue];
}

@end
