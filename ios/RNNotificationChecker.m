#import "RNNotificationChecker.h"
#import "React/RCTBridge.h"
#import <UserNotifications/UserNotifications.h>

@implementation RNNotificationChecker
- (dispatch_queue_t)methodQueue
{
   return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(isAllowReceiveNotifiction:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
  if ([[[UIDevice currentDevice] systemVersion] doubleValue] >=10.0) { //iOS10以上包含iOS10
    UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
    [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
      if (settings.authorizationStatus == UNAuthorizationStatusNotDetermined){
        //未选择;
        resolve(@(false));
      }else if (settings.authorizationStatus == UNAuthorizationStatusDenied){
        //未授权;
        resolve(@(false));
      }else if (settings.authorizationStatus == UNAuthorizationStatusAuthorized){
        //已授权;
        resolve(@(true));
      }
    }];
  }else if([[[UIDevice currentDevice] systemVersion] doubleValue] >=8.0 && [[[UIDevice currentDevice] systemVersion] doubleValue] <10.0){ // ios8-ios10
    if ([[UIApplication sharedApplication] currentUserNotificationSettings].types  == UIRemoteNotificationTypeNone) {
      resolve(@(false));
    }else{
      resolve(@(true));
    }
  }
}

@end
  
