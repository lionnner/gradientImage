//
//  GradientColorTool.m
//  GradientImage
//
//  Created by lvjialin on 2018/5/25.
//  Copyright © 2018年 lionnner. All rights reserved.
//

#import "GradientColorTool.h"

@implementation GradientColorTool

+ (NSArray *)createWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor step:(NSInteger)step
{
    const CGFloat *startColors = CGColorGetComponents(startColor.CGColor);
    const CGFloat *endColors = CGColorGetComponents(endColor.CGColor);
    CGFloat startR = startColors[0];
    CGFloat startG = startColors[1];
    CGFloat startB = startColors[2];
    CGFloat endR = endColors[0];
    CGFloat endG = endColors[1];
    CGFloat endB = endColors[2];
    
    NSInteger colorFissionCount = step*2 + 1;
    CGFloat sR = (endR - startR) / colorFissionCount;
    CGFloat sG = (endG - startG) / colorFissionCount;
    CGFloat sB = (endB - startB) / colorFissionCount;
    
    NSMutableArray *colorFissionArr = [NSMutableArray arrayWithCapacity:0];
    for (NSInteger i = 0; i < colorFissionCount; i++) {
        UIColor *color = [UIColor colorWithRed:(startR+i*sR)/255 green:(startG+i*sG)/255 blue:(startB+i*sB)/255 alpha:1];
        [colorFissionArr addObject:color];
    }
    
    NSMutableArray *colorResultArr = [NSMutableArray arrayWithCapacity:0];
    for (NSInteger i = 1; i < step+1; i++) {
        NSArray *colorSingleArr = @[colorFissionArr[2*i-2],colorFissionArr[2*i-1],colorFissionArr[2*i]];
        [colorResultArr addObject:colorSingleArr];
    }
    return [colorResultArr copy];
}

@end
