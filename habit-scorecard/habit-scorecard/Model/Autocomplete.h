//
//  Autocomplete.h
//  habit-scorecard
//
//  Created by itsector on 16/09/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Autocomplete : NSObject
@property (nonatomic, strong) NSArray *autocomplete;

- (NSArray *) possible_autocomplete;
- (void) update_habits:(NSString *)habit;
@end

NS_ASSUME_NONNULL_END
