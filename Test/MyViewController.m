//
//  MyViewController.m
//  Test
//
//  Created by wang on 2017/2/23.
//  Copyright © 2017年 wang. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *scrollView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 375 * 0.5, 667 - 64)];
    scrollView.contentSize = CGSizeMake(375 * 0.5, 1000);
    [self.view addSubview:scrollView];
    
    scrollView.backgroundColor = [UIColor darkGrayColor];
    scrollView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
    
    UITableView *scrollView2 = [[UITableView alloc] initWithFrame:CGRectMake(375 * 0.5, 64, 375 * 0.5, 667 - 64)];
    scrollView2.contentSize = CGSizeMake(375 * 0.5, 1000);
    [self.view addSubview:scrollView2];
    
    scrollView2.backgroundColor = [UIColor lightGrayColor];
    
    
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture)];
    
    [self.view addGestureRecognizer:pan];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)panGesture {
    NSLog(@"%s", __func__);
}


@end
