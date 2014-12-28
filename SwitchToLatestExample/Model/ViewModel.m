//
//  ViewModel.m
//  SwitchToLatestExample
//
//  Copyright (c) 2014 ITinance GmbH. All rights reserved.
//

#import "ViewModel.h"

@implementation ViewModel

- (instancetype) init {
    if(self = [super init]) {
        
        self.clockIsWorking = @(0);
        
        self.racClock = [[RACObserve(self, clock)
                         map: ^(Clock* clock) {
                             return clock.currentTime;
                         }]
                         switchToLatest];
        ;
        
        self.racClockHasInstance = [RACObserve(self, clock)
                          map: ^(Clock* clock) {
                              return clock == nil ? @"NIL" : [NSString stringWithFormat:@"%@", clock ];
                          }]
                         
        ;
        
    }
    return self;
}

- (void) clockOn {
    NSLog(@"Create Clock instance");
    self.clockIsWorking = @(1);
    self.clock = [[Clock alloc] init];
}

- (void) clockOff {
    NSLog(@"Delete Clock instance");
    self.clockIsWorking = @(0);
    self.clock = nil;
}

@end
