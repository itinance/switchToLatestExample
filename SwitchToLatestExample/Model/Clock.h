//
//  Clock.h
//  SwitchToLatestExample
//
//  Copyright (c) 2014 ITinance GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>

@interface Clock : NSObject

@property (nonatomic, strong) RACSignal* currentTime;

@end
