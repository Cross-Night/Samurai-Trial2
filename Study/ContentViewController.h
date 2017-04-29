//
//  ContentViewController.h
//  Study
//
//  Created by demo on 16/7/28.
//  Copyright © 2016年 demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChapterContent;
@interface ContentViewController : UIViewController<UIGestureRecognizerDelegate>

@property(nonatomic, assign)NSUInteger pageIndex;
@property(nonatomic, strong)NSString * titleText;

@property (nonatomic , strong) ChapterContent *contentData;

@end
