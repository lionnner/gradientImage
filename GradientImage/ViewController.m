//
//  ViewController.m
//  GradientImage
//
//  Created by lvjialin on 2018/5/25.
//  Copyright © 2018年 lionnner. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerCell.h"
#import "GradientColorTool.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_tableView;
    NSArray *_tableData;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setColorsData];
    [self setSubViews];
    [self updateViewConstraints];
}

- (void)setColorsData
{
    _tableData = [GradientColorTool createWithStartColor:[UIColor colorWithRed:65 green:77 blue:238 alpha:1] endColor:[UIColor colorWithRed:127 green:75 blue:249 alpha:1] step:30];
}

- (void)setSubViews
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    UIView *superView = self.view;
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(superView);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ViewControllerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ViewControllerCell"];
    if (!cell) {
        cell = [[ViewControllerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ViewControllerCell"];
    }
    [cell updateCell:[_tableData objectAtIndex:[indexPath row]]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 25;
}
@end
