//
//  ComicListModel.h
//  Study
//
//  Created by demo on 16/7/14.
//  Copyright © 2016年 demo. All rights reserved.
//

#import "Samurai_ModelInstance.h"
#import "Comic.h"

@interface ComicListModel : SamuraiModel

@property (nonatomic, strong) IN NSString *name;
@property (nonatomic, strong) IN NSString *type;
@property (nonatomic, assign) IN NSInteger skip;
@property (nonatomic, assign) IN NSInteger finish;

@property (nonatomic, strong) OUT NSArray<ComicBook> *infoList;
//@property (nonatomic, strong) OUT NSArray * chapterList;


@signal( eventLoading )//正在加载中
@signal( eventLoaded )//加载完成
@signal( eventError )//加载失败

- (void)refresh;

@end
