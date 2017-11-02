//
//  WWHomeViewController.m
//  WWKit
//
//  Created by joyman04 on 2017/9/20.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import "WWHomeViewController.h"
#import "WWHomeCell.h"

@interface WWHomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataSource;

@end

@implementation WWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.tableView];
    
//    WWBaseRequest *api = [[WWBaseRequest alloc]initWithUsername:@"111" password:@"111"];
//    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
//        // 你可以直接在这里使用 self
//        DLog(@"succeed");
//    } failure:^(YTKBaseRequest *request) {
//        // 你可以直接在这里使用 self
//        DLog(@"failed");
//    }];

}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor colorWithHex:@"#f3f3f3"];
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[@"ceshi1",@"ceshi2",@"ceshi3",@"ceshi4",@"ceshi5",@"ceshi6"];
    }
    return _dataSource;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WWHomeCell *cell = [WWHomeCell cellWithTableView:tableView atIndexPath:indexPath];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
