//
//  StudyClient.m
//  Study
//
//  Created by demo on 16/7/14.
//  Copyright © 2016年 demo. All rights reserved.
//

#import "StudyClient.h"
#import "STIHTTPNetwork.h"
#import "NSDate+Extension.h"

static NSString * const kComicAPIURL = @"http://japi.juhe.cn";
static NSString * const kComicApiKey = @"73dc2a4e131f515b95eafc218ae6cf4e";

#pragma mark - API

@implementation StudyClient

+ (void)load
{
    [STIHTTPApi setGlobalHTTPSessionManager:[self sharedClient]];
}

+ (instancetype)sharedClient {
    static StudyClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[StudyClient alloc] initWithBaseURL:[NSURL URLWithString:kComicAPIURL]];
        NSMutableSet *set = [NSMutableSet setWithSet:_sharedClient.responseSerializer.acceptableContentTypes];
        [set addObject:@"text/html"];
        _sharedClient.responseSerializer.acceptableContentTypes = set;
    });
    return _sharedClient;
}

- (id)processedDataWithResponseObject:(id)responseObject task:(NSURLSessionDataTask *)task
{
    // dump responseObject here
    return responseObject;
}

- (NSURLSessionDataTask *)method:(STIHTTPRequestMethod)method
                        endpoint:(NSString *)endpoint
                      parameters:(id)parameters
                         success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                         failure:(void (^)(NSURLSessionDataTask *task, id responseObject, NSError *error))failure
{
    NSDictionary * params = [NSMutableDictionary dictionaryWithDictionary:parameters];
    [params setValue:kComicApiKey forKey:@"key"];
    return [super method:method
                endpoint:endpoint
              parameters:params
                 success:success
                 failure:failure];
}

@end

#pragma mark -

@implementation NSObject (APIExtension)

+ (id)processedValueForKey:(NSString *)key
               originValue:(id)originValue
            convertedValue:(id)convertedValue
                     class:(__unsafe_unretained Class)clazz
                  subClass:(__unsafe_unretained Class)subClazz
{
    if ( [clazz isEqual:NSString.class] )
    {
        if (  [originValue isKindOfClass:NSNumber.class] )
        {
            return ((NSNumber *)originValue).stringValue;
        }
    }
    
    return convertedValue;
}

@end
