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

- (NSDictionary *) habit_to_dict {
    return @{@'habitName': self.habitName, @'habitScore': self.habitScore};
}

- (NSString *) date_as_string {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
    NSString *capturedStartDate = [dateFormatter stringFromDate:self.habitDate];
    return capturedStartDate;
}

- (void)save {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if([[[defaults dictionaryRepresentation] allKeys] containsObject:self.date_as_string])
    {
        
        NSArray *dateArray = [defaults arrayForKey:self.date_as_string];
        NSDictionary *habit_as_dict = habit_as_dict;
        [dateArray arrayByAddingObject:habit_as_dict];
        [defaults setObject:dateArray forKey:self.date_as_string];
        [defaults synchronize];
        
    } else {
        NSDictionary *habit_as_dict = habit_as_dict;
        NSArray *dateArray = [NSArray arrayWithObject:habit_as_dict];
        [defaults setObject:dateArray forKey:self.date_as_string];
        [defaults synchronize];
    }
    
}

@end
