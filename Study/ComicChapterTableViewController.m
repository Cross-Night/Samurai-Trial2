//
//  ComicChapterTableViewController.m
//  Study
//
//  Created by demo on 16/7/18.
//  Copyright © 2016年 demo. All rights reserved.
//

#import "ComicChapterTableViewController.h"
#import "ComicChapterViewCell.h"
#import "ComicChapterModel.h"
#import "Samurai.h"
#import "Comic.h"
#import "ChapterContentViewController.h"
#import "ViewController.h"

@interface ComicChapterTableViewController ()
@property ComicChapterModel * model;
@end

@implementation ComicChapterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.model = [ComicChapterModel new];
    self.model.comicName = self.comicName;
    [self.model addSignalResponder:self];
    
    @weakify( self )
    
    self.onSignal(ComicChapterModel.eventLoading,  ^{
        //加载中
    });
    
    
    self.onSignal(ComicChapterModel.eventLoaded,  ^{
        //成功加载
        @strongify( self );
        
        for (BookChapter *chapter in self.model.infoList1) {
            chapter.commicBookName = self.comicName;
        }
        
        [self.tableView reloadData];
    });
    
    
    self.onSignal(ComicChapterModel.eventError,  ^{
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
    return self.model.infoList1.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ComicChapterViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ComicChapterViewCell" forIndexPath:indexPath];
    
    BookChapter * oneChapter = self.model.infoList1[indexPath.row];
    cell.chapterLabel.text = oneChapter.name;
    cell.idLabel.text = oneChapter.id;
    // Configure the cell...
    
    return cell;
}


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
    ViewController *destVC = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    BookChapter * oneChapter = self.model.infoList1[indexPath.row];
    destVC.comicName = oneChapter.commicBookName;
    destVC.id = oneChapter.id;

    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
