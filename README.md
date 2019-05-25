
# react-native-notification-checker
Check if notifications are enabled iOS and Android.

## Getting started

`$ npm install react-native-notification-checker --save`

### Mostly automatic installation

`$ react-native link react-native-notification-checker`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-notification-checker` and add `RNNotificationChecker.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNNotificationChecker.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<


#### Android


* Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.p8happ.notificationManager.RNNotificationCheckerPackage;` to the imports at the top of the file
  - Add `new RNNotificationCheckerPackage()` to the list returned by the `getPackages()` method


* In `android/settings.gradle`

```gradle
...
include ':react-native-notification-checker', ':app'
project(':react-native-notification-checker').projectDir = new File(rootProject.projectDir, '../node_modules/react-native-notification-checker/android')
```

* In `android/app/build.gradle`

```gradle
...
dependencies {
    ...
    compile project(':react-native-notification-checker')
}
```

* register module (in MainActivity.java)

On newer versions of React Native (0.18+):

```java
import com.p8happ.notificationManager.RNNotificationCheckerPackage;

public class MainActivity extends ReactActivity {
  ......

  /**
   * A list of packages used by the app. If the app uses additional views
   * or modules besides the default ones, add more packages here.
   */
    @Override
    protected List<ReactPackage> getPackages() {
      return Arrays.<ReactPackage>asList(
        new RNNotificationCheckerPackage() // <------ add here
        new MainReactPackage());
    }
}
```

## Example

### Load module
```javascript
import RNNotificationChecker from 'react-native-notification-checker';
```

```javascript
    const { RNNotificationChecker } = NativeModules;
    RNNotificationChecker.isAllowReceiveNotifiction()
    .then(isAllow => {
       // isAllow true is enabled , false is disabled
    })
    .catch(error => console.log('error check', error))

// ...or an async function
    const enabled = await RNNotificationChecker.isAllowReceiveNotifiction();
```


*Refer with [react-native-check-notification-enable](https://raw.githubusercontent.com/jigaryadav/react-native-check-notification-enable)*

### License

MIT

