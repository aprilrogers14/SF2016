//
//  ItemFeedbackCollectionViewCell.m
//  StitchFix
//
//  Created by Rogers, April on 6/29/16.
//  Copyright © 2016 Rogers, April. All rights reserved.
//

#import "ItemFeedbackCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface ItemFeedbackCell () {
    UISegmentedControl *_segmentedControl;
}

@end

@implementation ItemFeedbackCell

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"ItemFeedbackCell" owner:self options:nil];
        
        if ([arrayOfViews count] < 1) {
            return nil;
        }
        
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        
        self = [arrayOfViews objectAtIndex:0];
        [self setUpSegmentedControl];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setItem:(FixItem *)item {
    _item = item;
    
    self.brandLabel.text = item.brand;
    self.nameLabel.text = item.name;
    self.priceLabel.text = [NSString stringWithFormat:@"$%2.f", item.price];
    [self.itemImageView setImageWithURL:item.itemImageURL placeholderImage:[UIImage imageNamed:@"placeholder"]];
    _segmentedControl.selectedSegmentIndex = item.isKeeping;
    [self segmentControlAction:_segmentedControl];
}

- (void)setUpSegmentedControl {
    _segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"RETURN", @"KEEP"]];

    _segmentedControl.tintColor = [UIColor colorWithRed:148.0/255.0 green:103.0/255.0 blue:58.0/255.0 alpha:1.0];
    [_segmentedControl addTarget:self action:@selector(segmentControlAction:) forControlEvents: UIControlEventValueChanged];
    _segmentedControl.selectedSegmentIndex = 1;
    [self.segmentedControlView addSubview:_segmentedControl];
    [_segmentedControl setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.segmentedControlView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.segmentedControlView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[control(250)]|"
                                                                                      options:0
                                                                                      metrics:nil
                                                                                        views:@{@"control" : _segmentedControl}]];
    
    [self.segmentedControlView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[control(50)]|"
                                                                                      options:0
                                                                                      metrics:nil
                                                                                        views:@{@"control" : _segmentedControl}]];
    
}

- (void)segmentControlAction:(UISegmentedControl *)segment {
    
    _item.isKeeping = segment.selectedSegmentIndex;
    
    for (int i=0; i<[segment.subviews count]; i++) {
        
        if ([[segment.subviews objectAtIndex:i] isSelected]) {
            UIColor *tintcolor=[UIColor colorWithRed:45.0/255.0 green:171.0/255.0 blue:155.0/255.0 alpha:1.0];
            [[segment.subviews objectAtIndex:i] setTintColor:tintcolor];
        }
        else {
            [[segment.subviews objectAtIndex:i] setTintColor:nil];
        }
    }
}

@end
