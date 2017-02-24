//
//  MerchantGoodsCatagoryManager.m
//  Test
//
//  Created by wang on 2017/2/22.
//  Copyright © 2017年 wang. All rights reserved.
//

#import "MerchantGoodsCatagoryManager.h"

@interface MerchantGoodsCatagoryManager () <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

@end


@implementation MerchantGoodsCatagoryManager

- (instancetype)init {
    if (self = [super init]) {
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Table"];
    }
    return self;
}


//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    [self.superViewController scrollViewDidScroll:scrollView];
//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Table" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"分类%d", (int)indexPath.row];
    return cell;
}

@end
