//
//  ComicCategoryModel.h
//  Study
//
//  Created by demo on 16/7/14.
//  Copyright © 2016年 demo. All rights reserved.
//

#import "Samurai_ModelInstance.h"

@interface ComicCategoryModel : SamuraiModel


@property (nonatomic, strong) OUT NSArray *categoryList;

@signal( eventLoading )//正在加载中
@signal( eventLoaded )//加载完成
@signal( eventError )//加载失败

- (void)refresh;

@end
