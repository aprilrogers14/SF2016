//
//  FixItem.h
//  StitchFix
//
//  Created by Rogers, April on 6/29/16.
//  Copyright © 2016 Rogers, April. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FixItem : NSObject

@property (nonatomic, strong) NSString *brand;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *itemId;
@property (nonatomic) float price;
@property (nonatomic) BOOL isKeeping;
@property (nonatomic, strong) NSURL *itemImageURL;

+ (NSArray *)parseDataForCurrentFix:(NSDictionary *)data;

@end
