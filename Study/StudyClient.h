//
//  StudyClient.h
//  Study
//
//  Created by demo on 16/7/14.
//  Copyright © 2016年 demo. All rights reserved.
//

#import "STIHTTPSessionManager.h"
#import "NSObject+AutoCoding.h"

@interface StudyClient : STIHTTPSessionManager
+ (instancetype)sharedClient;
@end


@interface NSObject (APIExtension) <AutoModelCoding>
@end
