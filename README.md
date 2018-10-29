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
Download SlideUpPanel.framwork file from repo and add it in your project in xcode
with "copy if nedded" check mark on.
## Usage
``` swift
import SlideUpPanel
```
...
``` swift
let cardView = CardViewController(frame: self.view.frame, vc: self)
```
With Viewcontroller
``` swift
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController_2") as! ViewController_2
        cardView.setupCard(with: vc)
```
With custom view
``` swift
        cardView.setupCard()
```



## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details



