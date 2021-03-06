//
//  ComicListViewController.m
//  Study
//
//  Created by demo on 16/7/14.
//  Copyright © 2016年 demo. All rights reserved.
//

#import "ComicListViewController.h"
#import "ComicListViewCell.h"
#import "ComicListModel.h"
#import "Samurai.h"
#import "Comic.h"
#import "ComicChapterTableViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>


@interface ComicListViewController ()
@property (nonatomic, strong) ComicListModel * model;

@end

@implementation ComicListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.model = [ComicListModel new];
    self.model.type = self.categoryType;
    [self.model addSignalResponder:self];
    
    
    @weakify( self )
    
    self.onSignal(ComicListModel.eventLoading,  ^{
        //加载中
    });
    
    
    self.onSignal(ComicListModel.eventLoaded,  ^{
        //成功加载
        @strongify( self );
        [self.tableView reloadData];
    });
    
    
    self.onSignal(ComicListModel.eventError,  ^{
        //加载失败
    });
    
    [self.model refresh];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.model.infoList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ComicListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ComicListViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    ComicBook * oneBook = self.model.infoList[indexPath.row];
//    cell.name.text = [self.model.categoryList ];
    cell.name.text = oneBook.name;
    cell.type.text = oneBook.type;
    cell.des.text = oneBook.des;
    cell.area.text  = oneBook.area;
    [cell.coverImg sd_setImageWithURL:[NSURL URLWithString:oneBook.coverImg]];
    return cell;
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    ComicChapterTableViewController *destVC = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    ComicBook * oneBook = self.model.infoList[indexPath.row];
    destVC.comicName = oneBook.name;

    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
