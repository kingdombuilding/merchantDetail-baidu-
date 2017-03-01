//
//  MyTableView.m
//  Test
//
//  Created by wang on 2017/3/1.
//  Copyright © 2017年 wang. All rights reserved.
//

#import "MyTableView.h"


@interface MyTableView () <UITableViewDelegate, UITableViewDataSource>

@end
@implementation MyTableView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = [NSString stringWithFormat:@"Text%d", (int)indexPath.row];
    
    return cell;
}




@end
