//
//  GradientImageTool.h
//  GradientImage
//
//  Created by lvjialin on 2018/5/25.
//  Copyright © 2018年 lionnner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GradientImageTool : NSObject

+ (UIImage *)gradientLinearImageFromColors:(NSArray *)colors withImageSize:(CGSize)size;

@end
