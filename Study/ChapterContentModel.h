//
//  ChapterContentModel.h
//  Study
//
//  Created by demo on 16/7/26.
//  Copyright © 2016年 demo. All rights reserved.
//

#import "Samurai_ModelInstance.h"
#import "Comic.h"

@interface ChapterContentModel : SamuraiModel
@property (nonatomic, strong)IN NSString * comicName;
@property (nonatomic, strong)IN NSString * id;

@property(nonatomic, strong)OUT NSMutableArray<ChapterContent> * infoList2;

@signal( eventLoading )//正在加载中
@signal( eventLoaded )//加载完成
@signal( eventError )//加载失败

- (void)refresh;
@end
