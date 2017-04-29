//
//  Comic.h
//  Study
//
//  Created by demo on 16/7/14.
//  Copyright © 2016年 demo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STIHTTPNetwork.h"


@protocol ComicBook <NSObject>@end

@interface ComicBook : NSObject
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *area;
@property (nonatomic, strong) NSString *des;
@property (nonatomic, assign) BOOL finish;
@property (nonatomic, strong) NSString *lastUpdate;
@property (nonatomic, strong) NSString *coverImg;
@end
//----------------------------------------------------------
@protocol BookChapter <NSObject>@end

@interface BookChapter : NSObject
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *commicBookName;
@end
//----------------------------------------------------------
@protocol ChapterContent <NSObject>@end

@interface ChapterContent : NSObject
@property(nonatomic, strong)NSString * imageUrl;
@property(nonatomic, strong)NSString * id;
@end

#pragma mark - API

@interface LIST_CATEGORY_REQUEST : STIHTTPRequest

@end

@interface LIST_CATEGORY_RESPONSE : STIHTTPResponse
@property (nonatomic, assign) NSInteger error_code;
@property (nonatomic, strong) NSString * reason;
@property (nonatomic, strong) NSArray * result;
@end

@interface LIST_CATEGORY_API : STIHTTPApi
@property (nonatomic, strong) LIST_CATEGORY_REQUEST * req;
@property (nonatomic, strong) LIST_CATEGORY_RESPONSE * resp;
@end
//--------------------------------------------------------------------

@interface LIST_BOOK_REQUEST : STIHTTPRequest
@property (nonatomic, strong)NSString * name;
@property (nonatomic, strong)NSString * type;
@property (nonatomic, strong)NSString *skip;
@property (nonatomic, strong)NSString *finish;


//name	string	否	漫画名称
//type	string	否	漫画类别
//skip	int	否	跳过的数量
//finish
@end


@interface LIST_BOOK_RESULT : NSObject
@property (nonatomic, assign) NSInteger total;
@property (nonatomic, assign) NSInteger limit;
@property (nonatomic, strong) NSArray<ComicBook> *bookList;
@end


@interface LIST_BOOK_RESPONSE : STIHTTPResponse
@property (nonatomic, assign) NSInteger error_code;
@property (nonatomic, strong) NSString * reason;
@property (nonatomic, strong) LIST_BOOK_RESULT * result;
@end

@interface LIST_BOOK_API : STIHTTPApi
@property (nonatomic, strong) LIST_BOOK_REQUEST * req;
@property (nonatomic, strong) LIST_BOOK_RESPONSE * resp;
@end

//--------------------------------------------------------------------------------

@interface LIST_CHAPTER_REQUEST : STIHTTPRequest
@property (nonatomic, strong) NSString * comicName;
@property (nonatomic, assign) NSInteger skip;
@end

@interface LIST_CHAPTER_RESULT : NSObject
@property (nonatomic, assign) NSInteger total;
@property (nonatomic, assign) NSInteger limit;
@property (nonatomic, strong) NSString * comicName;
@property (nonatomic ,strong) NSArray<BookChapter> * chapterList;
@end

@interface LIST_CHAPTER_RESPONSE : STIHTTPResponse
@property (nonatomic, assign) NSInteger error_code;
@property (nonatomic, strong) NSString * reason;
@property (nonatomic, strong) LIST_CHAPTER_RESULT * result;
@end

@interface LIST_CHAPTER_API : STIHTTPApi
@property (nonatomic, strong) LIST_CHAPTER_REQUEST * req;
@property (nonatomic, strong) LIST_CHAPTER_RESPONSE * resp;
@end

//---------------------------------------------------------------------------------

@interface CONTENT_CHAPTER_REQUEST : STIHTTPRequest
@property (nonatomic, strong)NSString * comicName;
@property (nonatomic, strong)NSString * id;
@end

@interface CONTENT_CHAPTER_RESULT : NSObject
@property (nonatomic, strong)NSArray<ChapterContent> * imageList;
@property (nonatomic, strong)NSString * comicName;
@property (nonatomic, assign)NSInteger chapterId;
@end

@interface CONTENT_CHAPTER_RESPONSE : STIHTTPResponse
@property (nonatomic, assign) NSInteger error_code;
@property (nonatomic, strong) NSString * reason;
@property (nonatomic, strong) CONTENT_CHAPTER_RESULT * result;
@end

@interface CONTENT_CHAPTER_API : STIHTTPApi
@property (nonatomic, strong) CONTENT_CHAPTER_REQUEST * req;
@property (nonatomic, strong) CONTENT_CHAPTER_RESPONSE * resp;
@end