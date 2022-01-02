//
//  ModuleProperty.h
//  ModuleCenter
//
//  Created by yanxuezhou on 2022/1/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ModuleProperty <NSObject>
@required
+ (NSDictionary*)getPathAndMethodDictionary;
@end

NS_ASSUME_NONNULL_END
