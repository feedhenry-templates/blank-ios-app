# blank-ios-app 

```blank-ios-app``` iOS Blank app is a simple app to get you started with [fh-ios-sdk](https://github.com/feedhenry/fh-ios-sdk).

|                 | Project Info  |
| --------------- | ------------- |
| License:        | Apache License, Version 2.0  |
| Build:          | Embedded FH.framework  |
| Documentation:  | http://docs.feedhenry.com/v3/dev_tools/sdks/ios.html|

## Build

1. Clone this project

2. Populate ```blank-ios-app/fhconfig.plist``` with your values as explained [here](http://docs.feedhenry.com/v3/dev_tools/sdks/ios.html#ios-configure).

3. open blank-ios-app.xcodeproj

> NOTE: If you clone it manually to make the app buildable in RHMAP Build farm, replace the templating ```%id%``` in ```blank-ios-app\blank-ios-app-Info.plist``` in the following block:
```xml
<key>CFBundleIdentifier</key>
<string>%id%</string>
```

## Example Usage

### FH init

In ```blank-ios-app/ViewController.m``` the synchronization loop is started.
```
- (void)viewDidLoad {
  [super viewDidLoad];
  [FH initWithSuccess:^(FHResponse *response) { // [1]
    NSLog(@"initialized OK");
    self.statusLabel.text = @"FH init successful";
  } AndFailure:^(FHResponse *response) { // [2]
    NSLog(@"initialize fail, %@", response.rawResponseAsString);
    self.statusLabel.text = @"FH init in error";
  }];
}
```
Initialize FH with success [1] and failure [2] callbacks.

### iOS9 and non TLS1.2 backend

If your RHMAP is depoyed without TLS1.2 support, open as source  ```blank-ios-app/blank-ios-app-Info.plist.plist``` uncomment the exception lines:

```
  <!--
  <key>NSAppTransportSecurity</key>
  <dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
  </dict>
   -->
```

