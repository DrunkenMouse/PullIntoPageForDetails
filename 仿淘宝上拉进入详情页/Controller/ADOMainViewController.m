//
//  ADOMainViewController.m
//  仿淘宝上拉进入详情页
//
//  Created by 王奥东 on 16/11/16.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "ADOMainViewController.h"
#import "ADOMenuWebView.h"
#import "ADOMenuTableView.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

@interface ADOMainViewController ()<UIScrollViewDelegate,UITableViewDelegate>

@end

@implementation ADOMainViewController {
    UILabel * _headLabel;//webView顶端 返回详情 的提示文字
    UITableView *_menuTableView;//第一个页面的tableView
    UIWebView *_menuWebView;//第二个页面的WebView
    CGFloat _offSetMax;//最大偏移值
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    
    ADOMenuTableView *menuTableView = [[ADOMenuTableView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH)];
    menuTableView.delegate = self;
    _menuTableView = menuTableView;
    [self.view addSubview:menuTableView];
    
    ADOMenuWebView *menuWebView = [[ADOMenuWebView alloc] initWithFrame:CGRectMake(0, ScreenH, ScreenW, ScreenH)];
   
    menuWebView.scrollView.delegate = self;
    [menuWebView.scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
     _menuWebView = menuWebView;
    [self.view addSubview:menuWebView];
    
    _headLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 40.f)];
    _headLabel.text = @"上拉，返回详情";
    _headLabel.textAlignment = NSTextAlignmentCenter;
    _headLabel.font = [UIFont systemFontOfSize:20];
    _headLabel.alpha = 0.f;
    _headLabel.textColor = [UIColor blueColor];
    [menuWebView addSubview:_headLabel];
    
    [_headLabel bringSubviewToFront:self.view];
    
    _offSetMax = 50;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {

    if (object == _menuWebView.scrollView && [keyPath isEqualToString:@"contentOffset"]) {
        [self headLabelAnimation:[change[@"new"] CGPointValue].y];
    }else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
    
}

-(void)dealloc {
    
    [_menuWebView.scrollView removeObserver:self forKeyPath:@"contentOffset"];
}

-(void)headLabelAnimation:(CGFloat)offSetY {

    _headLabel.alpha = -offSetY / 60;
    _headLabel.center = CGPointMake(ScreenW/2, -offSetY/2.f);
    //已超过临界值，松手就返回上页
    if (-offSetY > _offSetMax) {
        _headLabel.textColor = [UIColor redColor];
        _headLabel.text = @"释放，返回详情";
    }else {
        _headLabel.textColor = [UIColor blueColor];
        _headLabel.text = @"下拉，返回详情";
    }
    
}

#pragma mark - 滚动结束时
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    CGFloat offsetY = scrollView.contentOffset.y;
   
    //如果滚动的是tableView
    if ([scrollView isKindOfClass:[UITableView class]]) {
        //能够触发翻页的界限值:tableView整体的高度减去屏幕的高度
        CGFloat valueNum = _menuTableView.contentSize.height - ScreenH;
        //如果达到界限值再往上偏移50
        if ((offsetY - valueNum) > _offSetMax) {
            [self goToDetailAnimation];//进入图文详情页面
        }
        
    }
    //webView页面的滚动
    else {
        //webView往下偏移超过50
        if (offsetY < 0 && -offsetY > _offSetMax) {
            [self backToFirstPageAnimation];// 返回基本详情界面的动画
        }
    }
    
}

#pragma mark - 进入图文详情页面
-(void)goToDetailAnimation{

    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        _menuWebView.frame = CGRectMake(0, 0, ScreenW, ScreenH);
        _menuTableView.frame = CGRectMake(0, -_menuTableView.frame.size.height, ScreenW, _menuTableView.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
    
}

#pragma mark - 返回基本详情界面的动画
-(void)backToFirstPageAnimation{

    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        _menuTableView.frame  = CGRectMake(0, 0, ScreenW, ScreenH);
        _menuWebView.frame = CGRectMake(0, ScreenH, ScreenW, ScreenH);
    } completion:^(BOOL finished) {
        
    }];
    
}


-(BOOL)prefersStatusBarHidden{
    return YES;
}

@end
