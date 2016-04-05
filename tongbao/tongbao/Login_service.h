//
//  Login_service.h
//  tongbao
//
//  Created by 薛文进 on 16/3/28.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Login_service : NSObject
@property(nonatomic,retain) NSMutableData *receiveData;
@property(nonatomic,assign)int dataPackSerialNo;
@property (nonatomic, retain) NSString *phoneNum;
@property (nonatomic, retain) UIViewController* help;
//
//-(void) connection:(NSURLConnection *)connection didReceiveResponse:(nonnull NSURLResponse *)response;
//-(void) connection:(NSURLConnection *)connection didReceiveData:(nonnull NSData *)data;
//-(void)connectionDidFinishLoading:(NSURLConnection *) connection;
//-(void) connection:(NSURLConnection *)connection didFailWithError:(nonnull NSError *)error;
- (void)httpPostNoSyn:(NSString*)phone second:(NSString*)pw  third:(int) type forth:(UIViewController*) control;
@end
