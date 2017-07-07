//
//  DFImgAndLableView.h
//  SinoCommunity
//
//  Created by df on 2017/6/30.
//  Copyright © 2017年 df. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    imgDirectionTop,
    imgDirectionLeft,
    imgDirectionBottom,
    imgDirectionRight,
} imgDirection;


struct ImgRate {
    CGFloat ImgRatewidth;
    CGFloat ImgRateheight;
};

typedef struct ImgRate ImgRate;

CG_INLINE ImgRate
ImgRateMake(CGFloat widthRate, CGFloat heightRate)
{
    ImgRate rate;
    rate.ImgRatewidth = widthRate;
    rate.ImgRateheight = heightRate;
    return rate;
}


@interface DFImgAndLableView : UIView

@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, strong) UILabel *textLabel;

- (instancetype)initWithImgDirection:(imgDirection)direction andOffset:(CGFloat)offset andImgRate:(ImgRate)rate andTextFont:(NSInteger)fontNumber andAlign:(NSTextAlignment)align;

- (instancetype)initWithImgDirection:(imgDirection)direction andOffset:(CGFloat)offset andImgSize:(CGSize)size andTextFont:(NSInteger)fontNumber andAlign:(NSTextAlignment)align;

@end
