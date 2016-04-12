
//
//  UIImageView+More.m
//  SDWebImageTest
//
//  Created by mac on 16/3/1.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "UIImageView+More.h"
#import "NSString+More.h"
#import "Base64.h"
@implementation UIImageView (More)
//拓展一个设置图片的方法==全局的类别方法
-(void)setImageWithUrl:(NSString *)urlString defaultImage:(UIImage *)image
{
    //如果参数1无值得状态下则用默认图defaultImage


    NSFileManager *fi=[NSFileManager defaultManager];
    myImageManager *my=[[myImageManager alloc]init];
    NSString *name= [urlString base64EncodedString];

    my.fileName=[NSString stringWithFormat:@"%@.jpg",name];

    if ([my.cacheDic objectForKey:urlString]!=nil) {
        self.image=[UIImage imageWithData:[my.cacheDic objectForKey:urlString]];
    }else if ([fi fileExistsAtPath:[NSString  getMyFilePath:my.fileName]]){
//        NSLog(@"1---*%@",my.fileName);
    self.image=[UIImage imageWithContentsOfFile:[NSString  getMyFilePath:my.fileName]];
    
    }else{
        [self beforSetImageWithUrl:urlString defaultImage:image];
               if (self.image==nil) {
            self.image=image;
        }
}
}
//私有的类别方法
-(void)beforSetImageWithUrl:(NSString *)urlString defaultImage:(UIImage *)image
{
//处理图片资源 因为要考虑三级缓存 创建管理者来管理缓存顺序是比较好的====管理者是一个单例类==可以访问全局唯一资源的人【同步块，加锁，创建出来后就不要在创建了，直接将对象返回出去】
    myImageManager *manager=[[myImageManager alloc]init];
    [manager downloadImageWithUrl:urlString downloadImage:self];

}
@end
