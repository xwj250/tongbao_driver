//
//  Get_order.m
//  tongbao
//
//  Created by 夏明瑞 on 16/3/1.
//  Copyright © 2016年 夏明瑞. All rights reserved.
//

#import "Get_order.h"
#import "ShowAllOrdersService.h"
#import "ShowOrdersService.h"
#import "OrderDetailService.h"
@interface Get_order ()

@end

@implementation Get_order
@synthesize array = _array;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    _array = [[NSArray alloc] initWithObjects:@"1",@"2", nil];
    
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
//        NSLog(@"select = %@",selected);
        NSArray *infoList = [selected componentsSeparatedByString:@";"];
        NSArray *temp = [[infoList objectAtIndex:0] componentsSeparatedByString:@"："];
        int id = [[temp objectAtIndex:1] intValue];
//        NSLog(@"id = %d",id);
        OrderDetailService *s = [[OrderDetailService alloc] init];
        [s showDetailFromView:self ForID:id InType:3];
    }
}

- (IBAction)searchButton:(UIButton *)sender {
    ShowOrdersService *service = [[ShowOrdersService alloc] init];
    self.array = [service showOrdersFrom:_fromAddress.text To:_toAddress.text];
    [_tableView reloadData];
}


- (IBAction)backButton:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}



@end
