//
//  MyViewController.m
//  Test
//
//  Created by wang on 2017/2/23.
//  Copyright © 2017年 wang. All rights reserved.
//

#import "MyViewController.h"
#import "MyScrollView.h"
#import "MyTableView.h"

@interface MyViewController () <UIScrollViewDelegate, UITableViewDelegate> {
    CGFloat contentOffy;
}

@property (nonatomic, strong) UIView *myView;


@property (nonatomic, strong) UIScrollView *scrollViewH;


@property (nonatomic, strong) UIScrollView *scrollViewRow;

@property (nonatomic, strong) UIScrollView *tableView1;

@property (nonatomic, strong) UIScrollView *tableView2;

@property (nonatomic, weak) UIView *btnView;

@property (nonatomic, weak) MyTableView *view1;

@property (nonatomic, weak) MyTableView *view2;

@property (nonatomic, weak) MyTableView *view3;

@property (nonatomic, weak) MyTableView *selectTable;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    MyScrollView *scrollViewH = [[MyScrollView alloc] initWithFrame:CGRectMake(0, 64 + 35, 375, 603 - 35)];
    _scrollViewH = scrollViewH;
    scrollViewH.delegate = self;
    scrollViewH.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:scrollViewH];
    scrollViewH.contentSize = CGSizeMake(375, 603 - 35 + 100);
    contentOffy = scrollViewH.contentOffset.y;
    
    MyScrollView *scrollViewRow = [[MyScrollView alloc] initWithFrame:CGRectMake(0, 100, 375, scrollViewH.frame.size.height)];
    _scrollViewRow = scrollViewRow;
    scrollViewRow.delegate = self;
    scrollViewRow.backgroundColor = [UIColor redColor];
    [scrollViewH addSubview:scrollViewRow];
    scrollViewRow.contentSize = CGSizeMake(375 * 3, scrollViewH.frame.size.height);
    //    scrollViewRow.bounces = YES;
    scrollViewRow.pagingEnabled = YES;
    
    
    MyTableView *view1 = [[MyTableView alloc] initWithFrame:CGRectMake(0, 0, 375, scrollViewH.frame.size.height )];
    _selectTable = view1;
    _view1 = view1;
    view1.scrollEnabled = NO;
    view1.backgroundColor = [UIColor brownColor];
    [scrollViewRow addSubview:view1];
    
    MyTableView *view2 = [[MyTableView alloc] initWithFrame:CGRectMake(375, 0, 375, scrollViewH.frame.size.height )];
    _view2 = view2;
    view2.scrollEnabled = NO;
    view2.backgroundColor = [UIColor orangeColor];
    [scrollViewRow addSubview:view2];
    
    MyTableView *view3 = [[MyTableView alloc] initWithFrame:CGRectMake(375 * 2, 0, 375, scrollViewH.frame.size.height )];
    _view3 = view3;
    view3.scrollEnabled = NO;
    view3.backgroundColor = [UIColor blueColor];
    [scrollViewRow addSubview:view3];
    
    
    
    //    MyTableView *tableView1 = [[MyTableView alloc] initWithFrame:CGRectMake(0, 100, 375, 503)];
    //    _tableView1 = tableView1;
    //    tableView1.delegate = self;
    //    tableView1.backgroundColor = [UIColor yellowColor];
    ////    tableView1.scrollEnabled = NO;
    //    [scrollView addSubview:tableView1];
    //
    //
    //    MyTableView *tableView2 = [[MyTableView alloc] initWithFrame:CGRectMake(375, 100, 375, 503)];
    //    _tableView2 = tableView2;
    //    tableView2.delegate = self;
    //    tableView2.backgroundColor = [UIColor blueColor];
    ////    tableView2.scrollEnabled = NO;
    //    [scrollView addSubview:tableView2];
    
    //    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 375 * 3, 603)];
    //    _myView = view;
    //    view.backgroundColor = [UIColor darkGrayColor];
    //    [self.view addSubview:view];
    
    
    //    MyScrollView *scrollView = [[MyScrollView alloc] initWithFrame:CGRectMake(0, 64, 375, 603)];
    //    scrollView.backgroundColor = [UIColor whiteColor];
    //    scrollView.pagingEnabled = YES;
    //    scrollView.contentSize = CGSizeMake(375 * 3, 603);
    //    [self.view addSubview:scrollView];
    //
    //
    //    MyTableView *table1 = [[MyTableView alloc] initWithFrame:CGRectMake(0, 0, 375, 603)];
    //    [scrollView addSubview:table1];
    //
    //    MyTableView *table2 = [[MyTableView alloc] initWithFrame:CGRectMake(375, 0, 375, 603)];
    //    [scrollView addSubview:table2];
    //
    //    MyTableView *table3 = [[MyTableView alloc] initWithFrame:CGRectMake(375 * 2, 0, 375, 603)];
    //    [scrollView addSubview:table3];
    
    //    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pangesture:)];
    //    [view addGestureRecognizer:pan];
    
    
    [self layoutBtnView];
}


