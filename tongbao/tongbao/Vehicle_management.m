//
//  Vehicle_management.m
//  tongbao
//
//  Created by 薛文进 on 16/2/29.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import "Vehicle_management.h"

@interface Vehicle_management ()

@end

@implementation Vehicle_management

-(void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    
    [self.MyTableView setDataSource:self];
    self.MyTableView.delegate = self;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //该方法响应列表中行的点击事件
    
    
   // NSString *heroSelected=[aryItems objectAtIndex:indexPath.row];
    //indexPath.row得到选中的行号，提取出在数组中的内容。
    //UIAlertView *myAlertView;
   // myAlertView = [[UIAlertView alloc]initWithTitle:@"dota群英传" message:heroSelected delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
   // [myAlertView show];
    //点击后弹出该对话框。
}


#pragma mark -- table view delegate

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

#pragma mark -- DataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return [aryItems count];
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyTableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    if (cell) {
        UILabel* label = (UILabel*)[cell viewWithTag:1];
        
      //  NSString* item = [aryItems objectAtIndex: indexPath.row];
        //[label setText:item];
    }
    
    
    return cell;
}




@end
