//
//  Habit.m
//  habit-scorecard
//
//  Created by itsector on 05/09/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

#import "Habit.h"

@implementation Habit

-(void)load_habits:(NSDictionary *)dict date:(NSString *)date{
    self.habitName = dict[@"habitName"];
    self.habitScore = dict[@"habitScore"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
    NSDate *capturedStartDate = [dateFormatter dateFromString:date];
    self.habitDate = capturedStartDate;
}

@end
