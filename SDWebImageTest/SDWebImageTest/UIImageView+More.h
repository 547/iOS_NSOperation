//
//  UIImageView+More.h
//  SDWebImageTest
//
//  Created by mac on 16/3/1.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myImageManager.h"
@interface UIImageView (More)
-(void)setImageWithUrl:(NSString *)urlString defaultImage:(UIImage *)image;
@end
