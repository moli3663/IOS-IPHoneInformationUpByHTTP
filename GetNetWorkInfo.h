//
//  GetNetWorkInfo.h
//  Unity-iPhone
//
//  Created by moli on 2019/5/30.
//
#import <ifaddrs.h>
#import <resolv.h>
#import <arpa/inet.h>
#import <net/if.h>
#import <netdb.h>
#import <netinet/ip.h>
#import <net/ethernet.h>
#import <net/if_dl.h>
#import <Foundation/Foundation.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <Reachability.h>


#define MDNS_PORT       5353
#define QUERY_NAME      "_apple-mobdev2._tcp.local"
#define DUMMY_MAC_ADDR  @"02:00:00:00:00:00"
#define IOS_CELLULAR    @"pdp_ip0"
#define IOS_WIFI        @"en0"
#define IOS_VPN         @"utun0"
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"

NS_ASSUME_NONNULL_BEGIN
///需要引入 libresolv.9.tbd  framework
///获取网络类型 CoreTelephony.framework
///引入 SystemConfiguration.framework
/// 使用 Reachability.h/m 网络状态脚本（网络状态状态脚本）
@interface GetNetWorkInfo :NSObject

+(GetNetWorkInfo*) instance_NetWorkInfo;

///获取设备网络ip
- (NSDictionary *)getIPAddr;
- (BOOL)isValidatIP:(NSString *)ipAddress ;
- (nullable NSString *)getMacAddress ;

//获取网络网络连接类型
+ (NSString *)getNetconnType;
@end

NS_ASSUME_NONNULL_END
