//
//  Autocomplete.m
//  habit-scorecard
//
//  Created by itsector on 16/09/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

#import "Autocomplete.h"

@implementation Autocomplete

- (NSArray  *) possible_autocomplete {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *comp = [defaults valueForKey:@"habits"];
    NSLog(@"%@", comp);

    return comp;
}

- (void) update_habits: (NSString *) habit {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (! [[defaults valueForKey:@"habits"] containsObject:habit]) {
        NSLog(@"New habit being inserted: %@", habit);
        NSArray *newHabits = [[defaults valueForKey:@"habits"] arrayByAddingObject:habit];
        NSLog(@"%@", newHabits);
        [defaults setObject:newHabits forKey:@"habits"];
        [defaults synchronize];
    }
}

@end
