//
//  MCRouter.m
//  ModuleCenter
//
//  Created by yanxuezhou on 2022/1/2.
//

#import "MCRouter.h"
#import "ServiceResponse.h"
#import "ModuleCenterManager.h"
@implementation MCRouter
+(void)router:(NSString *)path param:(NSDictionary *)param callback:(void(^)(NSDictionary * result))responseCallBack{
    if (path==nil||[@"" isEqualToString:path]) {
        if (responseCallBack) {
            responseCallBack([ServiceResponse responseDicCode:101 message:@"path不能为空"]);
        }
        NSLog(@"path不能为空");
        return;
    }
    // 网络请求，按自己工程实际情况实现
    if ([path hasPrefix:@"http://"]||[path hasPrefix:@"https://"]) {

    }else{

        NSMutableDictionary *mParam = nil;
        if (param!=nil) {
            mParam = [[NSMutableDictionary alloc]initWithDictionary:param];
        }else{
            mParam = [@{} mutableCopy];
        }
        if (responseCallBack) {
            [mParam setObject:responseCallBack forKey:@"callBack"];
            [mParam setObject:responseCallBack forKey:@"responseBlock"];
        }

        // 通过path查找服务
        ModuleService *service = [[ModuleCenterManager shareModuleCenterManager]getServiceWithPath:path];
        if (service) {
            id object = [[service.className alloc]init];
            SEL sel = NSSelectorFromString(service.methodName);
            IMP imp = [object methodForSelector:sel];
            void (*func)(id, SEL , id) = (void *)imp;
            func(object, sel, mParam);
        }else{
            if (responseCallBack) {
                responseCallBack([ServiceResponse responseDicCode:101 message:@"未找到对应服务"]);
            }
            NSLog(@"path不能为空");
        }
    }
}
@end
