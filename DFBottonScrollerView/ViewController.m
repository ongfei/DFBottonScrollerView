//
//  ViewController.m
//  DFBottonScrollerView
//
//  Created by df on 2017/7/7.
//  Copyright © 2017年 df. All rights reserved.
//

#import "ViewController.h"
#import "DFButtonScrollView.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate,DFButtonScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    DFButtonScrollView *btnScroll = [[DFButtonScrollView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)];
    
    
    btnScroll.delegate = self;
    
    UIView *v1 = [UIView new];
    v1.backgroundColor = [UIColor redColor];
    
    UITableView *v3 = [[UITableView alloc] init];
    v3.delegate = self;
    v3.dataSource = self;
    [v3 registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
    [btnScroll addContentItems:@[v1,v3] Titles:@[@"fuck-she",@"fuck-her"] SelectImages:@[@"赞",@"like_1"] UnSelectImages:@[@"vote",@"like_0"]];
    [self.view addSubview:btnScroll];
}

- (void)dfButtonScrollView:(DFButtonScrollView *)buttonView didSelectItem:(NSInteger)index {
    
    NSLog(@"%ld",index);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld", indexPath.row);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = @"fuck-fuck";
    return cell;
}


@end
