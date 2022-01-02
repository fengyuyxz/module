//
//  BusinessAServcie.m
//  BusinessA
//
//  Created by yanxuezhou on 2022/1/2.
//

#import "BusinessBServcie.h"
#import <ModuleCenter/ModuleCenterManager.h>
#import <ModuleCenter/ModuleProperty.h>
#import "BusBController.h"
@interface BusinessBServcie()<ModuleProperty>

@end
@implementation BusinessBServcie
+(void)load{
    [[ModuleCenterManager shareModuleCenterManager]registerRouteMapping:[BusinessBServcie class]];
}
-(void)callBusinessB:(NSDictionary *)param{
    void(^callBack)(NSDictionary *) = param[@"responseBlock"];
    UIViewController *vc = param[@"vc"];
    BusBController *bvc = [[BusBController alloc]initWithNibName:@"BusBController" bundle:[NSBundle bundleForClass:[BusBController class]]];
    if (vc) {
        [vc.navigationController pushViewController:bvc animated:YES];
    }
}
+ (nonnull NSDictionary *)getPathAndMethodDictionary {
    return @{@"callBusinessB:":@"test://callBusinessB"};
}
@end
