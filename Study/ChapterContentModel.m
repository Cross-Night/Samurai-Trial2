//
//  ChapterContentModel.m
//  Study
//
//  Created by demo on 16/7/26.
//  Copyright © 2016年 demo. All rights reserved.
//

#import "ChapterContentModel.h"
#import "Comic.h"
#import "Samurai.h"

@implementation ChapterContentModel
@def_signal( eventLoading )
@def_signal( eventLoaded )
@def_signal( eventError )


-(void)dealloc
{
    self.infoList2 = nil;
}

-(void)refresh
{
    CONTENT_CHAPTER_API * api = [CONTENT_CHAPTER_API new];
    api.req.comicName = self.comicName;
    api.req.id = self.id;
    api.whenUpdated = ^(CONTENT_CHAPTER_RESPONSE * resp,id error){
        if (resp &&resp.error_code == 200) {
            INFO(@"成功获取");
            self.infoList2 = resp.result.imageList;
            [self sendSignal:self.eventLoaded];
        }
        else{
            INFO(@"获取失败");
            [self sendSignal:self.eventError];
        }
    };
        [api send];
        
    [self sendSignal:self.eventLoading];
}
@end
