//
//  ServiceResponse.m
//  ModuleCenter
//
//  Created by yanxuezhou on 2022/1/2.
//

#import "ServiceResponse.h"

@implementation ServiceResponse
+ (NSDictionary *)responseDicCode:(NSInteger)code message:(NSString *)message {
    return [self responseDicCode:code message:message result:nil];
}

+ (NSDictionary *)responseDicCode:(NSInteger)code message:(NSString *)message result:(NSDictionary *)result {
    NSDictionary *dic = @{
                          @"code": @(code),
                          @"message": message ? message : @"",
                          @"result": result ? result : @{}
                          };
    return dic;
}

+ (NSDictionary *)responseDicCode:(NSInteger)code message:(NSString *)message resultString:(NSString *)result {
    NSDictionary *dic = @{
                          @"code": @(code),
                          @"message": message ? message : @"",
                          @"result": result ? result : @""
                          };
    return dic;
}

@end
