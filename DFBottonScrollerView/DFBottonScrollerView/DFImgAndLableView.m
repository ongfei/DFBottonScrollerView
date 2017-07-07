//
//  DFImgAndLableView.m
//  SinoCommunity
//
//  Created by df on 2017/6/30.
//  Copyright © 2017年 df. All rights reserved.
//

#import "DFImgAndLableView.h"
#import <Masonry.h>

typedef enum : NSUInteger {
    CustomWithSize,
    CustomWithRate,
} CustomTpye;

@implementation DFImgAndLableView


- (instancetype)initWithImgDirection:(imgDirection)direction andOffset:(CGFloat)offset andImgRate:(ImgRate)rate andTextFont:(NSInteger)fontNumber andAlign:(NSTextAlignment)align {
    
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self prepareLayoutWithCustomTpye:CustomWithRate ImgDirection:direction andImgSize:CGSizeZero andOffset:offset andImgRate:rate andTextFont:fontNumber andAlign:align];
    }
    
    return self;
}

- (instancetype)initWithImgDirection:(imgDirection)direction andOffset:(CGFloat)offset andImgSize:(CGSize)size andTextFont:(NSInteger)fontNumber andAlign:(NSTextAlignment)align {
    
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self prepareLayoutWithCustomTpye:CustomWithSize ImgDirection:direction andImgSize:size andOffset:offset andImgRate:ImgRateMake(0, 0) andTextFont:fontNumber andAlign:align];
    }
    
    return self;

    
}

- (void)prepareLayoutWithCustomTpye:(CustomTpye)type ImgDirection:(imgDirection)direction andImgSize:(CGSize)size andOffset:(CGFloat)offset andImgRate:(ImgRate)rate andTextFont:(NSInteger)fontNumber andAlign:(NSTextAlignment)align {
    
    self.imgView = [UIImageView new];
    
    [self addSubview:self.imgView];
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        if (type == CustomWithRate) {
            
            make.width.equalTo(self.mas_width).multipliedBy(rate.ImgRatewidth);
            make.height.equalTo(self.mas_height).multipliedBy(rate.ImgRateheight);
            
        }else {
            
            make.width.mas_equalTo(size.width);
            make.height.mas_equalTo(size.height);
            
        }
        
        if (direction == imgDirectionTop || direction == imgDirectionBottom) {
            
            make.centerX.equalTo(self);
            
            if (direction == imgDirectionTop) {
                
                make.centerY.equalTo(self).offset(-offset);
                
            }else {
                
                make.centerY.equalTo(self).offset(-offset);
            }

        }else {
            if (direction == imgDirectionLeft) {
                
                make.centerX.equalTo(self).offset(-offset);
                
            }else {
                
                make.centerX.equalTo(self).offset(offset);
            }
            make.centerY.equalTo(self);
        }
        
    }];
    
    
    self.textLabel = [self CustomWithFontNumber:fontNumber andSuperV:self andIsAuto:YES andInteract:NO andAlign:align];
    
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        switch (direction) {
            case imgDirectionTop: {
             
                make.top.equalTo(self.imgView.mas_bottom);
                make.left.bottom.right.equalTo(self);
                
            }
                break;
            case imgDirectionLeft: {
                
//                make.centerY.equalTo(self.imgView.mas_centerY);
                make.left.equalTo(self.imgView.mas_right);
                make.right.top.bottom.equalTo(self);
                
            }
                break;
            case imgDirectionBottom: {
                
                make.bottom.equalTo(self.imgView.mas_top);
                make.left.top.right.equalTo(self);
                
            }
                break;
            case imgDirectionRight: {
                
//                make.centerY.equalTo(self.imgView.mas_centerY);
                make.right.equalTo(self.imgView.mas_left);
                make.left.top.bottom.equalTo(self);
                
            }
                break;
   
            default:
                break;
        }
    }];
    
    
}

- (UILabel *)CustomWithFontNumber:(NSInteger)fontN andSuperV:(UIView *)sView andIsAuto:(BOOL)isAuto andInteract:(BOOL)interact andAlign:(NSTextAlignment)align {
    
    UILabel *label = [UILabel new];
    
    label.font = [UIFont systemFontOfSize:fontN];
    
    [sView addSubview:label];
    
    if (isAuto) {
        
        label.numberOfLines = 0;
        
    }
    if (interact) {
        label.userInteractionEnabled = YES;
    }
    
    label.textAlignment = align;
    return label;
}

@end
