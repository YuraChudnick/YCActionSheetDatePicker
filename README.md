# YCActionSheetDatePicker

[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/YCActionSheetDatePicker.svg)](https://img.shields.io/cocoapods/v/YCActionSheetDatePicker.svg)
[![Platform](https://img.shields.io/cocoapods/p/YCActionSheetDatePicker.svg?style=flat)](https://img.shields.io/cocoapods/p/YCActionSheetDatePicker.svg?style=flat)
[![Language](http://img.shields.io/badge/language-Swift-brightgreen.svg?style=flat
)](https://developer.apple.com/swift)

![](https://raw.githubusercontent.com/YuraChudnick/YCActionSheetDatePicker/master/Screenshots/1.jpg)

## Installation
For YCBarcodeReader, use the following entry in your Podfile:

```rb

pod 'YCActionSheetDatePicker'

```

Then run `pod install`.

In any file you'd like to use YCBarcodeReader in, don't forget to import the framework with import YCActionSheetDatePicker.

## Usage

To use this action sheet you need to create YCActionSheetDatePickerVC and set delegate for receive date. Then present created YCActionSheetDatePickerVC. 

```swift
import UIKit
import YCActionSheetDatePicker

class ViewController: UIViewController {

    @IBAction func showDatePicker(_ sender: Any) {
        present(createActionSheetDatePicker(), animated: true, completion: nil)
    }
    
    private func createActionSheetDatePicker() -> YCActionSheetDatePickerVC {
        let vc = YCActionSheetDatePickerVC()
        vc.delegate = self
        return vc
    }
}

extension ViewController: YCActionSheetDatePickerDelegate {
    
    func datePicker(selected date: Date) {
        print(date)
    }
    
}
```

Also you can customize and setup DatePicker, Select Button, Title Label programmatically.

```swift
import UIKit
import YCActionSheetDatePicker

class ViewController: UIViewController {

    @IBAction func showDatePicker(_ sender: Any) {
        present(createActionSheetDatePicker(), animated: true, completion: nil)
    }
    
    private func createActionSheetDatePicker() -> YCActionSheetDatePickerVC {
        let vc = YCActionSheetDatePickerVC()
        vc.datePickerView.contentViewCornerRadius = 10
        vc.datePickerView.contentViewInsets = .zero
        vc.datePickerView.selectButtonCornerRadius = 10
        vc.datePickerView.selectButtonInsets = .zero
        vc.datePickerView.titleLabel.text = "Select date"
        vc.datePickerView.titleLabel.font = UIFont.systemFont(ofSize: 15)
        vc.callback = { [weak self] date in
            print(date)
        }
        return vc
    }
}
```

## Author

YuraChudnick, y.chudnovets@temabit.com

## License

YCActionSheetDatePicker is available under the MIT license. See the LICENSE file for more info.

