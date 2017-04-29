//
//  ComicCategoryModel.m
//  Study
//
//  Created by demo on 16/7/14.
//  Copyright © 2016年 demo. All rights reserved.
//

#import "ComicCategoryModel.h"
#import "Comic.h"


@implementation ComicCategoryModel

@def_signal( eventLoading )
@def_signal( eventLoaded )
@def_signal( eventError )



- (void)dealloc
{
    self.categoryList = nil;
}


-(void)refresh
{
    LIST_CATEGORY_API *api = [LIST_CATEGORY_API new];
    api.whenUpdated = ^(LIST_CATEGORY_RESPONSE * resp, id error) {
        if (resp && resp.error_code == 0) {
            NSLog(@"成功获取");
            self.categoryList = resp.result;
            [self sendSignal:self.eventLoaded];
        }
        else {
            NSLog(@"有错误");
            [self sendSignal:self.eventError];
        }
    };
    [api send];
    [self sendSignal:self.eventLoading];
}


@end
