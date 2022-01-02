//
//  ModuleCenterManager.h
//  ModuleCenter
//
//  Created by yanxuezhou on 2022/1/2.
//

#import <Foundation/Foundation.h>
#import "ModuleService.h"
NS_ASSUME_NONNULL_BEGIN

@interface ModuleCenterManager : NSObject
+(instancetype)shareModuleCenterManager;
/// 加载组件中的 router 与 方法映射表
/// @param clazz  路由组件的实现类
-(void)registerRouteMapping:(Class)clazz;
-(ModuleService *)getServiceWithPath:(NSString *)path;
@end

NS_ASSUME_NONNULL_END
