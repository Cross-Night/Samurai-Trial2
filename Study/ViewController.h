//
//  ViewController.h
//  Study
//
//  Created by demo on 16/7/14.
//  Copyright © 2016年 demo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentViewController.h"
#import "Comic.h"


@interface ViewController : UIViewController<UIPageViewControllerDataSource, UIPageViewControllerDelegate>
@property(nonatomic,strong)NSMutableArray *pageTitles;
@property(nonatomic,weak)UIPageViewController *pageViewController;

@property (nonatomic, strong)NSString * comicName;
@property (nonatomic, strong)NSString * id;

@end

