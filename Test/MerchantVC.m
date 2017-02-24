//
//  MerchantVC.m
//  Test
//
//  Created by wang on 2017/2/20.
//  Copyright © 2017年 wang. All rights reserved.
//

#import "MerchantVC.h"
#import "UIColor+RGB_16.h"

#import "UIView+MJ.h"


#import "MerchantGoodsManager.h"
#import "MerchantGoodsCatagoryManager.h"
#import "MerchantCommentManager.h"
#import "MerchantInfoManager.h"

// 滚动视图上面可见高度
#define kVisibleHeight (37)

//保存当前app的版本
#define kAppCurrentVersion      @"appCurrentVersion"

#define INDEX_PRO_TABLE_CHANGE_COUNT_KEY @"indexProtableChange"

#define RgbColor(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define Margin 10

#define kViewX (MainScreenSize_W / 6 - 17.5)

#define UIColorFromRGBA(rgbValue, alphaValue) \
[UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:alphaValue]

//block 弱化self
#define kWeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;

/**
 *  app 主色调 黄色
 */
#define kBaseColor      (UIColorFromRGBA(0xff9a00, 1.0))

/**
 *  按钮字体 置白透明
 */
#define klightGrayColor (UIColorFromRGBA(0xFFFFFF, 0.5))
/**
 *  分割线颜色
 */
#define kLineColor      (UIColorFromRGBA(0xf5f5f5, 1))

/**
 *  VC的背景底色
 */
#define kBaseBgColor    (UIColorFromRGBA(0xf5f5f5, 1))

/**
 *  描边颜色
 */
#define kStrokeColor     (UIColorFromRGBA(0x333333, 0.1))

#define kColor3  [UIColor colorWithHexString:@"#333333"]
#define kColor6  [UIColor colorWithHexString:@"#666666"]
#define kColor9  [UIColor colorWithHexString:@"#999999"]

#define kNavHeight          (64)
// 商品左边分类的宽度
#define kShopLeftWidth      (85)
// tabBar 高度
#define kBottomHieght       (44)

#define kShopSimpleInfoHeight 100

// 画一像素线的宏
/*/
 UIView *view = [[UIView alloc] initWithFrame:CGrect(x - SINGLE_LINE_ADJUST_OFFSET, 0, SINGLE_LINE_WIDTH, 100)];
 */
#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET   ((1 / [UIScreen mainScreen].scale) / 2)



#define MainScreenSize_W   [[UIScreen mainScreen] bounds].size.width
#define MainScreenSize_H   [UIScreen mainScreen].bounds.size.height

#define SIZE_TIMES         [UIScreen mainScreen].bounds.size.width/320

@interface MerchantVC () <UIScrollViewDelegate> {
    UIButton *btn1;
    UIButton *btn2;
    UIButton *btn3;
    
    CGRect headerRect;
    
    CGFloat contentOffset1;
    CGFloat contentOffset2;
    CGFloat contentOffset3;
    //    CGFloat contentOffset4;
    UITableView *_tableView1;
    UITableView *_tableView2;
    UITableView *_tableView3;
    
    CGFloat headerViewY;
}



@property (nonatomic, strong) UIView *tableHeaderView;

@property (nonatomic, strong) MerchantGoodsManager *goodsManager;

@property (nonatomic, strong) MerchantCommentManager *commentManager;

@property (nonatomic, strong) MerchantGoodsCatagoryManager *categoryManager;

@property (nonatomic, strong) MerchantInfoManager *InfoManager;

@property (nonatomic, strong) UIScrollView *selectScrollView;

@property (nonatomic, assign) CGFloat tableHeaderY;

@property (nonatomic, strong) UIView *theView;


//@property (nonatomic, strong) UIScrollView *scrollViewCover;
@end

@implementation MerchantVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    //    self.title = @"商家";
    
    [self layoutUI];
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
}

