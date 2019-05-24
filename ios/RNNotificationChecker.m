#import "RNNotificationChecker.h"
#import "React/RCTBridge.h"
#import <UserNotifications/UserNotifications.h>

@implementation RNNotificationChecker
- (dispatch_queue_t)methodQueue
{
   return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(isAllowReceiveNotifiction:(RCTResponseSenderBlock)callback)
{
    if ([[[UIDevice currentDevice] systemVersion] doubleValue] >=10.0) { //iOS10以上包含iOS10
        UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
        [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
            if (settings.authorizationStatus == UNAuthorizationStatusNotDetermined){
                //未选择;
                callback([[NSArray alloc] initWithObjects:@(0), nil]);
            }else if (settings.authorizationStatus == UNAuthorizationStatusDenied){
                //未授权;
                callback([[NSArray alloc] initWithObjects:@(0), nil]);
            }else if (settings.authorizationStatus == UNAuthorizationStatusAuthorized){
                //已授权;
                callback([[NSArray alloc] initWithObjects:@(1), nil]);
            }
        }];
    }else if([[[UIDevice currentDevice] systemVersion] doubleValue] >=8.0 && [[[UIDevice currentDevice] systemVersion] doubleValue] <10.0){ // ios8-ios10
        if ([[UIApplication sharedApplication] currentUserNotificationSettings].types  == UIRemoteNotificationTypeNone) {
            callback([[NSArray alloc] initWithObjects:@(0), nil]);
        }else{
            callback([[NSArray alloc] initWithObjects:@(1), nil]);
        }
    }
}

@end
  
