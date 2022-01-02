//
//  BusinessAServcie.m
//  BusinessA
//
//  Created by yanxuezhou on 2022/1/2.
//

#import "BusinessAServcie.h"
#import <ModuleCenter/ModuleCenterManager.h>
#import <ModuleCenter/ModuleProperty.h>
#import "BusinessAController.h"
@interface BusinessAServcie()<ModuleProperty>

@end
@implementation BusinessAServcie
+(void)load{
    [[ModuleCenterManager shareModuleCenterManager]registerRouteMapping:[BusinessAServcie class]];
}
-(void)callBusinessA:(NSDictionary *)param{
    void(^callBack)(NSDictionary *) = param[@"responseBlock"];
    UIViewController *vc = param[@"vc"];
    BusinessAController *bvc = [[BusinessAController alloc]initWithNibName:@"BusinessAController" bundle:[NSBundle bundleForClass:[BusinessAController class]]];
    bvc.callback = callBack;
    bvc.modalPresentationStyle = UIModalPresentationFullScreen;
    [vc presentViewController:bvc animated:YES completion:nil];
}
+ (nonnull NSDictionary *)getPathAndMethodDictionary {
    return @{@"callBusinessA:":@"test://callBusinessA"};
}
@end
