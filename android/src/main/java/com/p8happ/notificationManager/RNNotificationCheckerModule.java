
package com.p8happ.notificationManager;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;

import android.support.v4.app.NotificationManagerCompat;

public class RNNotificationCheckerModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public RNNotificationCheckerModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNNotificationChecker";
  }

  @ReactMethod
  public void isAllowReceiveNotifiction(Callback successCallback, Callback errorCallback) {
    try {
      Boolean areEnabled = NotificationManagerCompat.from(getReactApplicationContext()).areNotificationsEnabled();
      successCallback.invoke(areEnabled);
    }catch (Exception e) {
      errorCallback.invoke(e.getMessage());
    }
  }
}