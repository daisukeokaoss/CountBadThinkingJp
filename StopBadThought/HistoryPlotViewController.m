//
//  HistoryPlotViewController.m
//  StopBadThought
//
//  Created by 岡 大輔 on 2014/02/10.
//  Copyright (c) 2014年 ナノソフトウェア. All rights reserved.
//

#import "HistoryPlotViewController.h"

@interface HistoryPlotViewController ()

@end

@implementation HistoryPlotViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (IBAction)ReturnButtonTap:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    AppDelegate *appdelegate;
    appdelegate = [[UIApplication sharedApplication] delegate];
    
    if(appdelegate.TapPersisitent == nil){
        appdelegate.TapPersisitent = [[OneTapRecordPersistentManager alloc] init];
    }
    
    return appdelegate.TapPersisitent.TapRecordArray.count;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return [self.Record CountTapRecordNumber];
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DatePlot";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    AppDelegate *appdelegate;
    appdelegate = [[UIApplication sharedApplication] delegate];
    
    if(appdelegate.TapPersisitent == nil){
        appdelegate.TapPersisitent = [[OneTapRecordPersistentManager alloc] init];
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月dd日HH時mm分ss秒"];
    OneTapRecord *onetap = [appdelegate.TapPersisitent.TapRecordArray objectAtIndex:indexPath.section];
    
    cell.textLabel.text = [formatter stringFromDate:onetap.date];
            
    return cell;

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    /*
     if ( [[segue identifier] isEqualToString:@"BadThoughtHappen"] ) {
     ThinkAndDateTimeAndLocationInputViewController *nextViewController = [segue destinationViewController];
     
     }
     */
    if([[segue identifier] isEqualToString:@"ShowOneTapRecordPlot"]){
        OneTapRecordPlotViewController *nextViewController = [segue destinationViewController];
        
    }
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
