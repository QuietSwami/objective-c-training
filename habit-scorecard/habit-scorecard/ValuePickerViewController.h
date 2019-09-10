//
//  ValuePickerViewController.h
//  habit-scorecard
//
//  Created by itsector on 09/09/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ValuePickerViewController;

@protocol ValuePickerViewControllerDelegate <NSObject>
- (void)valuePickerViewController:(ValuePickerViewController *)controller didSelectValue:(NSString *)value;
@end

@interface ValuePickerViewController : UITableViewController
@property (nonatomic, weak) id <ValuePickerViewControllerDelegate> delegate;
@property (nonatomic, strong) NSString *value;
@end

NS_ASSUME_NONNULL_END
