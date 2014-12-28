//
//  ViewModel.h
//  SwitchToLatestExample
//
//  Copyright (c) 2014 ITinance GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Clock.h"
#import <ReactiveCocoa.h>

@interface ViewModel : NSObject

@property (nonatomic, strong) Clock* clock;
@property (nonatomic, strong) RACSignal* racClock;
@property (nonatomic, strong) RACSignal* racClockHasInstance;
@property (nonatomic, strong) RACSignal* racClockExtended;

@property (nonatomic, strong) NSNumber* clockIsWorking;

- (void) clockOn;
- (void) clockOff;

@end
