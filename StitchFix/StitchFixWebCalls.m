//
//  StitchFixWebCalls.m
//  StitchFix
//
//  Created by Rogers, April on 6/29/16.
//  Copyright © 2016 Rogers, April. All rights reserved.
//

#import "StitchFixWebCalls.h"
#import "FixItem.h"
#import <AFNetworking/AFNetworking.h>

@implementation StitchFixWebCalls


+ (void)getCurrentFixWithSuccess:(void(^)(NSArray *))success
                         failure:(void (^)(void))failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://fake-mobile-backend.herokuapp.com/api/current_fix" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSArray *fixItems = [FixItem parseDataForCurrentFix:responseObject];
        if (success) {
            success(fixItems);
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
