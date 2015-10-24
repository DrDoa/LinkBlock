//
//  NSDate+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/3.
//  Copyright (c) 2015年 QuXingYi. All rights reserved.
//

#import "NSDate+LinkBlock.h"
#import "LinkBlock.h"

@implementation NSObject(NSDateLinkBlock)
- (NSInteger (^)(NSDate *))dateMinusYear
{
    return ^(NSDate* date){
        LinkError_VAL_IF(NSDate){
            return (NSInteger)0;
        }
        NSDateComponents* comps = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitYear
                                   fromDate:_self toDate:date
                                   options:0];
        return [comps year];
    };
}
- (void)setDateMinusYear:(NSInteger (^)(NSDate *))dateMinusYear{};

- (NSInteger (^)(NSDate *))dateMinusMonth
{
    return ^(NSDate* date){
        LinkError_VAL_IF(NSDate){
            return (NSInteger)0;
        }
        NSDateComponents* comps = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitMonth
                                   fromDate:_self toDate:date
                                   options:0];
        return [comps month];
    };
}
- (void)setDateMinusMonth:(NSInteger (^)(NSDate *))dateMinusMonth{};

- (NSInteger (^)(NSDate *))dateMinusDay
{
    return ^(NSDate* date){
        LinkError_VAL_IF(NSDate){
            return (NSInteger)0;
        }
        NSDateComponents* comps = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitDay
                                   fromDate:_self toDate:date
                                   options:0];
        return [comps day];
    };
}
- (void)setDateMinusDay:(NSInteger (^)(NSDate *))dateMinusDay{};

- (NSInteger (^)(NSDate *))dateMinusHour
{
    return ^(NSDate* date){
        LinkError_VAL_IF(NSDate){
            return (NSInteger)0;
        }
        NSDateComponents* comps = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitHour
                                   fromDate:_self toDate:date
                                   options:0];
        return [comps hour];
    };
}
- (void)setDateMinusHour:(NSInteger (^)(NSDate *))dateMinusHour{};

- (NSInteger (^)(NSDate *))dateMinusMinut
{
    return ^(NSDate* date){
        LinkError_VAL_IF(NSDate){
            return (NSInteger)0;
        }
        NSDateComponents* comps = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitMinute
                                   fromDate:_self toDate:date
                                   options:0];
        return [comps minute];
    };
}
- (void)setDateMinusMinut:(NSInteger (^)(NSDate *))dateMinusMinut{};

- (NSInteger (^)(NSDate *))dateMinusSec
{
    return ^(NSDate* date){
        LinkError_VAL_IF(NSDate){
            return (NSInteger)0;
        }
        NSDateComponents* comps = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitSecond
                                   fromDate:_self toDate:date
                                   options:0];
        return [comps second];
    };
}
- (void)setDateMinusSec:(NSInteger (^)(NSDate *))dateMinusSec{};

- (NSString *(^)(NSString *))dateToStrWithFormate
{
    return ^(NSString* formateStr){
        LinkError_REF_AUTO(NSString, NSDate);
        if(!formateStr || ![formateStr isKindOfClass:[NSString class]])
            return [_self description];
        NSDateFormatter* fmt=  [NSDateFormatter new];
        fmt.dateFormat= formateStr;
        return [fmt stringFromDate:_self];
    };
}
- (void)setDateToStrWithFormate:(NSString *(^)(NSString *))dateToStrWithFormate{};

- (NSDate *(^)(NSTimeInterval))dateAddTimeInterval
{
    return ^(NSTimeInterval timeInterval){
        LinkError_REF_AUTO(NSDate, NSDate);
        return [_self dateByAddingTimeInterval:timeInterval];
    };
}
- (void)setDateAddTimeInterval:(NSDate *(^)(NSTimeInterval))dateAddTimeInterval{};

- (NSDate *(^)(NSInteger))dateAddSec
{
    return ^(NSInteger sec){
        LinkError_REF_AUTO(NSDate, NSDate);
        return [_self dateByAddingTimeInterval:(NSTimeInterval)sec];
    };
}
- (void)setDateAddSec:(NSDate *(^)(NSInteger))dateAddSec{};

- (NSDate *(^)(NSInteger))dateAddMinut
{
    return ^(NSInteger minut){
        LinkError_REF_AUTO(NSDate, NSDate);
        return [_self dateByAddingTimeInterval: minut*60.0];
    };
}
- (void)setDateAddMinut:(NSDate *(^)(NSInteger))dateAddMinut{};

- (NSDate *(^)(NSInteger))dateAddHour
{
    return ^(NSInteger hour){
        LinkError_REF_AUTO(NSDate, NSDate);
        return [_self dateByAddingTimeInterval: hour*3600.0];
    };
}
- (void)setDateAddHour:(NSDate *(^)(NSInteger))dateAddHour{};

- (NSDate *(^)(NSInteger))dateAddDay
{
    return ^(NSInteger dat){
        LinkError_REF_AUTO(NSDate, NSDate);
        return [_self dateByAddingTimeInterval: dat*86400.0];
    };
}
- (void)setDateAddDay:(NSDate *(^)(NSInteger))dateAddDay{};

- (NSDate *(^)(NSInteger))dateAddMonth
{
    return ^(NSInteger month){
        LinkError_REF_AUTO(NSDate, NSDate);
        return [_self dateByAddingTimeInterval: month*2592000.0];
    };
}
- (void)setDateAddMonth:(NSDate *(^)(NSInteger))dateAddMonth{};

- (NSDate *(^)(NSInteger))dateAddYear
{
    return ^(NSInteger year){
        LinkError_REF_AUTO(NSDate, NSDate);
        return [_self dateByAddingTimeInterval: year*31536000.0];
    };
}
- (void)setDateAddYear:(NSDate *(^)(NSInteger))dateAddYear{};
@end