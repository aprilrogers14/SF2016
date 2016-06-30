//
//  FixItem.m
//  StitchFix
//
//  Created by Rogers, April on 6/29/16.
//  Copyright © 2016 Rogers, April. All rights reserved.
//

#import "FixItem.h"

@implementation FixItem

+ (NSArray *)parseDataForCurrentFix:(NSDictionary *)data {
    NSMutableArray *newItems = [[NSMutableArray alloc] init];
    NSArray *items = data[@"shipment_items"];
    
    for (NSDictionary *item in items) {
        [newItems addObject:[self createItemFromData:item]];
    }
    
    return newItems;
}
         
+ (FixItem *)createItemFromData:(NSDictionary *)item {
    FixItem *fi = [FixItem new];
    fi.brand = item[@"brand"];
    fi.name = item[@"name"];
    fi.itemId = item[@"id"];
    fi.price = [item[@"price"] floatValue];
    fi.itemImageURL = [NSURL URLWithString:item[@"image_url"]];
    fi.isKeeping = YES;
    
    return fi;
}

@end
