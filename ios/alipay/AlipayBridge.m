//
//  AlipayBridge.m
//  rn001
//
//  Created by qiepeipei on 16/7/21.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "AlipayBridge.h"

@interface RCT_EXTERN_MODULE(Alipay, NSObject)

RCT_EXTERN_METHOD(initialise:(NSDictionary*)config)
RCT_EXTERN_METHOD(pay:(NSDictionary*)orderMap callback: (RCTResponseSenderBlock)callback)

@end
