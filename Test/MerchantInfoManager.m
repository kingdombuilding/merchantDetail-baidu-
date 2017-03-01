//
//  MerchantInfoManager.m
//  Test
//
//  Created by wang on 2017/2/22.
//  Copyright © 2017年 wang. All rights reserved.
//

#import "MerchantInfoManager.h"

@interface MerchantInfoManager () <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

@end

@implementation MerchantInfoManager


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame style:UITableViewStyleGrouped]) {
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Table"];
        
    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.superViewController scrollViewDidScroll:scrollView];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Table" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"信息%d", (int)indexPath.row];
    return cell;
}

@end
