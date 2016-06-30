//
//  ItemFeedbackVC.m
//  StitchFix
//
//  Created by Rogers, April on 6/29/16.
//  Copyright © 2016 Rogers, April. All rights reserved.
//

#import "ItemFeedbackVC.h"
#import "ItemFeedbackCell.h"
#import "FixItem.h"
#import "CheckoutVC.h"

@interface ItemFeedbackVC () {
    UICollectionView *_collectionView;
    UICollectionViewFlowLayout *_flowLayout;
}

@end

@implementation ItemFeedbackVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCollectionView];
    [self setupPageControl];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _flowLayout.itemSize = self.viewForCollection.frame.size;
}

- (void)setupCollectionView {
    // Configure layout
    _flowLayout = [[UICollectionViewFlowLayout alloc] init];
    _flowLayout.minimumInteritemSpacing = 0.0;
    _flowLayout.minimumLineSpacing = 0.0;
    [_flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                         collectionViewLayout:_flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.pagingEnabled = YES;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.backgroundColor = [UIColor clearColor];
    [_collectionView setCollectionViewLayout:_flowLayout];
    
    [_collectionView registerClass:[ItemFeedbackCell class] forCellWithReuseIdentifier:@"item"];
    
    [self.viewForCollection addSubview:_collectionView];
    [_collectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.viewForCollection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.viewForCollection addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[collection]|"
                                                                                   options:0
                                                                                   metrics:nil
                                                                                     views:@{@"collection" : _collectionView}]];
    
    [self.viewForCollection addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[collection]|"
                                                                                   options:0
                                                                                   metrics:nil
                                                                                     views:@{@"collection" : _collectionView}]];
}

- (void)setupPageControl {
    self.pageControl.numberOfPages = self.fixItems.count;
}

#pragma mark - Collection View Data Source & Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.fixItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FixItem *item = [self.fixItems objectAtIndex:indexPath.row];
    ItemFeedbackCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
    cell.item = item;
    
    return cell;
}

#pragma mark - Scroll View Delegate
- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // Update the page when more than 50% of the previous/next page is visible
    CGFloat pageWidth = _collectionView.frame.size.width;
    int page = floor((_collectionView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}

#pragma mark - Navigation Buttons
- (IBAction)nextButtonPressed:(id)sender {
    NSUInteger newIndex = _pageControl.currentPage + 1;
    
    if (newIndex >=  self.fixItems.count) {
        [self performSegueWithIdentifier:@"checkout" sender:self];
    }
    else {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newIndex inSection:0];
        [_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CheckoutVC *vc = segue.destinationViewController;
    vc.keptItems = [self filteredItem];
}

- (NSArray *)filteredItem {
    return [self.fixItems filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(isKeeping == YES)"]];
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
