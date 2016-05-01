//
//  ManAuthenticationService.m
//  tongbao
//
//  Created by 夏明瑞 on 16/4/30.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import "ManAuthenticationService.h"
#import "AppDelegate.h"

@implementation ManAuthenticationService

- (int) setManAuthInfoWithTruckNum:(NSString*) truckNum realName:(NSString*) realName LicenseNum:(NSString*) licenseNum LicensePicUrl: (NSString*) licensePicUrl DriverHeadPicUrl: (NSString*) driverHeadPicUrl{
    AppDelegate *delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    NSString *URLString=@"http://120.27.112.9:8080/tongbao/driver/auth/setRealNameAuthInfo";
    NSURL *URL = [NSURL URLWithString:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest *URLRequest=[[NSMutableURLRequest alloc] initWithURL:URL cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:60];
    
    
    NSString *param=[NSString stringWithFormat:@"token=%@&truckNum=%@&realName=%@&licenseNum=%@&licensePicUrl=%@&driverHeadPicUrl=%@",delegate.token,truckNum,realName,licenseNum,licensePicUrl,driverHeadPicUrl];
    NSData *postData=[param dataUsingEncoding:NSUTF8StringEncoding];
    [URLRequest setHTTPMethod:@"POST"];
    [URLRequest setHTTPBody:postData];
    NSData *receiveData = [NSURLConnection sendSynchronousRequest:URLRequest returningResponse:nil error:nil];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:receiveData options:NSJSONReadingMutableLeaves error:nil];
    return [[dict objectForKey:@"result"] intValue];

}

@end
