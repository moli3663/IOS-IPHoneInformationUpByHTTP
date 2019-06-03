//
//  NSObject+IPhoneInfo.m
//  Unity-iPhone
//
//  Created by moli on 2019/5/31.
//

#import "IPhoneInfo.h"





@implementation  IPhoneInfo

static IPhoneInfo* instance=nil;

+(IPhoneInfo*)instance_IPhoneInfo{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (instance==nil) {
           instance =[[IPhoneInfo alloc]init];
        }
    });
    return instance;
};

+(NSString*)dictionary2jsonNSString:(NSDictionary*)dic {
    NSError* parEorror;
    NSData* iphonedata=[NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parEorror];
    NSString* iphoneStr =[[NSString alloc]initWithData:iphonedata encoding:NSUTF8StringEncoding];
    return iphoneStr;
};
///上报设备信息的方法
-(Boolean)reportIPhoneInfo:(NSString*)iphoneinfo url:(NSString*)reportUrl{
    [[HTTPUsing instamce_HttpUsing]using_GETHttp:reportUrl dataNSStr:iphoneinfo];
    NSLog(@"iphoneinfo:%@\n reporturl:%@",iphoneinfo,reportUrl);
    return true;
};
+(NSString*)getIPhoneInfo{
    NSString* info=@"";
    @try {
        NSString* uuid=self.getDeviceUUID;
        NSString* brand=self.getBrand;//品牌
        NSString* model=self.getCurrentDeviceModel;//TODO 手机机型
        NSString* release=self.getRelease;//系统x版本号
        int sdk=0;
        NSString* memoryfree=self.getMemoryfree;
        NSString* screenheight=self.getScreenheight;
        NSString* screenwidth=self.getScreenwidth;
        NSString* networktype=self.getNetType;
        //此处用Mac地址代替IMEI
        NSString* imei=[[GetNetWorkInfo instance_NetWorkInfo] getMacAddress];
        NSString* imsi=@"";
        info=[[NSString alloc]initWithFormat:@"uuid=%@&brand=%@&model=%@&release=%@&sdk=%d&memoryfree=%@&screenheight=%@&screenwidth=%@&networktype=%@&imei=%@&imsi=%@",uuid,brand,model,release,sdk,memoryfree,screenheight,screenwidth,networktype,imei,imsi];
    } @catch (NSException *exception) {
        NSLog(@"获取iphone信息失败：%@",exception);
    } @finally {
        NSLog(@"获取手机信息:%@",info);
    }
    return info;
};
//获取 设备型号
+(NSString *)getCurrentDeviceModel{
    //NSString *deviceModel = [[UIDevice currentDevice] model];
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    //------------------------------iPhone---------------------------
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone2G";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone3G";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone3GS";
    if ([platform isEqualToString:@"iPhone3,1"] ||
        [platform isEqualToString:@"iPhone3,2"] ||
        [platform isEqualToString:@"iPhone3,3"]) return @"iPhone4";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone4S";
    if ([platform isEqualToString:@"iPhone5,1"] ||
        [platform isEqualToString:@"iPhone5,2"]) return @"iPhone5";
    if ([platform isEqualToString:@"iPhone5,3"] ||
        [platform isEqualToString:@"iPhone5,4"]) return @"iPhone5c";
    if ([platform isEqualToString:@"iPhone6,1"] ||
        [platform isEqualToString:@"iPhone6,2"]) return @"iPhone5s";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone6";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone6Plus";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone6sPlus";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhoneSE";
    if ([platform isEqualToString:@"iPhone9,1"] ||
        [platform isEqualToString:@"iPhone9,3"]) return @"iPhone7";
    if ([platform isEqualToString:@"iPhone9,2"] ||
        [platform isEqualToString:@"iPhone9,4"]) return @"iPhone7Plus";
    if ([platform isEqualToString:@"iPhone10,1"] ||
        [platform isEqualToString:@"iPhone10,4"]) return @"iPhone8";
    if ([platform isEqualToString:@"iPhone10,2"] ||
        [platform isEqualToString:@"iPhone10,5"]) return @"iPhone8Plus";
    if ([platform isEqualToString:@"iPhone10,3"] ||
        [platform isEqualToString:@"iPhone10,6"]) return @"iPhoneX";
    if ([platform isEqualToString:@"iPhone11,8"]) return @"iPhoneXR";
    if ([platform isEqualToString:@"iPhone11,2"]) return @"iPhoneXS";
    if ([platform isEqualToString:@"iPhone11,4"] ||
        [platform isEqualToString:@"iPhone11,6"]) return @"iPhoneXSMax";
    
    //------------------------------iPad--------------------------
    if ([platform isEqualToString:@"iPad1,1"]) return @"iPad";
    if ([platform isEqualToString:@"iPad2,1"] ||
        [platform isEqualToString:@"iPad2,2"] ||
        [platform isEqualToString:@"iPad2,3"] ||
        [platform isEqualToString:@"iPad2,4"]) return @"iPad2";
    if ([platform isEqualToString:@"iPad3,1"] ||
        [platform isEqualToString:@"iPad3,2"] ||
        [platform isEqualToString:@"iPad3,3"]) return @"iPad3";
    if ([platform isEqualToString:@"iPad3,4"] ||
        [platform isEqualToString:@"iPad3,5"] ||
        [platform isEqualToString:@"iPad3,6"]) return @"iPad4";
    if ([platform isEqualToString:@"iPad4,1"] ||
        [platform isEqualToString:@"iPad4,2"] ||
        [platform isEqualToString:@"iPad4,3"]) return @"iPadAir";
    if ([platform isEqualToString:@"iPad5,3"] ||
        [platform isEqualToString:@"iPad5,4"]) return @"iPadAir2";
    if ([platform isEqualToString:@"iPad6,3"] ||
        [platform isEqualToString:@"iPad6,4"]) return @"iPadPro9.7-inch";
    if ([platform isEqualToString:@"iPad6,7"] ||
        [platform isEqualToString:@"iPad6,8"]) return @"iPadPro12.9-inch";
    if ([platform isEqualToString:@"iPad6,11"] ||
        [platform isEqualToString:@"iPad6,12"]) return @"iPad5";
    if ([platform isEqualToString:@"iPad7,1"] ||
        [platform isEqualToString:@"iPad7,2"]) return @"iPadPro12.9-inch2";
    if ([platform isEqualToString:@"iPad7,3"] ||
        [platform isEqualToString:@"iPad7,4"]) return @"iPadPro10.5-inch";
    
    //------------------------------iPad Mini-----------------------
    if ([platform isEqualToString:@"iPad2,5"] ||
        [platform isEqualToString:@"iPad2,6"] ||
        [platform isEqualToString:@"iPad2,7"]) return @"iPadmini";
    if ([platform isEqualToString:@"iPad4,4"] ||
        [platform isEqualToString:@"iPad4,5"] ||
        [platform isEqualToString:@"iPad4,6"]) return @"iPadmini 2";
    if ([platform isEqualToString:@"iPad4,7"] ||
        [platform isEqualToString:@"iPad4,8"] ||
        [platform isEqualToString:@"iPad4,9"]) return @"iPadmini 3";
    if ([platform isEqualToString:@"iPad5,1"] ||
        [platform isEqualToString:@"iPad5,2"]) return @"iPadmini 4";
    
    //------------------------------iTouch------------------------
    if ([platform isEqualToString:@"iPod1,1"]) return @"iTouch";
    if ([platform isEqualToString:@"iPod2,1"]) return @"iTouch2";
    if ([platform isEqualToString:@"iPod3,1"]) return @"iTouch3";
    if ([platform isEqualToString:@"iPod4,1"]) return @"iTouch4";
    if ([platform isEqualToString:@"iPod5,1"]) return @"iTouch5";
    if ([platform isEqualToString:@"iPod7,1"]) return @"iTouch6";
    //------------------------------Samulitor-------------------------------------
    if ([platform isEqualToString:@"i386"] ||
        [platform isEqualToString:@"x86_64"]) return @"iPhone Simulator";
    return @"Unknown";
    
};
//获取设备UUID
+(NSString *)getDeviceUUID{
   NSString *deviceUUID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
return deviceUUID;
};
///获取设备品牌信息
+(NSString *)getBrand{
    NSString *deviceModel = [[UIDevice currentDevice] model];
    return deviceModel;
};
///获取手机剩余储存信息
+(NSString *)getMemoryfree{
    /// 总大小 GB
    float totalsize = 0.0;
    /// 剩余大小 MB
    float freesize = 0.0;
    /// 是否登录
    NSError *error = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[paths lastObject] error: &error];
    if (dictionary)
    {
        NSNumber *_free = [dictionary objectForKey:NSFileSystemFreeSize];
        freesize = [_free unsignedLongLongValue]*1.0/(1024);
        
        NSNumber *_total = [dictionary objectForKey:NSFileSystemSize];
        totalsize = [_total unsignedLongLongValue]*1.0/(1024);
    } else
    {
        NSLog(@"Error Obtaining System Memory Info: Domain = %@, Code = %ld", [error domain], (long)[error code]);
    }
    NSLog(@"totalsize = %.3f, freesize = %.2f",totalsize/1024/1024, freesize/1024);
    //向下取整
    int freeInt=floorf(freesize/1024);
    NSString* freeMenboryStr=[NSString stringWithFormat: @"%d",freeInt];
    return freeMenboryStr;
};
///获取手机屏幕长度
+(NSString *)getScreenheight{
    //获取设备的 Scale Factor
    CGFloat  nativeScale=[[UIScreen mainScreen] nativeScale];
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGFloat height = rect.size.height * nativeScale;
    NSString*  rectheight=[NSString stringWithFormat:@"%d",(int)height];
    return rectheight;
};
///获取手机屏幕宽度
+(NSString *)getScreenwidth{
    //获取设备的 Scale Factor
    CGFloat  nativeScale=[[UIScreen mainScreen] nativeScale];
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGFloat width = rect.size.width * nativeScale;
    NSString*  rectWidth=[NSString stringWithFormat:@"%d",(int)width];
    return rectWidth;
};
//获取手机IMEI  ios禁止获取imei ,此处用 mac 地址代替
+(NSString *)getIMEI{
    return [[GetNetWorkInfo instance_NetWorkInfo] getMacAddress];
};
//获取手机系统版本号
+(NSString *)getRelease{
    NSString *systemVersion = [UIDevice currentDevice].systemVersion;
    NSLog(@"当前系统版本号-->%@", systemVersion);
    return systemVersion;
};
//获取网络类型
+ (NSString *)getNetType{
    NSString *network = [GetNetWorkInfo getNetconnType];
    return network;
}
///获取设备 设备mac地址
+(NSString*) getMacAdress {
    return [[GetNetWorkInfo instance_NetWorkInfo] getMacAddress];
}
@end
