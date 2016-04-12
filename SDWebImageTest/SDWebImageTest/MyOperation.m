
//
//  MyOperation.m
//  SDWebImageTest
//
//  Created by mac on 16/3/1.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "MyOperation.h"
#import "myImageManager.h"
#import "Base64.h"
#import "NSString+More.h"
@implementation MyOperation
-(id)initWithImageUrl:(NSString *)urlString imageView:(UIImageView *)image
{
    if (self==[super init]) {
    
        self.url=urlString;
        self.imageView=image;
    }
    return self;
}
//需要返回operation对象
+(id)downloadOnOperationWithUrl:(NSString *)urlString imageView:(UIImageView *)ima
{
    return [[MyOperation alloc]initWithImageUrl:urlString imageView:ima];
}
-(void)main
{
//通过URl下载
    NSData *da=[NSData dataWithContentsOfURL:[NSURL URLWithString:self.url]];
    
    if (da!=nil) {
        UIImage *im=[UIImage imageWithData:da];
        [self performSelectorOnMainThread:@selector(downloadIsOk:) withObject:im waitUntilDone:YES];
        //缓存
        myImageManager *manager=[myImageManager shareMyImageManager];
        //key设置成URl，将图片用data的形式存储
        [manager.cacheDic setObject:da forKey:self.url];
//        manager.fileName=@"image.jpg";
        NSLog(@"2---*%@",manager.fileName);
        //内存== 文件名一定活的===document/cache/xx
       NSString *filePath= [@"112" FilePath:manager.fileName];
        [da writeToFile:filePath atomically:YES];
        
    }
    
    

}

//下载完成的时候调用===刷新UI
-(void)downloadIsOk:(UIImage *)image
{
    self.imageView.image=image;

}
@end
