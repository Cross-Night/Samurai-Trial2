//
//  ComicChapterModel.h
//  Study
//
//  Created by demo on 16/7/18.
//  Copyright © 2016年 demo. All rights reserved.
//

#import "Samurai_ModelInstance.h"
#import "Comic.h"

@interface ComicChapterModel : SamuraiModel
@property (nonatomic, strong) IN NSString * comicName;
@property (nonatomic, assign) IN NSInteger skip;

//@property (nonatomic, strong) OUT NSArray * chapterList;
@property (nonatomic, strong) OUT NSArray<BookChapter> *infoList1;


@signal( eventLoading )//正在加载中
@signal( eventLoaded )//加载完成
@signal( eventError )//加载失败

- (void)refresh;
@end


