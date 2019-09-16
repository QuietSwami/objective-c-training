//
//  Date.m
//  habit-scorecard
//
//  Created by itsector on 13/09/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

#import "Date.h"

@implementation Date


- (NSArray  *) possible_dates {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *comp = [defaults valueForKey:@"dates"];
    NSLog(@"%@", comp);
    
    return comp;
}

- (void) update_dates: (NSString *) date {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (! [[defaults valueForKey:@"dates"] containsObject:date]) {
        NSLog(@"New habit being inserted: %@", date);
        NSArray *newHabits = [[defaults valueForKey:@"dates"] arrayByAddingObject:date];
        NSLog(@"%@", newHabits);
        [defaults setObject:newHabits forKey:@"dates"];
        [defaults synchronize];
    }
}
@end
