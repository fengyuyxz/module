//
//  ViewController.m
//  Dome
//
//  Created by yanxuezhou on 2022/1/2.
//

#import "ViewController.h"
#import <ModuleCenter/MCRouter.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)butClick:(id)sender {
    [MCRouter router:@"test://callBusinessB" param:@{@"vc":self} callback:^(NSDictionary * _Nonnull resultDic) {
        
    }];
}


@end
