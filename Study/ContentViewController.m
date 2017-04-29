//
//  ContentViewController.m
//  Study
//
//  Created by demo on 16/7/28.
//  Copyright © 2016年 demo. All rights reserved.
//

#import "ContentViewController.h"
#import "Comic.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ContentViewController ()

@property (weak, nonatomic) IBOutlet UILabel *ImageIdLabel;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;

@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.ImageView sd_setImageWithURL:[NSURL URLWithString:self.contentData.imageUrl]];
    self.ImageIdLabel.text = self.contentData.id;
    
    // 单击的 Recognizer
    UITapGestureRecognizer* singleRecognizer;
    singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(SingleTap:)];
    //点击的次数
    singleRecognizer.numberOfTapsRequired = 1; // 单击
    singleRecognizer.delegate = self;
    //给self.view添加一个手势监测；
    [self.ImageView addGestureRecognizer:singleRecognizer];
    
    // 双击的 Recognizer
    UITapGestureRecognizer* doubleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(DoubleTap:)];
    doubleRecognizer.numberOfTapsRequired = 2; // 双击
    doubleRecognizer.delegate = self;
    //关键语句，给self.view添加一个手势监测；
    [self.ImageView addGestureRecognizer:doubleRecognizer];
    
    [singleRecognizer requireGestureRecognizerToFail:doubleRecognizer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma -tap
-(void)SingleTap:(UITapGestureRecognizer*)recognizer
{
    //处理单击操作
}

-(void)DoubleTap:(UITapGestureRecognizer*)recognizer
{
    //处理双击操作
    self.ImageView.transform = CGAffineTransformMakeScale(2.0, 2.0);
    
}


@end
