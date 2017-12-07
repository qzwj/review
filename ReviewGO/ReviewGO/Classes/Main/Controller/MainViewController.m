//
//  MainViewController.m
//  ReviewGO
//
//  Created by wjl on 2017/12/7.
//  Copyright © 2017年 wjl. All rights reserved.
//

#import "MainViewController.h"
#import "BaseModel.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"功能列表";
    self.tableView.tableFooterView = [UIView new];
    self.view.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
    
    [self initData];
}

- (void)initData {
    
    [self.dataSource addObject:[[BaseModel alloc] initWithName:@"联系人列表" className:@"ContactListViewController" modal:NO]];
    [self.dataSource addObject:[[BaseModel alloc] initWithName:@"搜索" className:@"SearchShowViewController" modal:NO]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainCellID" forIndexPath:indexPath]; // Main里面的cell
    BaseModel * model = self.dataSource[indexPath.row];
    cell.textLabel.text = model.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseModel * model = self.dataSource[indexPath.row];
    Class cls = NSClassFromString(model.className);
    UIViewController * vc = [cls new];
    vc.title = model.name;
    if (model.modal) {
        [self presentViewController:vc animated:YES completion:nil];
    }else{
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}


@end
