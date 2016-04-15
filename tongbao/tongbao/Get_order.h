//
//  Get_order.h
//  tongbao
//
//  Created by 夏明瑞 on 16/3/1.
//  Copyright © 2016年 夏明瑞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Get_order : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *array;
@property (strong, nonatomic) IBOutlet UITextField *fromAddress;
@property (strong, nonatomic) IBOutlet UITextField *toAddress;

@end
