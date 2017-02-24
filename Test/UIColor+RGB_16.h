//
//  UIColor+RGB_16.h
//  maguanjiaios
//
//  Created by wang on 16/3/17.
//  Copyright © 2016年 cn.com.uzero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (RGB_16)
+ (UIColor *)colorWithHexString: (NSString *)stringToConvert;
+ (UIColor*)colorWithRGB:(NSInteger)R g:(NSInteger)G b:(NSInteger)B;

@end

