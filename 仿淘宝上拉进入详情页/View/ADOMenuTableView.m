//
//  ADOMenuTableView.m
//  仿淘宝上拉进入详情页
//
//  Created by 王奥东 on 16/11/16.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "ADOMenuTableView.h"


static const NSString * cellReuseIdentifier = @"cell";

@implementation ADOMenuTableView

-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
       
        self.dataSource = self;
        self.rowHeight = 40.f;
        
        UILabel *tableFootLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60)];
        tableFootLabel.text = @"上拉拖动，查看详情页面";
        tableFootLabel.font = [UIFont systemFontOfSize:13.f];
        tableFootLabel.textAlignment = NSTextAlignmentCenter;
        self.tableFooterView = tableFootLabel;

    }
    
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseIdentifier];
    
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseIdentifier];
    }
    
    cell.text =  [NSString stringWithFormat:@"%ld",indexPath.row];
    
    return cell;
}







@end
