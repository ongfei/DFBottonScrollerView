//
//  DFButtonScrollView.h
//  SinoCommunity
//
//  Created by df on 2017/7/6.
//  Copyright © 2017年 df. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DFButtonScrollView;
@protocol DFButtonScrollViewDelegate <NSObject>

- (void)dfButtonScrollView:(DFButtonScrollView *)buttonView didSelectItem:(NSInteger)index;

@end
@interface DFButtonScrollView : UIView

@property (nonatomic, weak) id<DFButtonScrollViewDelegate> delegate;

- (void)addContentItems:(NSArray<UIView *> *)items Titles:(NSArray<NSString *> *)titles SelectImages:(NSArray<NSString *> *)selectimages UnSelectImages:(NSArray<NSString *> *)unSelectimages;

@end
