//
//  SearchShowViewController.m
//  ReviewGO
//
//  Created by wjl on 2017/12/7.
//  Copyright © 2017年 wjl. All rights reserved.
//

#import "SearchShowViewController.h"
#import "SearchResultViewController.h"
@interface SearchShowViewController ()

@property (nonatomic, strong) UISearchController * searchController;

@end

@implementation SearchShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:[SearchResultViewController new]]; //搜索结果关联的vc
    
    UISearchBar * bar = self.searchController.searchBar;
    self.tableView.tableHeaderView = bar;
    
    // 下面都是调整样式的
    bar.showsBookmarkButton = YES; //右侧的图片
    [bar setImage:[UIImage imageNamed:@"VoiceSearchStartBtn"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
//    [bar setImage:[UIImage imageNamed:@""] forSearchBarIcon:UISearchBarIconResultsList state:UIControlStateNormal];
    
    
    // 调整颜色
    bar.barTintColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
    bar.tintColor = [UIColor colorWithRed:0 green:190/255.0 blue:12/255.0 alpha:1];
    // 调整颜色后去掉线条颜色的影响
    UIImageView *view = [[[bar.subviews objectAtIndex:0] subviews] firstObject];
    view.layer.borderColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1].CGColor;
    view.layer.borderWidth = 1;
    
}

@end
