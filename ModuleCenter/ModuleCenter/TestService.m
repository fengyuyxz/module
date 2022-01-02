//
//  TestService.m
//  ModuleCenter
//
//  Created by yanxuezhou on 2022/1/2.
//

#import "TestService.h"
#import "ModuleProperty.h"
#import "ModuleCenterManager.h"
@interface TestService()<ModuleProperty>

@end
@implementation TestService
+(void)load{
    [[ModuleCenterManager shareModuleCenterManager]registerRouteMapping:[TestService class]];
}
-(void)test:(NSDictionary *)param{
    void(^callBack)(NSDictionary *) = param[@"responseBlock"];
    if (callBack) {
        callBack(@{@"code":@(100),@"message":@"测试回调"});
    }
}
+ (nonnull NSDictionary *)getPathAndMethodDictionary {
    return @{@"test:":@"test://testPath"};
}

@end
