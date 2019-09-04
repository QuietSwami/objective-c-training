//
//  PlayerCellTableViewCell.h
//  Ratings
//
//  Created by itsector on 04/09/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlayerCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *gameLabel;
@property (nonatomic, weak) IBOutlet UIImageView *ratingImageView;
@end

NS_ASSUME_NONNULL_END
