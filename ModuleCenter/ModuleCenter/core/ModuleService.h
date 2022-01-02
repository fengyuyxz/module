//
//  ModuleService.h
//  ModuleCenter
//
//  Created by yanxuezhou on 2022/1/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ModuleService : NSObject
/**
 *类名
 */
@property(nonatomic,strong)Class className;
/**
 *方法名
 */
@property(nonatomic,strong)NSString* methodName;
/**
 *服务访问路径
 */
@property(nonatomic,strong)NSString* path;
@end

NS_ASSUME_NONNULL_END
