//
//  Message.m
//  tongbao
//
//  Created by 薛文进 on 16/2/26.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import "Message.h"
#import "Personal.h"

@interface Message ()

@end

@implementation Message
@synthesize aryItems;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    //aryItems= [[NSArray alloc]initWithObjects:@"老牛",@"敌法",@"小Y",@"NEC",@"小小",@"白虎", nil];
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
    
    
    NSString *heroSelected=[aryItems objectAtIndex:indexPath.row];
    //indexPath.row得到选中的行号，提取出在数组中的内容。
    UIAlertView *myAlertView;
    myAlertView = [[UIAlertView alloc]initWithTitle:@"dota群英传" message:heroSelected delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
    [myAlertView show];
    //点击后弹出该对话框。
}

-(IBAction)return_personal{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -- table view delegate

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

#pragma mark -- DataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [aryItems count];
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
        
        NSString* item = [aryItems objectAtIndex: indexPath.row];
        [label setText:item];
    }
    
    
    return cell;
}




@end
