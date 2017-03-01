//
//  MerchantGoodsCatagoryManager.h
//  Test
//
//  Created by wang on 2017/2/22.
//  Copyright © 2017年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
#import "MerchantVC.h"
@interface MerchantGoodsCatagoryManager : UITableView <UITableViewDelegate>

@property (nonatomic, weak) MerchantVC *superViewController;

@property (nonatomic, assign) int selectedInx;

@end
