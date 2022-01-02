//
//  BusBController.m
//  BusinessB
//
//  Created by yanxuezhou on 2022/1/2.
//

#import "BusBController.h"
#import <ModuleCenter/MCRouter.h>
@interface BusBController ()
@property (weak, nonatomic) IBOutlet UILabel *showTextLabel;

@end

@implementation BusBController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)butClickB:(id)sender {
    [MCRouter router:@"test://callBusinessA" param:@{@"vc":self} callback:^(NSDictionary * _Nonnull resultDic) {
        if (resultDic) {
            NSString *result = resultDic[@"result"];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.showTextLabel.text=result;
            });
        }
    }];
}

@end
