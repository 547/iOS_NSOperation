//
//  ViewController.m
//  SDWebImageTest
//
//  Created by mac on 16/3/1.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "Base64.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // http://c.hiphotos.baidu.com/image/h%3D300/sign=8ad8896b4a086e0675a8394b32097b5a/023b5bb5c9ea15ce0492f553b0003af33a87b26f.jpg
    /*
     SDWebImage缓存原理：三级缓存
     PS：缓存==数组、字典  内存：沙盒
     
     1.从当前程序的缓存中查找图片；
     2.如果缓存中没有就从内存中加载图片，加载成功后就存入缓存中；
     3.如果内存中也没有就从网络中请求下载图片，请求成功后加载到内存、缓存中；
     
     */
//    [self.image setImageWithURL:[NSURL URLWithString:@"http://c.hiphotos.baidu.com/image/h%3D300/sign=8ad8896b4a086e0675a8394b32097b5a/023b5bb5c9ea15ce0492f553b0003af33a87b26f.jpg"] placeholderImage:nil];
    
    NSLog(@"%@",[@"123323" base64EncodedString]);
    
    //模仿SDWebIamge
    //http://www.bz55.com/uploads/allimg/130803/1-130P3112Q0.jpg
     [self.image setImageWithUrl:@"http://www.bz55.com/uploads/allimg/130803/1-130P3112Q0.jpg" defaultImage:[UIImage imageNamed:@"1.png"]];
  
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
