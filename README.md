# captcha-harvester-ios

[![CI Status](https://img.shields.io/travis/kraj011/captcha-harvester-ios.svg?style=flat)](https://travis-ci.org/kraj011/captcha-harvester-ios)
[![Version](https://img.shields.io/cocoapods/v/captcha-harvester-ios.svg?style=flat)](https://cocoapods.org/pods/captcha-harvester-ios)
[![License](https://img.shields.io/cocoapods/l/captcha-harvester-ios.svg?style=flat)](https://cocoapods.org/pods/captcha-harvester-ios)
[![Platform](https://img.shields.io/cocoapods/p/captcha-harvester-ios.svg?style=flat)](https://cocoapods.org/pods/captcha-harvester-ios)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation

captcha-harvester-ios is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'captcha-harvester-ios'
```

## Usage

To begin, import captcha_harvester_ios and WebKit and create a WebKit View inside your view controller file. In your code where you would like to display the captcha harvester (Leave in view did load function if you are testing) place the following code:
```swift
self.webView.displayCaptcha(sitekey: "YourSitekey", baseUrl: "Base URL For the Captcha", googleLogin: false)
```
This will display captcha and keep on harvesting. If googleLogin is set to true, the user will be prompted to login to google before solving. The WebKit View stores cookies, so when you login once, it will remain auto logged in even if the app is terminated.

Once solve, the tokens are stored in an array within a struct and can be accessed as followed:
```swift
Tokens.tokens
```
the tokens array can be modified to your needs from anywhere in your code.

If you have any questions, feel free to email me (davidkrajewski@yahoo.com) or DM me on twitter (@DynxSZN)!


## Author

David Krajewski, davidkrajewski@yahoo.com

## License

captcha-harvester-ios is available under the MIT license. See the LICENSE file for more info.

## Thanks

Thanks to Peter Soboyejo (@pxtvr) for allowing me to use a snippet of his code while creating this project!
