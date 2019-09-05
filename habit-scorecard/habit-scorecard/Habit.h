//
//  Habit.h
//  habit-scorecard
//
//  Created by itsector on 05/09/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Habit : NSObject
@property (nonatomic, weak) NSString *habitName;
@property (nonatomic, weak) NSString *habitScore;
@end

NS_ASSUME_NONNULL_END
