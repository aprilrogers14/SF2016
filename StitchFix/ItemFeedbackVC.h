//
//  ItemFeedbackVC.h
//  StitchFix
//
//  Created by Rogers, April on 6/29/16.
//  Copyright © 2016 Rogers, April. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemFeedbackVC : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate>

@property (nonatomic, weak) NSArray *fixItems;
@property (nonatomic, weak) IBOutlet UIPageControl *pageControl;
@property (nonatomic, weak) IBOutlet UIView *viewForCollection;


- (IBAction)nextButtonPressed:(id)sender;
- (IBAction)cancelButtonPressed:(id)sender;


@end
