//
//  ADOMainViewController.h
//  仿淘宝上拉进入详情页
//
//  Created by 王奥东 on 16/11/16.
//  Copyright © 2016年 王奥东. All rights reserved.

//  参考文章：http://www.jianshu.com/p/876a9b8fd6ac

/**
    首页是一个tableView，通过监听tableView的滚动而进行跳转动画
    能够触发翻页的界限值:tableView整体的高度减去屏幕的高度 再向上偏转50
    
    跳转动画就是tableView往上移动，而后下方的第二个webView页面上移
    
    通过监听webView的偏移，如果向下偏移就提示：下拉，返回详情 
    可以跳转回详情后，提示：释放，返回详情
 
    通过KVO监听webView的scrollView来判断偏移值与跳转时机
    跳转回详情就是将tableView 与 webView的位置进行重置
 */

#import <UIKit/UIKit.h>

@interface ADOMainViewController : UIViewController

@end
