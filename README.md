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
  override func viewDidLoad() {
    super.viewDidLoad()
    let successCallback:(AnyObject!) -> Void = {response in // [1]
      print("initialized OK")
      self.statusLabel.text = "FH init successful"
    }
    let errorCallback: (AnyObject!) -> Void = {response in  // [2]
      if let response = response as? FHResponse {
        print("FH init failed. Error = \(response.rawResponseAsString)")
        self.statusLabel.text = "FH init in error"
      }
    }
    FH.initWithSuccess(successCallback, andFailure: errorCallback)
  }
```
Initialize FH with success [1] and failure [2] callbacks.