- (void)layoutUI {
    // 父滚动视图
    
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kNavHeight + kVisibleHeight, MainScreenSize_W, MainScreenSize_H - kNavHeight - kVisibleHeight)];
    _fatherScroll = scrollView;
    scrollView.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:scrollView];
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(MainScreenSize_W * 3, MainScreenSize_H - kNavHeight - kVisibleHeight);
    
    
    
    //    UIScrollView *scrollView2 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, MainScreenSize_W * 3, scrollView.height)];
    //    _scrollView2 = scrollView2;
    //    scrollView2.backgroundColor = [UIColor lightGrayColor];
    //    [scrollView addSubview:scrollView2];
    //    scrollView2.delegate = self;
    //    scrollView2.contentSize = CGSizeMake(MainScreenSize_W, scrollView2.height + kShopSimpleInfoHeight);
    
    
    
    
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainScreenSize_W - kShopLeftWidth, kShopSimpleInfoHeight)];
    
    //    UIScrollView *scrollViewCover = [[UIScrollView alloc] initWithFrame:CGRectMake(kShopLeftWidth, 0, MainScreenSize_W - kShopLeftWidth, scrollView.height)];
    //    _scrollViewCover = scrollViewCover;
    //    scrollViewCover.delegate = self;
    //    [scrollView addSubview:scrollViewCover];
    //    scrollViewCover.contentSize = CGSizeMake(MainScreenSize_W - kShopLeftWidth, scrollViewCover.height + kShopSimpleInfoHeight);
    
    
    UIView *headerView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainScreenSize_W - kShopLeftWidth, kShopSimpleInfoHeight + 30)];
    
    MerchantGoodsManager *goodsManager = [[MerchantGoodsManager alloc] initWithFrame:CGRectMake(kShopLeftWidth, 0, MainScreenSize_W - kShopLeftWidth, scrollView.height)];
    //    goodsManager.tableHeaderView = headerView;
    _goodsManager = goodsManager;
    goodsManager.superViewController = self;
    _tableView1 = goodsManager;
    [scrollView addSubview:_tableView1];
    //    goodsManager.bounces = NO;
    goodsManager.tableHeaderView = headerView1;
    //    goodsManager.scrollEnabled = NO;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(kShopLeftWidth, 100, goodsManager.width, 30)];
    _label = label;
    label.backgroundColor = [UIColor darkGrayColor];
    label.font = [UIFont systemFontOfSize:13];
    label.text = @"分类";
    [scrollView addSubview:label];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(kShopLeftWidth + 1, 100 + 1, 1, 1)];
    _theView = view;
    _theView.backgroundColor = [UIColor redColor];
    [scrollView addSubview:view];
    
    
    
    MerchantCommentManager *commentManager = [[MerchantCommentManager alloc] initWithFrame:CGRectMake(MainScreenSize_W, 0, MainScreenSize_W,  scrollView.height)];
    _commentManager = commentManager;
    commentManager.superViewController = self;
    _tableView2 = commentManager;
    [scrollView addSubview:_tableView2];
    commentManager.tableHeaderView = headerView;
    
    
    MerchantInfoManager *InfoManager = [[MerchantInfoManager alloc] initWithFrame:CGRectMake(MainScreenSize_W * 2, 0, MainScreenSize_W,  scrollView.height)];
    _InfoManager = InfoManager;
    _InfoManager.superViewController = self;
    _tableView3 = _InfoManager;
    [scrollView addSubview:_tableView3];
    InfoManager.tableHeaderView = headerView;
    
    
    
    
    MerchantGoodsCatagoryManager *categoryManager = [[MerchantGoodsCatagoryManager alloc] init];
    _categoryManager = categoryManager;
    categoryManager.superViewController = self;
    categoryManager.frame = CGRectMake(0, kShopSimpleInfoHeight, kShopLeftWidth,  scrollView.height - kShopSimpleInfoHeight);
    
    [scrollView addSubview:categoryManager];
    
    
    contentOffset1 = _tableView1.contentOffset.y;
    contentOffset2 = _tableView2.contentOffset.y;
    contentOffset3 = _tableView3.contentOffset.y;
    //    _tableView1.scrollEnabled = NO;
    //    _tableView2.scrollEnabled = NO;
    //    _tableView3.scrollEnabled = NO;
    
    headerRect = CGRectMake(0, kNavHeight, MainScreenSize_W, kShopSimpleInfoHeight + kVisibleHeight);
    
    self.tableHeaderView = [[UIView alloc] initWithFrame:headerRect];
    headerViewY = self.tableHeaderView.y;
    self.tableHeaderView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.tableHeaderView];
    
    
    UIView *buttonBgView = [[UIView alloc] initWithFrame:CGRectMake(0, kShopSimpleInfoHeight, MainScreenSize_W, kVisibleHeight)];
    buttonBgView.backgroundColor = [UIColor whiteColor];
    [self.tableHeaderView addSubview:buttonBgView];
    
    btn1 = [[UIButton alloc]
            initWithFrame:CGRectMake(0, kShopSimpleInfoHeight, (MainScreenSize_W / 3.0), kVisibleHeight)];
    [btn1 setTitle:@"商品" forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [btn1 setBackgroundColor:[UIColor blackColor]];
    
    [self.tableHeaderView  addSubview:btn1];
    
    btn2 = [[UIButton alloc] initWithFrame:CGRectMake((MainScreenSize_W / 3.0), kShopSimpleInfoHeight,
                                                      (MainScreenSize_W / 3.0), kVisibleHeight)];
    [btn2 setTitle:@"评价" forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [btn2 setBackgroundColor:[UIColor blackColor]];
    
    [self.tableHeaderView addSubview:btn2];
    
    btn3 = [[UIButton alloc] initWithFrame:CGRectMake((MainScreenSize_W / 3.0) * 2, kShopSimpleInfoHeight,
                                                      (MainScreenSize_W / 3.0), kVisibleHeight)];
    [btn3 setBackgroundColor:[UIColor blackColor]];
    [btn3 setTitle:@"商家" forState:UIControlStateNormal];
    btn3.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    
    
    [btn1 addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 addTarget:self action:@selector(btn2Click:) forControlEvents:UIControlEventTouchUpInside];
    [btn3 addTarget:self action:@selector(btn3Click:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.tableHeaderView addSubview:btn3];
    _tableHeaderY = self.tableHeaderView.y;
    //    [self.tableHeaderView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld  context:nil];
    _exechangeOff = YES;
}


//- (void)changeOff:(UITableView *)table off:(CGFloat)off {
//    _exechangeOff = NO;
//    if (table == _goodsManager) {
//
//        _commentManager.contentOffset = CGPointMake(0, _commentManager.contentOffset.y - off);
//        _InfoManager.contentOffset = CGPointMake(0, _InfoManager.contentOffset.y - off);
//    }
//
//    if (table == _commentManager) {
//        _goodsManager.contentOffset = CGPointMake(0, _goodsManager.contentOffset.y - off);
//        _InfoManager.contentOffset = CGPointMake(0, _InfoManager.contentOffset.y - off);
//    }
//
//    if (table == _InfoManager) {
//        _goodsManager.contentOffset = CGPointMake(0, _goodsManager.contentOffset.y - off);
//        _commentManager.contentOffset = CGPointMake(0, _commentManager.contentOffset.y - off);
//    }
//
//
//    _exechangeOff = YES;
//}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView == _fatherScroll) {
        
        if (scrollView.contentOffset.x > MainScreenSize_W * 0.5  && scrollView.contentOffset.x <= MainScreenSize_W * 1.5) {
            _selectScrollView = _tableView2;
        } else if (scrollView.contentOffset.x > MainScreenSize_W * 1.5) {
            _selectScrollView = _tableView3;
        } else {
            _selectScrollView = _tableView1;
        }
    }else {
        CGFloat off = 0;
        if (scrollView == _tableView1) {
            off = scrollView.contentOffset.y - contentOffset1;
        } else if (scrollView == _tableView2) {
            off = scrollView.contentOffset.y - contentOffset2;
        } else if (scrollView == _tableView3) {
            off = scrollView.contentOffset.y - contentOffset3;
        }
        
        
        CGRect rect = self.tableHeaderView.frame;
        // 上拉
        //        && scrollView.contentOffset.y > 0
        if (off > 0 ) {
            //            NSLog(@"%f", self.tableHeaderView.y);
            rect.origin.y -= off;
            self.tableHeaderView.frame = rect;
            if (self.tableHeaderView.y <= kNavHeight - kShopSimpleInfoHeight) {
                self.tableHeaderView.y = kNavHeight - kShopSimpleInfoHeight;
            }
        }
        // 下滑
        if (off < 0) {
            if (scrollView.contentOffset.y <= kNavHeight - self.tableHeaderView.y) {
                self.tableHeaderView.y = kNavHeight - scrollView.contentOffset.y;
            }
            else {
                if (self.tableHeaderView.y != kNavHeight - kShopSimpleInfoHeight) {
                    rect.origin.y -= off;
                    //                    NSLog(@"%f", off);
                    self.tableHeaderView.frame = rect;
                    if (self.tableHeaderView.y >= kNavHeight) {
                        self.tableHeaderView.y = kNavHeight;
                    }
                }
            }
        }
        
        
        
        
        CGFloat changeoff = 0;
        
        CGFloat tableSubY = self.tableHeaderView.y - kNavHeight + kShopSimpleInfoHeight;
        _theView.y = tableSubY;
        
        CGPoint point = _theView.frame.origin;
        point.y -= tableSubY;
        CGPoint po = [_theView convertPoint:point toView:_goodsManager];
        NSIndexPath *inx = [_goodsManager indexPathForRowAtPoint:po];
        
//         获取三个切换按钮下面Cell的位置，
        if (inx) {
            UITableViewCell *cell = [_goodsManager cellForRowAtIndexPath:inx];
            if (inx.row == 19) {
                CGRect rect = [cell convertRect:cell.bounds toView:self.fatherScroll];
//                NSLog(@"%@", NSStringFromCGRect(rect));
                if (rect.origin.y >50) {
                    rect.origin.y -= 100;
                }
                if (rect.origin.y <= -14) {
                    changeoff = rect.origin.y + 14;
                }
                
            }
            self.label.text = [NSString stringWithFormat:@"分类%d", (int)inx.section];
        }
        
        _label.y = tableSubY + changeoff;
        
        _categoryManager.frame = CGRectMake(0, tableSubY, kShopLeftWidth, scrollView.height);
        
        _goodsManager.delegate = nil;
        _commentManager.delegate = nil;
        _InfoManager.delegate = nil;
        if (scrollView == _goodsManager) {
            
            _commentManager.contentOffset = CGPointMake(0, _commentManager.contentOffset.y - self.tableHeaderView.y + _tableHeaderY);
            _InfoManager.contentOffset = CGPointMake(0, _InfoManager.contentOffset.y - self.tableHeaderView.y + _tableHeaderY);
        }
        
        if (scrollView == _commentManager) {
            _goodsManager.contentOffset = CGPointMake(0, _goodsManager.contentOffset.y - self.tableHeaderView.y + _tableHeaderY);
            _InfoManager.contentOffset = CGPointMake(0, _InfoManager.contentOffset.y - self.tableHeaderView.y + _tableHeaderY);
        }
        
        if (scrollView == _InfoManager) {
            _goodsManager.contentOffset = CGPointMake(0, _goodsManager.contentOffset.y - self.tableHeaderView.y + _tableHeaderY);
            _commentManager.contentOffset = CGPointMake(0, _commentManager.contentOffset.y - self.tableHeaderView.y + _tableHeaderY);
        }
        _goodsManager.delegate = _goodsManager;
        _commentManager.delegate = _commentManager;
        _InfoManager.delegate = _InfoManager;
        
        _tableHeaderY = self.tableHeaderView.y;
        contentOffset1 = _goodsManager.contentOffset.y;
        contentOffset2 = _commentManager.contentOffset.y;
        contentOffset3 = _InfoManager.contentOffset.y;
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == _fatherScroll) {
        int page = (_fatherScroll.contentOffset.x) / MainScreenSize_W;
        if (page == 1) {
            [self changeState:btn2];
            
        } else {
            if (page == 0) {
                [self changeState:btn1];
                
            } else {
                [self changeState:btn3];
            }
        }
    }
}

- (void)btn1Click:(UIButton *)btn {
    
    
    [self changeState:btn];
    
    [self.fatherScroll scrollRectToVisible:CGRectMake(0, 0, MainScreenSize_W, 1) animated:YES];
}


- (void)btn2Click:(UIButton *)btn {
    
    
    [self changeState:btn];
    
    [self.fatherScroll scrollRectToVisible:CGRectMake(MainScreenSize_W, 0, MainScreenSize_W, 1) animated:YES];
}


- (void)btn3Click:(UIButton *)btn {
    
    
    [self changeState:btn];
    
    [self.fatherScroll scrollRectToVisible:CGRectMake(MainScreenSize_W * 2, 0, MainScreenSize_W, 1) animated:YES];
}

- (void)changeState:(UIButton *)button {
    [btn1 setTitleColor:kColor6 forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn2 setTitleColor:kColor6 forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn3 setTitleColor:kColor6 forState:UIControlStateNormal];
    btn3.titleLabel.font = [UIFont systemFontOfSize:15];
    
    [button setTitleColor:kColor3 forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
