//
//  MyOperation.h
//  SDWebImageTest
//
//  Created by mac on 16/3/1.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MyOperation : NSOperation
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,copy)NSString *url;
//接受和下载需要用到的数据和imageView
+(id)downloadOnOperationWithUrl:(NSString *)urlString imageView:(UIImageView *)ima;
@end
