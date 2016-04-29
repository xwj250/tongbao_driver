//
//  Order_detials.h
//  tongbao
//
//  Created by 夏明瑞 on 16/3/1.
//  Copyright © 2016年 夏明瑞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Order_detials : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *idLabel;

@property (weak, nonatomic) IBOutlet UILabel *fromLabel;

@property (weak, nonatomic) IBOutlet UILabel *toLabel;

@property (weak, nonatomic) IBOutlet UILabel *startTimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *endTimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

@property (weak, nonatomic) IBOutlet UIButton *bottomButton;

@property (strong,nonatomic) NSString *Id;

@property (strong,nonatomic) NSString *from;

@property (strong,nonatomic) NSString *to;

@property (strong,nonatomic) NSString *startTime;

@property (strong,nonatomic) NSString *endTime;

@property (strong,nonatomic) NSString *detail;

@property (strong,nonatomic) NSString *type;

@property (strong,nonatomic) NSString *buttonName;

@property (strong,nonatomic) NSDictionary *dict;

@end
