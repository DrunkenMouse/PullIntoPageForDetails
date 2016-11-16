//
//  ADOMenuWebView.m
//  仿淘宝上拉进入详情页
//
//  Created by 王奥东 on 16/11/16.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "ADOMenuWebView.h"

@implementation ADOMenuWebView


-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.delegate = self;
        
        [self loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
        
        
        
    }
    return self;
}


@end
