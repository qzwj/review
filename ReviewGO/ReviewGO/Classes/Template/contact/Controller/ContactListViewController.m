//
//  ContactListViewController.m
//  ReviewGO
//
//  Created by wjl on 2017/12/7.
//  Copyright © 2017年 wjl. All rights reserved.
//

#import "ContactListViewController.h"
#import "Person.h"
@interface ContactListViewController ()

@property (nonatomic, strong) NSMutableArray * sectionTitlesArray;

@end

@implementation ContactListViewController

- (NSMutableArray *)sectionTitlesArray
{
    if (!_sectionTitlesArray) {
        _sectionTitlesArray = [NSMutableArray array];
    }
    return _sectionTitlesArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initDataWithCount:20];
}

- (void)initDataWithCount:(int)count {
    
    // 随机获取count个名字
    NSArray *xings = @[@"赵",@"钱",@"孙",@"李",@"周",@"吴",@"郑",@"王",@"冯",@"陈",@"楚",@"卫",@"蒋",@"沈",@"韩",@"杨"];
    NSArray *ming1 = @[@"大",@"美",@"帅",@"应",@"超",@"海",@"江",@"湖",@"春",@"夏",@"秋",@"冬",@"上",@"左",@"有",@"纯"];
    NSArray *ming2 = @[@"强",@"好",@"领",@"亮",@"超",@"华",@"奎",@"海",@"工",@"青",@"红",@"潮",@"兵",@"垂",@"刚",@"山"];
    
    for (int i = 0; i < count; i++) {
        NSString *name = xings[arc4random_uniform((int)xings.count)];
        NSString *ming = ming1[arc4random_uniform((int)ming1.count)];
        name = [name stringByAppendingString:ming];
        if (arc4random_uniform(10) > 3) {
            NSString *ming = ming2[arc4random_uniform((int)ming2.count)];
            name = [name stringByAppendingString:ming];
        }
        Person *model = [Person new];
        model.name = name;
        [self.dataSource addObject:model];
    }
    
    
    UILocalizedIndexedCollation *collation = [UILocalizedIndexedCollation currentCollation];
    NSInteger numberOfSection = [[collation sectionTitles] count]; //27个, 26个字母+其他1个
    NSMutableArray * newSectionArray = [NSMutableArray array];
    for (int i = 0; i < numberOfSection; i++) {
        [newSectionArray addObject:[NSMutableArray array]];
    }
    
    for(Person *p in self.dataSource) {
        NSInteger sectionIndex = [collation sectionForObject:p collationStringSelector:@selector(name)]; //查出每个model所在的位置
        [newSectionArray[sectionIndex] addObject:p];
    }
    
    for(int i = 0; i < numberOfSection; i++){
        NSMutableArray *personSections = newSectionArray[i];
        NSArray *sortPersonSections = [collation sortedArrayFromArray:personSections collationStringSelector:@selector(name)]; //给每个分区里的名字排序
        newSectionArray[i] = sortPersonSections;
    }
    
    NSMutableArray * tempArr = [NSMutableArray array];
    [newSectionArray enumerateObjectsUsingBlock:^(NSArray *  _Nonnull arr, NSUInteger idx, BOOL * _Nonnull stop) {
        if (arr.count == 0) {
            [tempArr addObject:arr];
        }else{ //取有名字的字符标识
            [self.sectionTitlesArray addObject:[[collation sectionTitles] objectAtIndex:idx]];
        }
    }];
    
    [newSectionArray removeObjectsInArray:tempArr]; //移除空的字符数组
    self.dataSource = newSectionArray; // 最后的数据源
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSource[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"contactCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    Person * p = [self.dataSource[indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.text = p.name;
    return cell;
}

// 每个section上header显示的文字
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.sectionTitlesArray[section];
}

// 右边可点击的简略字符
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.sectionTitlesArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
