# YLDatePicker
时间选择器(与UIDatePicker的区别是区域之外的时间不显示)

# 希望

- 如果您在使用时发现错误，希望您可以 Issues 我


- 如果您发现使用的功能不够，希望您可以 Issues 我

# 导入

```objective-c
每个项目要求不同,自己把类copy进项目,改成自己想要的样式吧
```

# 使用

```swift
let datePicker = YLDatePicker(currentDate: nil, minLimitDate: Date(), 						maxLimitDate: nil, datePickerType: .YM) { [weak self] (date) in
                self?.navigationItem.title = date.getString(format: "yyyy-MM")
            }
datePicker.show()

----------------------------------------------------------------------------------------

// 显示时间类型
public enum YLDatePickerType:String {
    case YM      // 年月
    case MD      // 月日
    case YMD     // 年月日
    case YMDHm   // 年月日时分
    case MDHm    // 月日时分
    case Hm      // 时分
}

// 默认最小时间
fileprivate var minLimitDate = Date.init(timeIntervalSince1970: TimeInterval(0)) 
// 默认最大时间
fileprivate var maxLimitDate = Date.init(timeIntervalSince1970: TimeInterval(9999999999)) 
// 首次显示时间(currentDate) 不设置默认当前时间

```

