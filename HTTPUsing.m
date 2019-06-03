//
//  NSObject+HTTPUsing.m
//  Unity-iPhone
//
//  Created by moli on 2019/5/31.
//

#import "HTTPUsing.h"

@implementation HTTPUsing
//服务器发来的消息
NSMutableData* receiveData;
static HTTPUsing* instance=nil;
+(HTTPUsing*) instamce_HttpUsing{
    static dispatch_once_t predicate=nil;
    dispatch_once( &predicate, ^{
        if (instance==nil) {
            instance=[[HTTPUsing alloc]init];
        }
    });
    return instance;
};
///通过HTTP GET 服务器上传数据
-(void )using_GETHttp:(NSString*)urlNSStr dataNSStr:(NSString*)dataNSString{
    NSString *urlString = [NSString stringWithFormat:@"%@?%@",urlNSStr,dataNSString];
    NSURL* url=[NSURL URLWithString:urlString];
    NSURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url  cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    //第三步，连接服务器
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    NSLog(@"receiveData:%@",receiveData);
};
//接收到服务器回应的时候调用此方法
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
    NSLog(@"收到服务器返回数据：%@",[res allHeaderFields]);
    receiveData = [NSMutableData data];
    
}
//接收到服务器传输数据的时候调用，此方法根据数据大小执行若干次
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receiveData appendData:data];
    NSLog(@"正在接受服务器返回数据。。。");
}
//数据传完之后调用此方法
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *receiveStr = [[NSString alloc]initWithData: receiveData encoding:NSUTF8StringEncoding];
    
    NSLog(@"数据上传完成:%@",receiveStr);
}
//网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法
-(void)connection:(NSURLConnection *)connection
 didFailWithError:(NSError *)error
{
    NSLog(@"数据上传出错：%@",[error localizedDescription]);
}

@end
