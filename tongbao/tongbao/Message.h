//
//  Message.h
//  tongbao
//
//  Created by 薛文进 on 16/2/26.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Message : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) IBOutlet UITableView *MyTableView;
@property(nonatomic,retain)  NSDictionary *dict;
@property(nonatomic,retain)  NSMutableArray* aryItems;
@property(nonatomic,assign)int judge;

-(IBAction)return_personal;
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;


@end;
