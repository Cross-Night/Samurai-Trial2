//
//  Comic.m
//  Study
//
//  Created by demo on 16/7/14.
//  Copyright © 2016年 demo. All rights reserved.
//

#import "Comic.h"

@implementation ComicBook
@end

@implementation BookChapter
@end


@implementation ChapterContent
@end

@implementation LIST_CATEGORY_REQUEST
@end

@implementation LIST_CATEGORY_RESPONSE
@end

@implementation LIST_CATEGORY_API

@synthesize req = _req;
@synthesize resp = _resp;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.req = [LIST_CATEGORY_REQUEST requestWithEndpoint:@"/comic/category" method:STIHTTPRequestMethodGet];
        self.req.responseClass = [LIST_CATEGORY_RESPONSE class];
    }
    return self;
}

@end
//-----------------------------------------------------------------------------------------

@implementation LIST_BOOK_RESULT

@end


@implementation LIST_BOOK_REQUEST
@end

@implementation LIST_BOOK_RESPONSE
@end


@implementation LIST_BOOK_API

@synthesize req = _req;
@synthesize resp = _resp;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.req = [LIST_BOOK_REQUEST requestWithEndpoint:@"/comic/book" method:STIHTTPRequestMethodGet];
        self.req.responseClass = [LIST_BOOK_RESPONSE class];
    }
    return self;
}

@end

//-----------------------------------------------------------------------------------------------
@implementation LIST_CHAPTER_RESULT

@end

@implementation LIST_CHAPTER_REQUEST

@end

@implementation LIST_CHAPTER_RESPONSE

@end

@implementation LIST_CHAPTER_API

@synthesize req = _req;
@synthesize resp = _resp;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.req = [LIST_CHAPTER_REQUEST requestWithEndpoint:@"/comic/chapter" method:STIHTTPRequestMethodGet];
        self.req.responseClass = [LIST_CHAPTER_RESPONSE class];
    }
    return self;
}

@end

//-------------------------------------------------------------------------------------------------
@implementation CONTENT_CHAPTER_REQUEST

@end

@implementation CONTENT_CHAPTER_RESPONSE

@end

@implementation CONTENT_CHAPTER_RESULT

@end

@implementation CONTENT_CHAPTER_API

@synthesize req = _req;
@synthesize resp = _resp;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.req = [CONTENT_CHAPTER_REQUEST requestWithEndpoint:@"/comic/chapterContent" method:STIHTTPRequestMethodGet];
        self.req.responseClass = [CONTENT_CHAPTER_RESPONSE class];
    }
    return self;
}

@end