- (void)layoutBtnView {
    
    UIView *btnView = [[UIView alloc] initWithFrame:CGRectMake(0,  64 + 100, 375, 35)];
    _btnView = btnView;
    btnView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:btnView];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 375 / 3, 35)];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1 setTitle:@"商品" forState:UIControlStateNormal];
    [btnView addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(375 /3, 0, 375 /3, 35)];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 setTitle:@"评价" forState:UIControlStateNormal];
    [btnView addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(375 /3 * 2, 0, 375 /3, 35)];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3 setTitle:@"商家" forState:UIControlStateNormal];
    [btnView addSubview:btn3];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)pangesture:(UIPanGestureRecognizer *)pan {
    //    NSLog(@"%@", NSStringFromCGPoint([pan translationInView:_myView]));
    
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    //    保存状态
    if (scrollView == _scrollViewRow) {
        
    }
    
}

//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//
//}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //    载入状态
    if (scrollView == _scrollViewRow) {
        if (scrollView.contentOffset.x < 375) {
            _selectTable = _view1;
        } else if (scrollView.contentOffset.x < 375 * 2) {
            _selectTable = _view2;
        } else {
            _selectTable = _view3;
        }
        
        //        if (_selectTable.contentOffset.y <= 0) {
        //            //            _scrollViewH.contentOffset = CGPointMake(_scrollViewH.contentOffset.x, _selectTable.contentOffset.y + 100);
        //            _scrollViewRow.frame = CGRectMake(0 , 100, 375, 603 - 35);
        //        } else {
        //
        //        }
        
        CGRect rect = _btnView.frame;
        CGFloat off = 0;
        if (rect.origin.y >= 64) {
            off = (rect.origin.y - 64);
        }
        _scrollViewH.delegate = nil;
        
        
        if (_selectTable.contentOffset.y <= 0) {
            _scrollViewH.contentOffset = CGPointMake(_scrollViewH.contentOffset.x, 100 - off);
            
        } else {
            _scrollViewH.contentOffset = CGPointMake(_scrollViewH.contentOffset.x, _selectTable.contentOffset.y + 100);
        }
        contentOffy = _scrollViewH.contentOffset.y;
        _scrollViewH.delegate = self;
        //        NSLog(@"%f", _selectTable.contentOffset.y);
        //
        if (_scrollViewH.contentOffset.y <= 100) {
            _scrollViewRow.frame = CGRectMake(0 , 100, 375, 603 - 35);
        } else {
            _scrollViewRow.frame = CGRectMake(0 , _scrollViewH.contentOffset.y + off, 375, 603 - 35);
        }
        
        
        
    }
}
//
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView == _scrollViewH) {
        
        
        CGFloat off = 0;
        off = scrollView.contentOffset.y - contentOffy;
        
        CGRect rect = _btnView.frame;
        CGFloat btnoff = 0;
        if (rect.origin.y >= 64) {
            btnoff = (rect.origin.y - 64);
        }
        
        if (off > 0 ) {
            //            NSLog(@"%f", self.tableHeaderView.y);
            rect.origin.y -= off;
            _btnView.frame = rect;
            if (_btnView.frame.origin.y <= 64) {
                rect.origin.y = 64;
                _btnView.frame = rect;
            }
        }
        // 下滑
        if (off < 0) {
            if (scrollView.contentOffset.y <= 100 + 64 -_btnView.frame.origin.y) {
                rect.origin.y = 100 + 64 - scrollView.contentOffset.y;
                _btnView.frame = rect;
            }
            else {
                if (_btnView.frame.origin.y != 64) {
                    rect.origin.y -= off;
                    _btnView.frame = rect;
                    if (_btnView.frame.origin.y >= 64 + 100) {
                        rect.origin.y = 64 + 100;
                        _btnView.frame = rect;
                    }
                }
            }
        }
        
        
        scrollView.contentSize = CGSizeMake(_selectTable.contentSize.width, _selectTable.contentSize.height + 100);
        
        if (scrollView.contentOffset.y <= 100) {
            
            _selectTable.contentOffset = CGPointMake(_selectTable.contentOffset.x, 0);
            _scrollViewRow.frame = CGRectMake(0 , 100, 375, 603 - 35);
        } else {
            
            _scrollViewRow.frame = CGRectMake(0 , scrollView.contentOffset.y, 375, 603 - 35);
            _selectTable.contentOffset = CGPointMake(_selectTable.contentOffset.x, scrollView.contentOffset.y - 100);
        }
        

        
        contentOffy = scrollView.contentOffset.y;
    } else if (scrollView == _scrollViewRow) {
        if (scrollView.contentOffset.x < 375) {
            _selectTable = _view1;
        } else if (scrollView.contentOffset.x < 375 * 2) {
            _selectTable = _view2;
        } else {
            _selectTable = _view3;
        }
    }
}







@end
