//
//  Mission.h
//  tongbao
//
//  Created by 夏明瑞 on 16/2/29.
//  Copyright © 2016年 夏明瑞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Mission : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *array;

@end
