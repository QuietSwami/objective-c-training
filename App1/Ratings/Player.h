//
//  Player.h
//  Ratings
//
//  Created by itsector on 03/09/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Player : NSObject

@property (nonatomic, copy) NSString *game;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int rating;

@end

NS_ASSUME_NONNULL_END
