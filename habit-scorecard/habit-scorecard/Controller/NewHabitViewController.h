//
//  NewHabitViewController.h
//  habit-scorecard
//
//  Created by itsector on 06/09/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Habit.h"
#import "ValuePickerViewController.h"
NS_ASSUME_NONNULL_BEGIN

@class Habit;
@class NewHabitViewController;

@protocol NewHabitViewControllerDelegate <NSObject>
- (void)newHabitViewControllerDidCancel:(NewHabitViewController *)controller;
- (void)newHabitViewController:(NewHabitViewController *)controller didNewHabit:(Habit *)Habit;
@end

@interface NewHabitViewController : UITableViewController <ValuePickerViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UITextField *habitNameTextField;
@property (nonatomic, weak) NSArray *autocomplete;

@property (nonatomic, weak) id <NewHabitViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;
@end

NS_ASSUME_NONNULL_END
