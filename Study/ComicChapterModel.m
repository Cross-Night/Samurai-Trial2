//
//  ComicChapterModel.m
//  Study
//
//  Created by demo on 16/7/18.
//  Copyright © 2016年 demo. All rights reserved.
//

#import "ComicChapterModel.h"
#import "Comic.h"
#import "Samurai.h"


@implementation ComicChapterModel

@def_signal( eventLoading )
@def_signal( eventLoaded )
@def_signal( eventError )

- (void)dealloc
{
    self.infoList1 = nil;
}
-(void)refresh
{
    LIST_CHAPTER_API *api = [LIST_CHAPTER_API new];
    api.req.comicName = self.comicName;
    api.whenUpdated = ^(LIST_CHAPTER_RESPONSE * resp, id error) {
        if (resp && resp.error_code == 200) {
            INFO(@"成功获取");
            self.infoList1 = resp.result.chapterList;
            [self sendSignal:self.eventLoaded];
        }
        else {
            INFO(@"有错误");
            [self sendSignal:self.eventError];
        }
    };
    [api send];
    [self sendSignal:self.eventLoading];

}


@end
