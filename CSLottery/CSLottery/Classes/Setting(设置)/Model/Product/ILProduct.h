//
//  ILProduct.h
//  CSLottery
//
//  Created by niuwan on 15/5/6.
//  Copyright (c) 2015年 niuwan. All rights reserved.
//

#import <Foundation/Foundation.h>
/*数据结构
 {
 "title": "网易电影票",
 "id": "com.netease.movie",
 "url": "http://itunes.apple.com/app/id583784224?mt=8",
 "icon": "movie@2x.png",
 "customUrl": "movieticket163"
 },
 */
@interface ILProduct : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *customUrl;

+ (instancetype)productWithDict:(NSDictionary *)dict;

@end
