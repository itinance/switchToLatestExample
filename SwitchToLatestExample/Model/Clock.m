//
//  Clock.m
//  SwitchToLatestExample
//
//  Copyright (c) 2014 ITinance GmbH. All rights reserved.
//

#import "Clock.h"
#import <ReactiveCocoa.h>

@implementation Clock

@synthesize currentTime;

- (instancetype) init {
    if(self = [super init]) {
        currentTime = [[[RACSignal interval:1 onScheduler:[RACScheduler mainThreadScheduler]] startWith:[NSDate date]] map:^id(NSDate *value) {
            NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:value];
            return [NSString stringWithFormat:@"%ld:%ld:%02ld", (long) dateComponents.hour, (long)dateComponents.minute, (long)dateComponents.second];
        }];
        

    }
    return self;
}


@end
