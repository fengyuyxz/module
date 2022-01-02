//
//  MCRouter.h
//  ModuleCenter
//
//  Created by yanxuezhou on 2022/1/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MCRouter : NSObject
+(void)router:(NSString *)path param:(NSDictionary *)param callback:(void(^)(NSDictionary * result))responseCallBack;
@end

NS_ASSUME_NONNULL_END
