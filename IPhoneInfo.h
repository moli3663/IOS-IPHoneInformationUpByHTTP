//
//  NSObject+IPhoneInfo.h
//  Unity-iPhone
//
//  Created by moli on 2019/5/31.

///需要 在build setting->other link flags 添加 -ObjC
///需要引入 libresolv.9.tbd  framework
///获取网络类型 CoreTelephony.framework
///引入 SystemConfiguration.framework
/// 使用 Reachability.h/m 网络状态脚本（网络状态状态脚本）
///获取广告IDFA  引入iAd.framwork 依赖库 （注释：通过iAd.framwork 依赖库，无法获取IDFA,转用SimulateIDFA.h 类获取）
///并且 实现ASIdentifierManager 类，不然无法通过编译 （报错 arm64）
///引入SimulateIDFA.h 类，生成IDFA 脚本依赖CoreTelephony.framework
#import <Foundation/Foundation.h>
#import <sys/utsname.h>
#import <GetNetWorkInfo.h>
#import <HTTPUsing.h>
#import <AdSupport/AdSupport.h>
#import <SimulateIDFA.h>
NS_ASSUME_NONNULL_BEGIN

@interface  IPhoneInfo : NSObject
///设备信息类单例静态方法
+(IPhoneInfo*) instance_IPhoneInfo;
///将字典 对象想转换成 NSString字符串的方法
+(NSString*)dictionary2jsonNSString:(NSDictionary*)dic ;
///获取设备信息的方法
+(NSString*)getIPhoneInfo;
///上报设备信息的方法
-(Boolean)reportIPhoneInfo:(NSString*)iphoneinfo url:(NSString*)reportUrl;
//获取设备型号
+(NSString *)getCurrentDeviceModel;
///获取设备型UUID
+(NSString *)getDeviceUUID;
///获取设备品牌信息
+(NSString *)getBrand;
///获取设备剩余储存信息
+(NSString *)getMemoryfree;
///获取设备屏幕长度--转像素
+(NSString *)getScreenheight;
///获取设备屏幕宽度--转像素
+(NSString *)getScreenwidth;
///获取设备 网络类型
+(NSString *)getNetType;

///获取设备 设备mac地址
+(NSString*) getMacAdress;
///获取手机IMEI  ios禁止获取imei
+(NSString*) getIMEI;
///获取设备 设备系统版本号
+(NSString *)getRelease;
///获取手机IDFA  ios禁止获取imei ,此处用 IDFA
+(NSString*) getIDFA;
@end



NS_ASSUME_NONNULL_END
