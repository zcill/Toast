# Toast

![License MIT](https://img.shields.io/github/license/mashape/apistatus.svg)
![Language](https://img.shields.io/badge/language-Swift-orange.svg)
![Platform info](https://img.shields.io/badge/platform-iOS-5CC9F5.svg)

## Description

A lightwight toast view.

## Screenshot

模仿字里行间的Toast

![](/Users/zj-db0634/Desktop/meitu/自我学习/Toast/ScreenShots/zi.png)

|![](/Users/zj-db0634/Desktop/meitu/自我学习/Toast/ScreenShots/success.png)|![](/Users/zj-db0634/Desktop/meitu/自我学习/Toast/ScreenShots/warning.png)|![](/Users/zj-db0634/Desktop/meitu/自我学习/Toast/ScreenShots/error.png)|
|:-:|:-:|:-:|:-:|


![](/Users/zj-db0634/Desktop/meitu/自我学习/Toast/ScreenShots/Toast.gif)

## Installation

### Requirement

iOS 8.0 and above.

### Manual

Dragging `Toast.swift` to your project.

## Usage
<!--
### Interface Builder

1. Create a `NSButton`
2. Set its `Button Style` to `Square` in order to change the button's height
3. Set its `Button Class` to `SYFlatButton`
4. Config the styles from the inspector

![](https://raw.githubusercontent.com/Sunnyyoung/SYFlatButton/master/Screenshot/InterfaceBuilder.png)-->

### Programmatically

See more customizable style from `Toast.swift`

```swift
Toast.show(type: .success, message: "设置成功~ ")
```

## License
The [MIT License](LICENSE).
