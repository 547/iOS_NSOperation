//
//  myImageManager.m
//  SDWebImageTest
//
//  Created by mac on 16/3/1.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "myImageManager.h"
static myImageManager *manager;
@implementation myImageManager
{

    NSOperationQueue *que;
}
+(id)shareMyImageManager
{
@synchronized(self) {
    if (manager == nil) {
        //创建单例类的核心是确保单例类对象在alloc的时候线程安全
        
            //self 在+方法里面表示本类
            //重写alloc方法
            manager =[[self alloc]init];
        
        
    }
    }
    
    return manager;
}
//重写alloc方法-==确保当前对象具有唯一性
+(id)alloc
{
    @synchronized(self) {

    if (manager ==nil) {
        
                   manager=[[super alloc]init];
        
        
    }
        }
    return manager;
}

-(id)init
{
    
    if (self=[super init]) {
        //拓展自己的属性
        //功能：缓存、内存、下载
        _cacheDic=[[NSMutableDictionary alloc]init];//1.缓存初始化
        //2.内存===写入本地
        
        
        
        //3.下载==分线程>自定义operation
        
        que=[[NSOperationQueue alloc]init];
        //设置操作队列的最大并发量
        que.maxConcurrentOperationCount=2;
        
        
    }
    return self;

}
//下载的方法
-(void)downloadImageWithUrl:(NSString *)urlString downloadImage:(UIImageView *)imageView
{

    MyOperation *oper=[MyOperation downloadOnOperationWithUrl:urlString imageView:imageView];
    [que addOperation:oper];//触发operation的Main方法
    
}
@end
