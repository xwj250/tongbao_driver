//
//  TestViewController.h
//  tongbao
//
//  Created by 薛文进 on 16/3/21.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestViewController : NSObject
@property(nonatomic,retain) NSMutableData *receiveData;
@property(nonatomic,assign)int dataPackSerialNo;
//
//-(void) connection:(NSURLConnection *)connection didReceiveResponse:(nonnull NSURLResponse *)response;
//-(void) connection:(NSURLConnection *)connection didReceiveData:(nonnull NSData *)data;
//-(void)connectionDidFinishLoading:(NSURLConnection *) connection;
//-(void) connection:(NSURLConnection *)connection didFailWithError:(nonnull NSError *)error;
- (void)httpPostNoSyn;
@end
