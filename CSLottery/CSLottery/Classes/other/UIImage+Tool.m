//
//  UIImage+Tool.m
//  CSLottery
//
//  Created by niuwan on 15/5/5.
//  Copyright (c) 2015年 niuwan. All rights reserved.
//

#import "UIImage+Tool.h"

@implementation UIImage (Tool)

+ (instancetype)imageWithResizableImageName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    return  image;
}

@end
