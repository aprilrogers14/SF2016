//
//  ItemFeedbackCollectionViewCell.h
//  StitchFix
//
//  Created by Rogers, April on 6/29/16.
//  Copyright © 2016 Rogers, April. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FixItem.h"

@interface ItemFeedbackCell : UICollectionViewCell

@property (weak, nonatomic) FixItem *item;
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *brandLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIView *segmentedControlView;

@end
