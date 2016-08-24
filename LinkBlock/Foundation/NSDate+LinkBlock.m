//
//  NSDate+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/3.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(NSDateLinkBlock)
- (NSInteger (^)(NSDate *))dateMinusYear
{
    return ^(NSDate* date){
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(dateMinusYear,date)
        NSDateComponents* comps = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitYear
                                   fromDate:_self toDate:date
                                   options:0];
        return [comps year];
    };
}

- (NSInteger (^)(NSDate *))dateMinusMonth
{
    return ^(NSDate* date){
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(dateMinusMonth,date)
        NSDateComponents* comps = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitMonth
                                   fromDate:_self toDate:date
                                   options:0];
        return [comps month];
    };
}

- (NSInteger (^)(NSDate *))dateMinusDay
{
    return ^(NSDate* date){
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(dateMinusDay,date)
        NSDateComponents* comps = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitDay
                                   fromDate:_self toDate:date
                                   options:0];
        return [comps day];
    };
}

- (NSInteger (^)(NSDate *))dateMinusHour
{
    return ^(NSDate* date){
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(dateMinusHour,date)
        NSDateComponents* comps = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitHour
                                   fromDate:_self toDate:date
                                   options:0];
        return [comps hour];
    };
}

- (NSInteger (^)(NSDate *))dateMinusMinut
{
    return ^(NSDate* date){
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(dateMinusMinut,date)
        NSDateComponents* comps = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitMinute
                                   fromDate:_self toDate:date
                                   options:0];
        return [comps minute];
    };
}

- (NSInteger (^)(NSDate *))dateMinusSec
{
    return ^(NSDate* date){
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(dateMinusSec,date)
        NSDateComponents* comps = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitSecond
                                   fromDate:_self toDate:date
                                   options:0];
        return [comps second];
    };
}

- (NSString *(^)(NSString *))dateToStrWithFormat
{
    return ^id(NSString* formatStr){
        LinkHandle_REF(NSString, NSDate)
        LinkGroupHandle_REF(dateToStrWithFormat,formatStr)
        if(!formatStr || ![formatStr isKindOfClass:[NSString class]])
            return [_self description];
        NSDateFormatter* fmt=  [NSDateFormatter new];
        fmt.dateFormat= formatStr;
        return [fmt stringFromDate:_self];
    };
}

- (NSDate *(^)(NSTimeInterval))dateAddTimeInterval
{
    return ^id(NSTimeInterval timeInterval){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateAddTimeInterval,timeInterval)
        return [_self dateByAddingTimeInterval:timeInterval];
    };
}

- (NSDate *(^)(NSInteger))dateAddSec
{
    return ^id(NSInteger sec){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateAddSec,sec)
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        comps.second=sec;
        NSCalendar *calender = [NSCalendar currentCalendar];
        return [calender dateByAddingComponents:comps toDate:_self options:0];
    };
}

- (NSDate *(^)(NSInteger))dateAddMinut
{
    return ^id(NSInteger minute){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateAddMinut,minute)
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        comps.minute=minute;
        NSCalendar *calender = [NSCalendar currentCalendar];
        return [calender dateByAddingComponents:comps toDate:_self options:0];
    };
}

- (NSDate *(^)(NSInteger))dateAddHour
{
    return ^id(NSInteger hour){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateAddHour,hour)
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        comps.hour=hour;
        NSCalendar *calender = [NSCalendar currentCalendar];
        return [calender dateByAddingComponents:comps toDate:_self options:0];
    };
}

- (NSDate *(^)(NSInteger))dateAddDay
{
    return ^id(NSInteger day){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateAddDay,day)
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        comps.day=day;
        NSCalendar *calender = [NSCalendar currentCalendar];
        return [calender dateByAddingComponents:comps toDate:_self options:0];
    };
}

- (NSDate *(^)(NSInteger))dateAddMonth
{
    return ^id(NSInteger month){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateAddMonth,month)
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        comps.month=month;
        NSCalendar *calender = [NSCalendar currentCalendar];
        return [calender dateByAddingComponents:comps toDate:_self options:0];
    };
}

- (NSDate *(^)(NSInteger))dateAddYear
{
    return ^id(NSInteger year){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateAddYear,year)
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        comps.year=year;
        NSCalendar *calender = [NSCalendar currentCalendar];
        return [calender dateByAddingComponents:comps toDate:_self options:0];
    };
}

- (NSInteger (^)())dateYear
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(dateYear)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSYearCalendarUnit fromDate:_self];
        return [comps year];
    };
}

- (NSInteger (^)())dateMonth
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(dateMonth)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSMonthCalendarUnit fromDate:_self];
        return [comps month];
    };
}

- (NSInteger (^)())dateDay
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(dateDay)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSDayCalendarUnit fromDate:_self];
        return [comps day];
    };
}

- (NSInteger (^)())dateHour
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(dateHour)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSHourCalendarUnit fromDate:_self];
        return [comps hour];
    };
}

- (NSInteger (^)())dateMinut
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(dateMinut)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSMinuteCalendarUnit fromDate:_self];
        return [comps minute];
    };
}

