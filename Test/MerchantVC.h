//
//  MerchantVC.h
//  Test
//
//  Created by wang on 2017/2/20.
//  Copyright © 2017年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MerchantVC : UIViewController <UIScrollViewDelegate>


@property (nonatomic, assign) BOOL exechangeOff;

@property (nonatomic, weak) UILabel *label;

@property (nonatomic, strong) UIScrollView *fatherScroll;

//- (void)changeOff:(UITableView *)table off:(CGFloat)off;

@end
