//
//  NSObject+HTTPUsing.h
//  Unity-iPhone
//
//  Created by mac on 2019/5/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTTPUsing : NSObject

+(HTTPUsing*) instamce_HttpUsing;
///通过HTTP GET 服务器上传数据
-(void )using_GETHttp:(NSString*) urlNSStr  dataNSStr:(NSString*)dataNSString;

@end

NS_ASSUME_NONNULL_END
