//
//  ManAuthenticationService.h
//  tongbao
//
//  Created by 夏明瑞 on 16/4/30.
//  Copyright © 2016年 薛文进. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ManAuthenticationService : NSObject

- (int) setManAuthInfoWithTruckNum:(NSString*) truckNum realName:(NSString*) realName LicenseNum:(NSString*) licenseNum LicensePicUrl: (NSString*) licensePicUrl DriverHeadPicUrl: (NSString*) driverHeadPicUrl;
@end
