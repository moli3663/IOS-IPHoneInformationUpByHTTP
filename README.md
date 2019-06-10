# IOS-IPHoneInformationUpByHTTP
通过Http GET 协议 上传IPhone 手机相关信息
#///需要引入 libresolv.9.tbd  framework
#///获取网络类型 CoreTelephony.framework
#///引入SystemConfiguration.framework
#IPHoneInfo脚本，引用和了HTTPUsing和GetNetWorkInfo脚本
#GetNetWorkInfo脚本，引用了Apple api Reachaability
如果引入脚本 报错，脚本名'script.h' file not found with <angled> include; use "quotes" instead，将#import <scripts.h> 改为#import 'scripts.h'
