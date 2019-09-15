//
//  HabitViewController.m
//  habit-scorecard
//
//  Created by itsector on 05/09/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

#import "HabitViewController.h"
#import "HabitCell.h"
#import "Habit.h"

@interface HabitViewController ()

@end

@implementation HabitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.date;
    self.habits = [self get_habits_by_date:self.date];
    self.navigationItem.leftBarButtonItem = nil;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.habits count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    HabitCell *cell = (HabitCell *)[tableView dequeueReusableCellWithIdentifier:@"HabitCell"];
    
    if (cell == nil) {
        NSLog(@"Cell is empty");
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"HabitCell"];
    }
    
    Habit *habit = [[Habit alloc] init];
    [habit load_habits:(self.habits)[indexPath.row] date:self.date];
    cell.habitName.text = habit.habitName;
    cell.habitScore.text = habit.habitScore;
    
    return cell;
}

#pragma mark - NewHabitViewControllerDelegate

- (void)newHabitViewControllerDidCancel:(NewHabitViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)newHabitViewControllerDidSave:(NewHabitViewController *)controller
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"newHabit"]) {
        
        UINavigationController *navigationController = segue.destinationViewController;
        NewHabitViewController *newHabitViewController = [navigationController viewControllers][0];
        newHabitViewController.delegate = self;
    
    }
}


- (void)newHabitViewController:(NewHabitViewController *)controller didNewHabit:(Habit *)habit
{
    
    self.habits = [self.habits arrayByAddingObject:habit];
    
    [self.tableView reloadData];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (NSArray *) get_habits_by_date:(NSString *) date {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    NSArray *habits = [defaults valueForKey:self.date];
    
    return habits;
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
