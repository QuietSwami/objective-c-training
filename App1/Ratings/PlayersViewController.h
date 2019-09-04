//
//  PlayersViewControllerTableViewController.h
//  Ratings
//
//  Created by itsector on 03/09/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerDetailsViewController.h"

@interface PlayersViewController : UITableViewController <PlayerDetailsViewControllerDelegate>
@property (nonatomic, strong) NSMutableArray *players;
@end
