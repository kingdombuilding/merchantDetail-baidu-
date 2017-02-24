//
//  MerchantCommentManager.m
//  Test
//
//  Created by wang on 2017/2/22.
//  Copyright © 2017年 wang. All rights reserved.
//

#import "MerchantCommentManager.h"

@interface MerchantCommentManager () <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

@end

@implementation MerchantCommentManager

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //        self.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Table"];
        //        [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    }
    return self;
}


//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
//    if ([keyPath isEqualToString:@"contentOffset"]) {
//        CGPoint newOffset = [change[NSKeyValueChangeNewKey] CGPointValue];
//        CGPoint oldOffset = [change[NSKeyValueChangeNewKey] CGPointValue];
//        CGFloat off = newOffset.y - oldOffset.y;
//        if ( self.superViewController.exechangeOff) {
//            [self.superViewController changeOff:self off:off];
//        }
//    }
//}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.superViewController scrollViewDidScroll:scrollView];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Table" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"评论%d", (int)indexPath.row];
    return cell;
}
@end
