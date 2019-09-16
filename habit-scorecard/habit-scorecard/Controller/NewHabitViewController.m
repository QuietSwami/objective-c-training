//
//  NewHabitViewController.m
//  habit-scorecard
//
//  Created by itsector on 06/09/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

#import "NewHabitViewController.h"
#import "Autocomplete.h"
#import "Date.h"

@interface NewHabitViewController ()

@end

@implementation NewHabitViewController {
    NSString *_value;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        NSLog(@"init NewHabitViewController");
        _value = @"Value";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailLabel.text = _value;
    
    Autocomplete *ac = [[Autocomplete alloc] init];
    self.autocomplete = [ac possible_autocomplete];
    NSLog(@"Autocomplete Options: %@", self.autocomplete);
    
}

#pragma mark - Table view data source


- (IBAction)cancel:(id)sender
{
    NSLog(@"Carreguei Cancel");
    [self.delegate newHabitViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender
{
    NSLog(@"Carreguei Done");
    
    Habit *habit = [[Habit alloc] init];
    habit.habitName = self.habitNameTextField.text;
    habit.habitScore = _value;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];

    habit.habitDate = [NSDate date];
    NSLog(@"%@", habit);
    habit.save;
    
    Autocomplete *ac = [[Autocomplete alloc] init];
    [ac update_habits:habit.habitName];
    
    Date *d = [[Date alloc] init];
    [d update_dates:[dateFormater stringFromDate:habit.habitDate]];
    
    
    [self.delegate newHabitViewController:self didNewHabit:habit];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PickValue"]) {
        ValuePickerViewController *valuePickerViewController = segue.destinationViewController;
        valuePickerViewController.delegate = self;
        valuePickerViewController.value = _value;
    }
}

- (void)valuePickerViewController:(ValuePickerViewController *)controller didSelectValue:(NSString *)value
{
    _value = value;
    self.detailLabel.text = _value;
    
    [self.navigationController popViewControllerAnimated:YES];
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
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
