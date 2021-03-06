//
//  UILabel+TextAttribute.m
//  mall
//
//  Created by YZL on 16/3/22.
//  Copyright © 2016年 HZYuanzhoulvNetwork. All rights reserved.
//

#import "UILabel+TextAttribute.h"

@implementation UILabel (TextAttribute)
/* 设置label带有删除线 **/
- (void)setLabelWithDelLine {
    NSUInteger length = [self.text length];
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:self.text];
    [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, length)];
    [attri addAttribute:NSStrikethroughColorAttributeName value:UIColorFromRGB(0x999999) range:NSMakeRange(2, length-2)];
    [self setAttributedText:attri];
}

/* 设置label带有下划线 **/
- (void)setLabelWithUnderLine {
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self.text];
    NSRange strRange = {0,[str length]};
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    [self setAttributedText:str];
}

/* 删除label带有下划线 **/
- (void)setLabelWithNoUnderLine {
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self.text];
    NSRange strRange = {0,[str length]};
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleNone] range:strRange];
    [self setAttributedText:str];
}

/* 设置label指定位置的文字颜色 **/
- (void)setLabelText:(NSString *)str Color:(UIColor *)color Range:(NSRange)range {
    if ([str isKindOfClass:[NSNull class]]) {
        str = @"";
    }
    NSMutableAttributedString *mutStr = [[NSMutableAttributedString alloc] initWithString:str];
    [mutStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    self.attributedText = mutStr;
}

/* 设置label指定位置的文字颜色(可设置多个位置) **/
- (void)setLabelText:(NSString *)str ColorArr:(NSArray <UIColor *>*)colorArr RangeArr:(NSArray <NSArray *>*)rangeArr {
    if ([str isKindOfClass:[NSNull class]]) {
        str = @"";
    }
    if (colorArr.count == 0 || rangeArr.count == 0 || rangeArr.count != colorArr.count) {
        DLog(@"colorArr或rangeArr为空或传入的颜色和范围数组不相等");
        return;
    }
    NSMutableAttributedString *mutStr = [[NSMutableAttributedString alloc] initWithString:str];
    for (int i = 0; i < colorArr.count; i++) {
        NSRange range = NSMakeRange([rangeArr[i].firstObject integerValue], [rangeArr[i].lastObject integerValue]);
        [mutStr addAttribute:NSForegroundColorAttributeName value:colorArr[i] range:range];
    }
    self.attributedText = mutStr;
}

@end
