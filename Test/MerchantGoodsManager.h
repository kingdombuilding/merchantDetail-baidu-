//
//  MerchantGoodsManager.h
//  Test
//
//  Created by wang on 2017/2/22.
//  Copyright © 2017年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MerchantVC.h"


#define kGoodsCellRowHeight  88
@interface MerchantGoodsManager : UITableView <UITableViewDelegate>

- (instancetype)initWithFrame:(CGRect)frame;



@property (nonatomic, weak) MerchantVC *superViewController;

@end
