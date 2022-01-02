//
//  BusinessAController.h
//  BusinessA
//
//  Created by yanxuezhou on 2022/1/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BusinessAController : UIViewController
typedef void(^CallBack)(NSDictionary * result);
@property(nonatomic,copy)CallBack callback;
@end

NS_ASSUME_NONNULL_END