- (NSInteger (^)())dateSec
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(dateSec)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSSecondCalendarUnit fromDate:_self];
        return [comps second];
    };
}

- (NSDate *(^)())dateDayAtStart
{
    return ^id(){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateDayAtStart)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSUIntegerMax fromDate:_self];
        comps.hour=0;
        comps.minute=0;
        comps.second=0;
        return [[NSCalendar currentCalendar] dateFromComponents:comps];
    };
}

- (NSDate *(^)())dateDayAtEnd
{
    return ^id(){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateDayAtEnd)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSUIntegerMax fromDate:_self];
        comps.hour=23;
        comps.minute=59;
        comps.second=59;
        return [[NSCalendar currentCalendar] dateFromComponents:comps];
    };
}

- (NSDate *(^)())dateCurrentZone
{
    return ^id(){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateCurrentZone)
        NSTimeZone* zone = [NSTimeZone systemTimeZone];
        NSInteger offset = [zone secondsFromGMTForDate:_self];
        return [_self dateByAddingTimeInterval:offset];
    };
}

- (NSDate *(^)(NSInteger))dateSetYear
{
    return ^id(NSInteger year){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateSetYear,year)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitYear fromDate:_self];
        comps.year=year;
        NSTimeInterval timeNum = (double)(int)[[calendar dateFromComponents:comps] timeIntervalSince1970];
        return [NSDate dateWithTimeIntervalSince1970:timeNum];
    };
}

- (NSDate *(^)(NSInteger))dateSetMonth
{
    return ^id(NSInteger month){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateSetMonth,month)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitMonth fromDate:_self];
        comps.month=month;
        NSTimeInterval timeNum = (double)(int)[[calendar dateFromComponents:comps] timeIntervalSince1970];
        return [NSDate dateWithTimeIntervalSince1970:timeNum];
    };
}

- (NSDate *(^)(NSInteger))dateSetDay
{
    return ^id(NSInteger day){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateSetDay,day)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitDay fromDate:_self];
        comps.day=day;
        NSTimeInterval timeNum = (double)(int)[[calendar dateFromComponents:comps] timeIntervalSince1970];
        return [NSDate dateWithTimeIntervalSince1970:timeNum];
    };
}

- (NSDate *(^)(NSInteger))dateSetHour
{
    return ^id(NSInteger hour){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateSetHour,hour)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitHour fromDate:_self];
        comps.hour=hour;
        NSTimeInterval timeNum = (double)(int)[[calendar dateFromComponents:comps] timeIntervalSince1970];
        return [NSDate dateWithTimeIntervalSince1970:timeNum];
    };
}

- (NSDate *(^)(NSInteger))dateSetMinut
{
    return ^id(NSInteger minute){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateSetMinut,minute)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        calendar.timeZone=[NSTimeZone systemTimeZone];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitHour fromDate:_self];
        comps.minute=minute;
        NSTimeInterval timeNum = (double)(int)[[calendar dateFromComponents:comps] timeIntervalSince1970];
        return [NSDate dateWithTimeIntervalSince1970:timeNum];
    };
}

- (NSDate *(^)(NSInteger))dateSetSec
{
    return ^id(NSInteger sec){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateSetSec,sec)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        calendar.timeZone=[NSTimeZone systemTimeZone];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitHour fromDate:_self];
        comps.second=sec;
        NSTimeInterval timeNum = (double)(int)[[calendar dateFromComponents:comps] timeIntervalSince1970];
        return [NSDate dateWithTimeIntervalSince1970:timeNum];
    };
}

- (BOOL (^)())dateIsLeapYear
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSDate){
            return NO;
        }
        LinkGroupHandle_VAL(dateIsLeapYear)
        NSInteger year = _self.dateYear();
        if ((year%4==0 && year %100 !=0) || year%400==0) {
            return YES;
        }else {
            return NO;
        }
        return NO;
    };
}

- (BOOL (^)())dateIsInToday
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSDate){
            return NO;
        }
        LinkGroupHandle_VAL(dateIsInToday)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:_self];
        NSDateComponents *compsNow  = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:[NSDate date]];
        if([comps year]==[compsNow year] && [comps month]==[compsNow month] && [comps day]==[compsNow day]){
            return YES;
        }
        return NO;
    };
}

- (BOOL (^)())dateIsInMonth
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSDate){
            return NO;
        }
        LinkGroupHandle_VAL(dateIsInMonth)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit fromDate:_self];
        NSDateComponents *compsNow  = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit fromDate:[NSDate date]];
        if([comps year]==[compsNow year] && [comps month]==[compsNow month]){
            return YES;
        }
        return NO;
    };
}

- (NSTimeInterval (^)())dateTimeIntervalSince1970
{
    return ^(){
        
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSTimeInterval)0.0;
        }
        LinkGroupHandle_VAL(dateTimeIntervalSince1970)
        return [_self timeIntervalSince1970];
    };
}

- (NSDateComponents *(^)())dateComponentsAll
{
    return ^id(){
        LinkHandle_REF(NSDateComponents, NSDate)
        LinkGroupHandle_REF(dateComponentsAll)
        return [[NSCalendar currentCalendar] components:NSUIntegerMax fromDate:_self];
    };
}

@end
