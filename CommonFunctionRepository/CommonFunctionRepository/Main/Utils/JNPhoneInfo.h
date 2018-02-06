//
//  JNPhoneInfo.h
//  CommonFunctionRepository
//
//  Created by Renjie Zhou on 2018/1/31.
//  Copyright © 2018年 JinNing. All rights reserved.
//  https://github.com/muyusunny/CoreEditText

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface JNPhoneInfo : NSObject

// 获取手机版本号
+(NSString *) phoneVersion;

// 获取手机类型  iphone5， iphone6...
+(NSString *) phoneType;

// 获取电池电量 
+(CGFloat) phoneBatterLevel;

// 获取当前屏幕尺寸
+(CGFloat) screenWidth;
+(CGFloat) screenHeight;
+(CGSize) screenSize;

// 获取当前应用名称
+(NSString *) currentAppName;

// 获取当前应用版本号 1.1， 1.2..
+(NSString *) currentAppVersion;

// 获取当前应用Build版本号
+(NSInteger) currentAppBuildVersion;

@end
