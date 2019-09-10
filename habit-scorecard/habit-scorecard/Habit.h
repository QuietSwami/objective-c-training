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

@property (nonatomic, copy) NSString *habitName;
@property (nonatomic, copy) NSString *habitScore;
@property (nonatomic, copy) NSDate *habitDate;

-(void)load_habits:(NSDictionary*)dict date:(NSString*)date;
@end

NS_ASSUME_NONNULL_END
