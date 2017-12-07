
//
//  BaseTableViewController.m
//  ReviewGO
//
//  Created by wjl on 2017/12/7.
//  Copyright © 2017年 wjl. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()


@end

@implementation BaseTableViewController

- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
