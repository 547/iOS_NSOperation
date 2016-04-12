//
//  NSString+More.m
//  SDWebImageTest
//
//  Created by mac on 16/3/1.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "NSString+More.h"

@implementation NSString (More)
+(NSString *)getMyFilePath:(NSString *)fileName
{
return [NSHomeDirectory()stringByAppendingPathComponent:fileName];
}
-(NSString *)getFilePath:(NSString *)fileName
{
    return [NSHomeDirectory()stringByAppendingPathComponent:fileName];
}
-(NSString *)FilePath:(NSString *)fileName
{
    NSFileManager *file=[NSFileManager defaultManager];
    if ([file fileExistsAtPath:[self getFilePath:fileName]])
    {
        
       [file createDirectoryAtPath:[self getFilePath:fileName] withIntermediateDirectories:YES attributes:nil error:nil];
    }
        return [self getFilePath:fileName];
}
@end
