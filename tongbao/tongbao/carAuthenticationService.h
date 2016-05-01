//
//  carAuthenticationService.h
//  tongbao
//
//  Created by 夏明瑞 on 16/4/30.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface carAuthenticationService : NSObject

-(int) setTruckAuthInfoWithTruckNum:(NSString*) truckNum TruckHeadPicUrl:(NSString*) truckHeadPicUrl DriverLiscensePicUrl:(NSString*)driveLicensePicUrl;
@end
