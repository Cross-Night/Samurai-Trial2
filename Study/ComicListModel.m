//
//  ComicListModel.m
//  Study
//
//  Created by demo on 16/7/14.
//  Copyright © 2016年 demo. All rights reserved.
//

#import "ComicListModel.h"
#import "Comic.h"
#import "Samurai.h"

@implementation ComicListModel
@def_signal( eventLoading )
@def_signal( eventLoaded )
@def_signal( eventError )

- (void)dealloc
{
    self.infoList = nil;
}

-(void)refresh
{
    LIST_BOOK_API *api = [LIST_BOOK_API new];
    api.req.type = self.type;
    api.whenUpdated = ^(LIST_BOOK_RESPONSE * resp, id error) {
        if (resp && resp.error_code == 200) {
            INFO(@"成功获取");
            self.infoList = resp.result.bookList;
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


