//
//  LinkError.h
//
//  Created by NOVO on 15/8/20.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"


/**
 *链条错误
 *可以响应未知方法，响应未知方法时会打印错误信息
 */
@interface LinkError : LinkInfo
/** 需要类型 */
@property (nonatomic,copy) NSString* needClass;
/** 错误类型 */
@property (nonatomic,copy) NSString* errorClass;
/** 所在函数 */
@property (nonatomic,copy) NSString* inFunc;

- (instancetype)initWithCustomDescription:(NSString*)cDescription;
+ (instancetype)errorWithCustomDescription:(NSString*)cDescription;
- (NSString *)description;
- (NSString *)debugDescription;
- (instancetype)logError;
@end
