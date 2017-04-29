//
//  ComicListViewCell.h
//  Study
//
//  Created by demo on 16/7/14.
//  Copyright © 2016年 demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComicListViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *coverImg;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *des;
@property (weak, nonatomic) IBOutlet UILabel *area;



@end
