//
//  ViewController.h
//  SwitchToLatestExample
//
//  Copyright (c) 2014 ITinance GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *btnOff;
@property (weak, nonatomic) IBOutlet UIButton *btnOn;

@property (weak, nonatomic) IBOutlet UITextField *txtDirectBinding;
@property (weak, nonatomic) IBOutlet UITextField *txtWrappedBinding;
@property (weak, nonatomic) IBOutlet UITextField *txtInstancePointer;

@end

