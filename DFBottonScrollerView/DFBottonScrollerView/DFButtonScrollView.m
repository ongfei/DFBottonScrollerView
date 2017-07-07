//
//  DFButtonScrollView.m
//  SinoCommunity
//
//  Created by df on 2017/7/6.
//  Copyright © 2017年 df. All rights reserved.
//

#import "DFButtonScrollView.h"

#import "DFImgAndLableView.h"

#define ScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define ScreenHeight ([[UIScreen mainScreen] bounds].size.height)

#define kTopHeight 60
#define kBaseTag 10000

@interface DFButtonScrollView ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIView *topView;

@property (nonatomic, strong) UIScrollView *bacScrollView;

@property (nonatomic, assign) NSInteger itemsCount;

@property (nonatomic, assign) NSInteger selectIndex;

@property (nonatomic, strong) NSArray *selectImg;

@property (nonatomic, strong) NSArray *unSelectImg;

@end

@implementation DFButtonScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
        
        self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, kTopHeight)];
        
        self.bacScrollView = [[UIScrollView alloc] init];
        
        self.bacScrollView.showsHorizontalScrollIndicator = NO;
        self.bacScrollView.showsVerticalScrollIndicator = NO;
        
        self.bacScrollView.delegate = self;
        
        self.bacScrollView.pagingEnabled = YES;
        
        [self addSubview:self.topView];
        [self addSubview:self.bacScrollView];
        
    }
    
    return self;
}


// 添加内容
- (void)addContentItems:(NSArray<UIView *> *)items Titles:(NSArray<NSString *> *)titles SelectImages:(NSArray<NSString *> *)selectimages UnSelectImages:(NSArray<NSString *> *)unSelectimages {
    if (items.count != titles.count) {
        return;
    }
    
    self.selectImg = selectimages;
    self.unSelectImg = unSelectimages;
    
    self.itemsCount = items.count;
    
    self.bacScrollView.contentSize = CGSizeMake(ScreenWidth * items.count, self.bacScrollView.frame.size.height);
    
    self.bacScrollView.frame = CGRectMake(0, _topView.frame.size.height, ScreenWidth, ScreenHeight - _topView.frame.size.height - 64);
    
    for (int i = 0; i < items.count; i++) {
        
        DFImgAndLableView *imgLabelV = [[DFImgAndLableView alloc] initWithImgDirection:imgDirectionTop andOffset:5 andImgSize:CGSizeMake(35, 30) andTextFont:16 andAlign:(NSTextAlignmentCenter)];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
        
        [imgLabelV addGestureRecognizer:tap];
        
        imgLabelV.frame = CGRectMake((ScreenWidth / (items.count * 1.0)) * i, 0, ScreenWidth / (items.count * 1.0), self.topView.frame.size.height);
        
        imgLabelV.textLabel.text = titles[i];
        
        imgLabelV.imgView.image = [UIImage imageNamed:unSelectimages[i]];
        
        imgLabelV.tag = kBaseTag + i;
        
        [self.topView addSubview:imgLabelV];
        
        items[i].frame = CGRectMake(ScreenWidth * i, 0, ScreenWidth, self.bacScrollView.frame.size.height);
        
        [self.bacScrollView addSubview:items[i]];
    }
    
    DFImgAndLableView *first = [self viewWithTag:kBaseTag];
    
    first.imgView.image = [UIImage imageNamed:[selectimages firstObject]];
}

//点击方法
- (void)tapClick:(UITapGestureRecognizer *)tap {
    
    if (_selectIndex == tap.view.tag - kBaseTag) {
        
        return;
    }
    self.selectIndex = tap.view.tag - kBaseTag;
    
    [self.bacScrollView setContentOffset:CGPointMake(ScreenWidth * (tap.view.tag - kBaseTag), 0) animated:YES];
    
    if ([self.delegate respondsToSelector:@selector(dfButtonScrollView:didSelectItem:)]) {
        [self.delegate dfButtonScrollView:self didSelectItem:self.selectIndex];
    }

}
//图片处理
- (void)setSelectIndex:(NSInteger)selectIndex{
    
    _selectIndex = selectIndex;
    
    for (DFImgAndLableView *v in _topView.subviews) {
        
        if ([v isKindOfClass:[DFImgAndLableView class]]) {
            
            if ((v.tag - kBaseTag) == selectIndex) {
                
                v.imgView.image = [UIImage imageNamed:self.selectImg[selectIndex]];
                
            } else{
                
                v.imgView.image = [UIImage imageNamed:self.unSelectImg[v.tag - kBaseTag]];
                
            }
        }
    }
}

//滑动代理
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    self.selectIndex = (scrollView.contentOffset.x) / ScreenWidth;
}

@end
