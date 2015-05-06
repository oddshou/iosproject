//
//  ILProductCell.m
//  CSLottery
//
//  Created by niuwan on 15/5/6.
//  Copyright (c) 2015年 niuwan. All rights reserved.
//

#import "ILProductCell.h"
#import "ILProduct.h"

@interface ILProductCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *label;

@end


@implementation ILProductCell

- (void)awakeFromNib {
    // Initialization code
    //切圆角
    _imageView.layer.cornerRadius = 10;
    _imageView.clipsToBounds = YES;
}

- (void)setProduct:(ILProduct *)product
{
    _product = product;
    _imageView.image = [UIImage imageNamed:product.icon];
    _label.text = product.title;
}

@end
