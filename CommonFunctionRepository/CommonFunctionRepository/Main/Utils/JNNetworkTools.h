//
//  JNNetworkTools.h
//  CommonFunctionRepository
//
//  Created by Renjie Zhou on 2018/1/31.
//  Copyright © 2018年 JinNing. All rights reserved.
//

/**
 * 本网络工具需要配合AFN使用
 */

#import <Foundation/Foundation.h>

@interface JNNetworkTools : NSObject

// 获取当前网络链接状态
+(NSString *) currentNetworkStatus;

// 监控当前网络链接状态
+(void) startMonitoringNetworkStatus;

@end
