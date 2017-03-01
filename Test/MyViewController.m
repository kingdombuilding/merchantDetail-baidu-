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

@interface MyViewController () <UIScrollViewDelegate, UITableViewDelegate>

@property (nonatomic, strong) UIView *myView;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIScrollView *tableView;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MyScrollView *scrollView = [[MyScrollView alloc] initWithFrame:CGRectMake(10, 64, 355, 603)];
    _scrollView = scrollView;
    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:scrollView];
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, 1000);
    scrollView.bounces = YES;
    
    MyTableView *tableView = [[MyTableView alloc] initWithFrame:CGRectMake(0, 100, 355, 503)];
    _tableView = tableView;
    tableView.delegate = self;
    tableView.backgroundColor = [UIColor yellowColor];
    tableView.scrollEnabled = NO;
    [scrollView addSubview:tableView];
    
    
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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)pangesture:(UIPanGestureRecognizer *)pan {
    //    NSLog(@"%@", NSStringFromCGPoint([pan translationInView:_myView]));
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == _scrollView) {
        
        if (scrollView.contentOffset.y < 100) {
            _tableView.frame = CGRectMake(0 , 100, 355, 503 + scrollView.contentOffset.y);
            _tableView.contentOffset = CGPointMake(_tableView.contentOffset.x, 0);
        } else {
            _tableView.frame = CGRectMake(0 , scrollView.contentOffset.y, 355, 603);
            _tableView.contentOffset = CGPointMake(_tableView.contentOffset.x, scrollView.contentOffset.y - 100);
        }

        
        
    }
}





@end
