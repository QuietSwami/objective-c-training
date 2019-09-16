//
//  Date.h
//  habit-scorecard
//
//  Created by itsector on 13/09/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Date : NSObject
@property (nonatomic, strong) NSDate *date;
- (NSArray *) possible_dates;
- (void) update_dates:(NSString *)date;
@end

NS_ASSUME_NONNULL_END
