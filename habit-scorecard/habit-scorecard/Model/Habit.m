//
//  Habit.m
//  habit-scorecard
//
//  Created by itsector on 05/09/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

#import "Habit.h"

@implementation Habit

- (void)load_habits:(NSDictionary *)dict date:(NSString *)date{
    self.habitName = dict[@"habitName"];
    self.habitScore = dict[@"habitScore"];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSDate *capturedStartDate = [dateFormatter dateFromString:date];
    
    self.habitDate = capturedStartDate;
}

- (NSDictionary *) habit_to_dict {
    return @{@"habitName": self.habitName, @"habitScore": self.habitScore};
}

- (NSString *) date_as_string {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *capturedStartDate = [dateFormatter stringFromDate:self.habitDate];
    return capturedStartDate;
}

- (void) save {
    NSLog(@"Entrei no Save");
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    if ([[[defaults dictionaryRepresentation] allKeys] containsObject:self.date_as_string]){
        NSArray *dateArray = [defaults valueForKey:self.date_as_string];
        NSDictionary *habit_dict = self.habit_to_dict;

        NSArray *newArr = [dateArray arrayByAddingObject:habit_dict];

        [defaults setObject:newArr forKey:self.date_as_string];
        [defaults synchronize];
        
    } else {

        NSDictionary *habit_as_dict = self.habit_to_dict;
        NSArray *dateArray = [NSArray arrayWithObject:habit_as_dict];
        [defaults setObject:dateArray forKey:self.date_as_string];
        [defaults synchronize];
    }
}


@end
