//
//  ViewController.m
//  XianchengTestAUTO====自动管理的线程NSOperation
//
//  Created by mac on 16/2/26.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //自动管理线程，省去线程开辟、线程管理、线程安全
    
    /*
     使用NSOperation有三种方式：
     前面两种是NSOperation的子类
     1.NSInvocationOperation==调用多线程
     2.NSBlockOperation
     3.自定义Operation子类
     */
//    NSOperation
//    NSBlockOperation
    
    
    
    
    
    
}
//1.NSInvocationOperation
- (IBAction)invocationOperation:(UIButton *)sender {
    
    //PS:使用该operation一定要初始化
    NSInvocationOperation *invocationOperation=[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(InvocationOperation) object:nil];
    //如果使用NSInvocationOperation自己的start方法开启事件的话那么该事件肯定会依附与当前主线程里面，肯定就是在主线。
    //如果想让NSInvocationOperation的事件独处一个分线程中去进行的话可以考虑把对象添加到NSOperationQueue==操作队列
    //NSOperationQueue==操作队列：会把添加到操作队列中的operation对象单独开辟一个分线程来执行（内部封装了GCD）
    NSOperationQueue *queue=[[NSOperationQueue alloc]init];
    [queue addOperation:invocationOperation];//将创建的invocationOperation加到队列中就可以自动开启分线程
//    [invocationOperation start];//开启线程,在主线程执行
    
    
    /*
     步骤：
     1.把想要处理的事件交给operation（operation是一个抽象类）
     2.把operation加入到NSOperationQueue
     3.分线程执行
     
     */
    
}
-(void)InvocationOperation
{

    NSLog(@"=====++++%@",[NSThread isMainThread]?@"主线程":@"分线程");
}



//2.NSBlockOperation
- (IBAction)BlockOperation:(UIButton *)sender {
    
    //NSBlockOperation：block方式的Operation
    NSBlockOperation *blockOperation=[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"==1===++++%@",[NSThread isMainThread]?@"主线程":@"分线程");
    }];
    
    //blockOperation一次可以添加多个事件，开启多个分线程
    [blockOperation addExecutionBlock:^{
        NSLog(@"==2===++++%@",[NSThread isMainThread]?@"主线程":@"分线程");
    }];
    
    
    //将blockOperation添加到NSOperationQueue，在分线程中执行
    NSOperationQueue *que=[[NSOperationQueue alloc]init];
    [que addOperation:blockOperation];
//    [blockOperation start];//开启线程,在主线程执行
    
}

- (IBAction)OperationMyself:(UIButton *)sender {
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
