# SlideUpPanel

SlideUpPanel is a custom UIViewController.
This is a designed Show a Slide Up Panel.

![](SlideUpPanel.gif)

### Prerequisites
1. Xcode 9+
2. ios 11.0+
3. swift 4+
4. Cocopods.

## Installing
### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1.0+ is required to build SlideUpPanel.

To integrate SlideUpPanel into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
pod 'SlideUpPanel'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage
``` swift
import SlideUpPanel
```
...
With custom view
``` swift
var cardViewController : SlideUpPanel!
cardViewController = SlideUpPanel(vc: self, cardHeight: nil)
self.addChild(cardViewController)
self.view.addSubview(cardViewController.view)
```
With Viewcontroller
``` swift
var cardViewController : SlideUpPanel!
cardViewController = SlideUpPanel(vc: self, cardHeight: nil)
let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyViewController") as! MyViewController
cardViewController.setViewControllerAsContent(controller: vc)
```
Enable/Diable CornerRadiusAnimation
``` swift
cardViewController.isCornerRadiusAnimatorOn = false

cardViewController.isCornerRadiusAnimatorOn = true
```
Setting initial corner radius 
``` swift
cardViewController.initialCornerRadius = 12
```
## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details



