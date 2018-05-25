//
//  GradientColorTool.h
//  GradientImage
//
//  Created by lvjialin on 2018/5/25.
//  Copyright © 2018年 lionnner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GradientColorTool : NSObject

/**
 获取一个颜色数组

 @param startColor 起始颜色
 @param endColor 结束颜色
 @param step 步数
 @return 颜色数组 [[color1,color2,color3],[color4,color5,color6],...]
 */
+ (NSArray *)createWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor step:(NSInteger)step;

@end
