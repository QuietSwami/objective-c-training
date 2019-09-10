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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    NSLog(@"Entrei Table View");
    
    HabitCell *cell = (HabitCell *)[tableView dequeueReusableCellWithIdentifier:@"HabitCell"];
    
    if (cell == nil) {
        NSLog(@"Cell is empty");
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"HabitCell"];
    }
    
    Habit *habit = (self.habits)[indexPath.row];
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
    NSLog(@"Entrei didNewHabit em HabitViewController");
    
    [self.habits addObject:habit];
    
    [self.tableView reloadData];
    
//    NSLog(@"Habits Array Size: %lu", [self.habits count]);
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([self.habits count] - 1) inSection:0];
//    NSLog(@"%@", indexPath);
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//
    [self dismissViewControllerAnimated:YES completion:nil];
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
