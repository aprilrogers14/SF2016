//
//  CheckoutVC.m
//  StitchFix
//
//  Created by Rogers, April on 6/29/16.
//  Copyright © 2016 Rogers, April. All rights reserved.
//

#import "CheckoutVC.h"
#import "CheckoutCell.h"
#import "FixItem.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface CheckoutVC ()

@end

@implementation CheckoutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.keptItems.count;
}

- (CheckoutCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FixItem *item = [self.keptItems objectAtIndex:indexPath.row];
    CheckoutCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell.itemImageView setImageWithURL:item.itemImageURL placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cell.brandLabel.text = item.brand;
    cell.nameLabel.text = item.name;
    cell.priceLabel.text = [NSString stringWithFormat:@"$%.f", item.price];
    
    return cell;
}

@end
