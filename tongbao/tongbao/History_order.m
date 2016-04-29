//
//  History_order.m
//  tongbao
//
//  Created by 夏明瑞 on 16/3/1.
//  Copyright © 2016年 夏明瑞. All rights reserved.
//

#import "History_order.h"
#import "First.h"
#import "Personal.h"
#import "OrderDetailService.h"
#import "MyOrdersService.h"

@interface History_order ()

@end

@implementation History_order

- (void)viewDidLoad {
    [super viewDidLoad];
    MyOrdersService *s = [[MyOrdersService alloc] init];
    _array = [s showMyOrdersInType:2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *TableSampleIdentifier = @"TableSampleIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             TableSampleIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:TableSampleIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [self.array objectAtIndex:row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row<[_array count]){
        NSString *selected = [_array objectAtIndex:indexPath.row];

        NSArray *infoList = [selected componentsSeparatedByString:@";"];
        NSArray *temp = [[infoList objectAtIndex:0] componentsSeparatedByString:@"："];
        int id = [[temp objectAtIndex:1] intValue];

        OrderDetailService *s = [[OrderDetailService alloc] init];
        [s showDetailFromView:self ForID:id InType:1];
    }
}

- (IBAction)firstTouch:(UIBarButtonItem *)sender {
    First *first = [[First alloc] init];
    [self.navigationController pushViewController:first animated:YES];
}

- (IBAction)meTouch:(UIBarButtonItem *)sender {
    Personal *personal = [[Personal alloc] init];
    [self.navigationController pushViewController:personal animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    MyOrdersService *s = [[MyOrdersService alloc] init];
    _array = [s showMyOrdersInType:2];
    [_tableView reloadData];
}

@end
