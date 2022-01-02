//
//  ViewController.m
//  ModuleCenter
//
//  Created by yanxuezhou on 2022/1/2.
//

#import "ViewController.h"
#import "MCRouter.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)testButClick:(id)sender {
    [MCRouter router:@"test://testPath" param:nil callback:^(NSDictionary * result ) {
        if (result) {
            NSString *msg = result[@"message"];
            NSLog(@"----- %@",msg);
        }
    }];
}


@end
