//
//  HabitCell.h
//  habit-scorecard
//
//  Created by itsector on 05/09/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HabitCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *habitName;
@property (nonatomic, weak) IBOutlet UILabel *habitScore;
@end

NS_ASSUME_NONNULL_END
