//
//  ViewController.m
//  Study
//
//  Created by demo on 16/7/14.
//  Copyright © 2016年 demo. All rights reserved.
//

#import "ViewController.h"
#import "ChapterContentModel.h"
#import "Samurai.h"
#import "Comic.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import <SDWebImage/UIImageView+WebCache.h>


@interface ViewController ()

@property (nonatomic, strong) ChapterContentModel * model;

@end

@implementation ViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];

//    
//    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
//    
//    self.pageViewController.dataSource = self;
//    self.pageViewController.delegate = self;
    
    self.model = [ChapterContentModel new];
    self.model.comicName = self.comicName;
    self.model.id = self.id;
    [self.model addSignalResponder:self];
    
    
    @weakify( self )
    
    self.onSignal(ChapterContentModel.eventLoading,  ^{
        //加载中
        [SVProgressHUD show];

    });
    
    
    self.onSignal(ChapterContentModel.eventLoaded,  ^{
        //成功加载
        [SVProgressHUD dismiss];
        @strongify( self );
        self.pageTitles = [NSMutableArray arrayWithArray:self.model.infoList2];
        ContentViewController *startingViewController = [self vidwControllerAtIndex:0];
        NSArray *viewControllers = @[startingViewController];
        [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
    });
    
    
    self.onSignal(ChapterContentModel.eventError,  ^{
        //加载失败
        NSLog(@"失败");
    });
    
    [self.model refresh];
    

    
}

#pragma mark - PageViewControllerDataSource

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController

{
    
    NSUInteger index = ((ContentViewController *)viewController).pageIndex;
    
    
    
    if (index==0||index==NSNotFound) {
        
        return nil;
        
    }
    
    index--;
    
    return [self vidwControllerAtIndex:index];
    
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController

{
    
    NSUInteger index =((ContentViewController *)viewController).pageIndex;
    
    
    
    if (index==NSNotFound) {
        
        return nil;
        
    }
    
    index++;
    
    if (index==[self.pageTitles count]) {
        
        return nil;
        
    }
    
    return [self vidwControllerAtIndex:index];
    
}

-(ContentViewController *)vidwControllerAtIndex:(NSUInteger)index

{
    
    if (self.pageTitles.count==0 || index>=self.pageTitles.count) {
        
        return nil;
        
    }
    
    ChapterContent *content = self.pageTitles[index];
    
    ContentViewController *ContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentController"];
    
    ContentViewController.contentData = content;
    ContentViewController.pageIndex = index;
    
    return ContentViewController;
    
}

//显示点的数量

-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController

{
    
    //    NSLog(@"%lu",(unsigned long)self.pageTitles.count);
    
    return [self.pageTitles count];
    
}

//初始化选择哪一页

-(NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController

{
    return 0;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    self.pageViewController = segue.destinationViewController;
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;
}

@end