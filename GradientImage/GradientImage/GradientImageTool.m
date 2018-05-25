//
//  GradientImageTool.m
//  GradientImage
//
//  Created by lvjialin on 2018/5/25.
//  Copyright © 2018年 lionnner. All rights reserved.
//

#import "GradientImageTool.h"

@implementation GradientImageTool

+ (UIImage *)gradientLinearImageFromColors:(NSArray *)colors withImageSize:(CGSize)size;
{
    UIGraphicsBeginImageContext(size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGFloat _locations[] = {0.f,0.5f,1.f};
    
    NSMutableArray *_colors = [NSMutableArray array];
    
    id fromColor = nil;
    if (colors.count >= 1) {
        fromColor = (__bridge id)[(UIColor *)[colors objectAtIndex:0] CGColor];
    }
    
    id toColor = nil;
    if (colors.count >= 2) {
        toColor = (__bridge id)[(UIColor *)[colors objectAtIndex:1] CGColor];
    }
    
    id endColor = nil;
    if (colors.count == 3) {
        endColor  = (__bridge id)[(UIColor *)[colors objectAtIndex:2] CGColor];
    }
    
    if (fromColor) {
        [_colors addObject:fromColor];
    }
    if (toColor) {
        [_colors addObject:toColor];
    }
    if (endColor) {
        [_colors addObject:endColor];
    }
    
    CGGradientRef gradient =  CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)_colors, _locations);
    
    CGPoint startPoint = CGPointMake(floorf(size.width), 0);
    
    CGPoint endPoint = CGPointMake(floorf(size.width), size.height);
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    
    CFRelease(gradient);
    
    CFRelease(colorSpace);
    
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return gradientImage;
}
@end
