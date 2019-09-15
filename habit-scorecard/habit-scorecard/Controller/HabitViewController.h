//
//  HabitViewController.h
//  habit-scorecard
//
//  Created by itsector on 05/09/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewHabitViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HabitViewController : UITableViewController <NewHabitViewControllerDelegate>
@property (nonatomic, strong) NSArray *habits;
@property (nonatomic, strong) NSString *date;
@end

NS_ASSUME_NONNULL_END
