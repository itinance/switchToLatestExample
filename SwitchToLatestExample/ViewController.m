//
//  ViewController.m
//  SwitchToLatestExample
//
//  Copyright (c) 2014 ITinance GmbH. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

#import "ViewModel.h"
#import <ReactiveCocoa.h>

@interface ViewController ()

@property (nonatomic, strong) ViewModel* viewModel;
@end

@implementation ViewController

@synthesize viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.delegate = self;
    
    viewModel = [[ViewModel alloc] init];
    
    // direct way
    RAC(self.txtDirectBinding, text) = [[[RACSignal interval:1 onScheduler:[RACScheduler mainThreadScheduler]] startWith:[NSDate date]] map:^id(NSDate *value) {
        NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:value];
        return [NSString stringWithFormat:@"%02ld:%02ld:%02ld", (long)dateComponents.hour, (long)dateComponents.minute, (long)dateComponents.second];
    }];
    
    // view model way
    RAC(self.txtWrappedBinding, text) = viewModel.racClock;
    RAC(self.txtInstancePointer, text) = viewModel.racClockHasInstance;
    
    // periodically create new instances
    [[RACSignal interval:5.0f onScheduler:[RACScheduler mainThreadScheduler]]
     subscribeNext:^(id x) {
         [viewModel clockOn];
     }];
    
    
    // button events
    [[self.btnOn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *sender) {
        [viewModel clockOn];
    }];
    [[self.btnOff rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *sender) {
        [viewModel clockOff];
    }];
  
    // enabled?
    RAC(self.btnOff, enabled) = [RACSignal
                                combineLatest:@[
                                                RACObserve(viewModel, clockIsWorking)
                                                ] reduce:^(NSNumber* isWorking) {
                                                    return @( [isWorking intValue] > 0);
                                                }];
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0);
}

@end
