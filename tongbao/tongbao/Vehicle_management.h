//
//  Vehicle_management.h
//  tongbao
//
//  Created by 薛文进 on 16/2/29.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Vehicle_management : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) IBOutlet UITableView *MyTableView;
@property(nonatomic,retain)  NSDictionary *dict;
@property(nonatomic,retain)  NSMutableArray* aryItems;
@property(nonatomic,assign)int judge;

-(IBAction)vehicle_retun;
-(IBAction)add_car;
@end
