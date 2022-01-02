//
//  ModuleCenterManager.m
//  ModuleCenter
//
//  Created by yanxuezhou on 2022/1/2.
//
#import <objc/runtime.h>
#import "ModuleCenterManager.h"

#import "ModuleProperty.h"
@interface ModuleCenterManager()
@property(nonatomic,strong)NSMutableDictionary<NSString *,ModuleService *>* serviceDictionary;
@property(nonatomic,strong)NSOperationQueue *queue;
@end
@implementation ModuleCenterManager
static ModuleCenterManager *_instance;
static dispatch_once_t onceToken;
+(instancetype)shareModuleCenterManager{
    return [[self alloc]init];
}
//alloc 底层调用还是 allocWithZone，所以重写allocWithZone方法
+ (instancetype)allocWithZone:(struct _NSZone *)zone{

    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}
// copy 方法 也会创建新的对象。为了严谨也应该重写copy方法，因copy方法最终调用的也是copyWithZone因此 重写copyWithZone和mutableCopyWithZone。mutableCopyWithZone，mutableCopyWithZone需遵守NSCopying,NSMutableCopying协议才能敲出，在写出这两个方法后可删除NSCopying,NSMutableCopying协议
-(id)copyWithZone:(NSZone *)zone{


    return _instance;
}
-(id)mutableCopyWithZone:(NSZone *)zone{
    return _instance;
}

-(void)registerRouteMapping:(Class)clazz{

    __weak typeof(self) weakSelf = self;
    [self.queue addOperationWithBlock:^{
        __strong typeof(weakSelf) strongSelf =weakSelf;
        if (strongSelf==nil) {
            return;
        }
        if (clazz!=nil) {
            if ([clazz conformsToProtocol:@protocol(ModuleProperty)]||[clazz respondsToSelector:@selector(getPathAndMethodDictionary)]) {
                NSMutableArray<ModuleService *> *serviceList = [strongSelf getServiceList:clazz];
                if (serviceList&&serviceList.count>0) {
                    for (ModuleService* service in serviceList) {
                        if ([strongSelf checkServiceIsCorrect:service]) {
                            if (![strongSelf getServiceFromPath:service.path clazz:clazz]) {
                                [strongSelf.serviceDictionary setObject:service forKey:service.path];
                            }else{
                                ModuleService* oldService = [strongSelf getServiceFromPath:service.path clazz:clazz];
                                NSLog(@"该路径已注册，path:%@,className:%@,method:%@\n已注册路径，path:%@,className:%@,method:%@",service.path,service.className,service.methodName,oldService.path,oldService.className,oldService.methodName);
                            }
                        }else{
                            NSLog(@"该服务不符合标准，path:%@,className:%@,method:%@",service.path,service.className,service.methodName);
                        }
                    }
                }
                
            }
        }
    }];

}

- (ModuleService*)getServiceFromPath:(NSString*)path clazz:(Class)clazz{//根据路径获取服务
    if ([[self.serviceDictionary allKeys] containsObject:path]) {
        return [self.serviceDictionary valueForKey:path];
    }
    return nil;
}

-(NSMutableArray<ModuleService *> *)getServiceList:(Class)clazz{
    NSMutableArray *serviceContainer = [[NSMutableArray alloc]init];
    if ([clazz conformsToProtocol:@protocol(ModuleProperty)]||[clazz respondsToSelector:@selector(getPathAndMethodDictionary)]) {


        unsigned int count;

        Method *methods = class_copyMethodList(clazz, &count);
        if (methods) {

            for (int i = 0; i < count; i++){
                Method method = methods[i];
                SEL selector = method_getName(method);
                NSString *name = NSStringFromSelector(selector);
                ModuleService* service = [[ModuleService alloc]init];
                service.className = clazz;
                service.methodName = name;
                service.path = [[self class] getPathFromMothod:name class:clazz];
                if (service.path != nil && ![@"" isEqualToString:service.path]) {
                    [serviceContainer addObject:service];
                }
            }
            free(methods);
        }



    }
    return serviceContainer;
}
+ (NSString*)getPathFromMothod:(NSString*)methodName class:(Class)clazz {//根据方法名获取path
    NSDictionary* dic = [clazz getPathAndMethodDictionary];
    if ([dic.allKeys containsObject:methodName]) {
        return [dic valueForKey:methodName];
    }
    NSLog(@"%@,%@:未找到注册路径",NSStringFromClass([self class]),methodName);
    return @"";
}
- (BOOL)checkServiceIsCorrect:(ModuleService*)service {
    if (service.path != nil && ![service.path isEqualToString:@""] && service.className != nil  && service.methodName != nil && ![service.methodName isEqualToString:@""]) {
        return YES;
    }
    return NO;
}

-(ModuleService *)getServiceWithPath:(NSString *)path{
    return [self.serviceDictionary objectForKey:path];
}

- (NSMutableDictionary<NSString *,ModuleService *> *)serviceDictionary {
    if (_serviceDictionary == nil) {
        _serviceDictionary = [NSMutableDictionary new];
    }
    return _serviceDictionary;
}
-(NSOperationQueue *)queue{
    if(_queue==nil){
        _queue = [[NSOperationQueue alloc]init];
        _queue.maxConcurrentOperationCount=1;
    }
    return _queue;
}
@end
