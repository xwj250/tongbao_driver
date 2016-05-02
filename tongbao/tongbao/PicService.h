//
//  PicService.h
//  tongbao
//
//  Created by 夏明瑞 on 16/5/1.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@interface PicService : NSObject

@property(strong,nonatomic) NSString *url;

-(NSString*) upLoadPicture:(UIImage*) image;
@end
