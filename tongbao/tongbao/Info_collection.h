//
//  Info_collection.h
//  tongbao
//
//  Created by 薛文进 on 16/2/29.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Info_collection : UIViewController<UIImagePickerControllerDelegate,UIActionSheetDelegate,UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *headImage;

@property (strong, nonatomic) UIActionSheet *actionSheet;

- (IBAction)clickPickImage:(id)sender;
@end
