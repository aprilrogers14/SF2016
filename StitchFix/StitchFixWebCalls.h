//
//  StitchFixWebCalls.h
//  StitchFix
//
//  Created by Rogers, April on 6/29/16.
//  Copyright © 2016 Rogers, April. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StitchFixWebCalls : NSObject

+ (void)getCurrentFixWithSuccess:(void(^)(NSArray *))success
                         failure:(void (^)(void))failure;

@end
