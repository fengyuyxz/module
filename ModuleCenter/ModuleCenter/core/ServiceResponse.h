//
//  ServiceResponse.h
//  ModuleCenter
//
//  Created by yanxuezhou on 2022/1/2.
//

#import <Foundation/Foundation.h>
//自己定义成功code是什么，现在是100为成功
#define responseSUCCode 100
NS_ASSUME_NONNULL_BEGIN

@interface ServiceResponse : NSObject
//callBack返回数据结构
+ (NSDictionary *)responseDicCode:(NSInteger)code message:(NSString *)message;

+ (NSDictionary *)responseDicCode:(NSInteger)code message:(NSString *)message result:(NSDictionary *)result;

+ (NSDictionary *)responseDicCode:(NSInteger)code message:(NSString *)message resultString:(NSString *)result;

@end

NS_ASSUME_NONNULL_END
