//
//  Passwordchange_service.h
//  tongbao
//
//  Created by 薛文进 on 16/4/5.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Passwordchange_service: NSObject
@property(nonatomic,retain) NSMutableData *receiveData;
@property(nonatomic,assign)int dataPackSerialNo;

@property (nonatomic, retain) UIViewController* help;
//
//-(void) connection:(NSURLConnection *)connection didReceiveResponse:(nonnull NSURLResponse *)response;
//-(void) connection:(NSURLConnection *)connection didReceiveData:(nonnull NSData *)data;
//-(void)connectionDidFinishLoading:(NSURLConnection *) connection;
//-(void) connection:(NSURLConnection *)connection didFailWithError:(nonnull NSError *)error;
- (void)httpPostNoSyn:(NSString*)old second:(NSString*)now  third:(UIViewController*) control;
@end
