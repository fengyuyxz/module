//
//  BusinessAController.m
//  BusinessA
//
//  Created by yanxuezhou on 2022/1/2.
//

#import "BusinessAController.h"
#import <ModuleCenter/ServiceResponse.h>
@interface BusinessAController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation BusinessAController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)butClick:(id)sender {
    NSString *value=self.textField.text;
    if (self.callback) {
        self.callback([ServiceResponse responseDicCode:100 message:@"业务b回调" resultString:value]);
    }
    [self dismissModalViewControllerAnimated:YES];
}



@end
