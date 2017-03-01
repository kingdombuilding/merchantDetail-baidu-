//
//  MerchantGoodsManager.m
//  Test
//
//  Created by wang on 2017/2/22.
//  Copyright © 2017年 wang. All rights reserved.
//

#import "MerchantGoodsManager.h"
#import "UIView+MJ.h"

@interface MerchantGoodsManager () <UITableViewDataSource>

@property (nonatomic, assign) CGPoint pointBefore;


@end

@implementation MerchantGoodsManager


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame style:UITableViewStyleGrouped]) {
        self.delegate = self;
        self.dataSource = self;
        self.sectionHeaderHeight = 30;
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Table"];
        self.rowHeight = kGoodsCellRowHeight;
        
    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {    
    [self.superViewController scrollViewDidScroll:scrollView];
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    label.backgroundColor = [UIColor darkGrayColor];
    label.font = [UIFont systemFontOfSize:13];
    label.text = [NSString stringWithFormat:@"分类%d", (int)section];
    return label;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    
}


//- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section {
//
//}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 15;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Table" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"商品%d-%d", (int)indexPath.section, (int)indexPath.row];
    return cell;
}

@end
