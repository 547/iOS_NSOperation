//
//  myImageManager.h
//  SDWebImageTest
//
//  Created by mac on 16/3/1.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyOperation.h"
@interface myImageManager : NSObject
@property(nonatomic,strong) NSMutableDictionary *cacheDic;//缓存
@property(nonatomic,copy)NSString *fileName;
+(id)shareMyImageManager;//获取当前管理者对象
-(void)downloadImageWithUrl:(NSString *)urlString downloadImage:(UIImageView *)imageView;//下载方法
@end
