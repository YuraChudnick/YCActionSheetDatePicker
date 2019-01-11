Pod::Spec.new do |s|

  s.name          = "YCActionSheetDatePicker"
  s.version       = "1.0.0"
  s.summary       = "ActionSheet with DatePciker."

  s.description   = "ActionSheet with DatePciker. Instructions for installation
  are in [the README](https://github.com/YuraChudnick/YCActionSheetDatePicker)."

  s.homepage      = "https://github.com/YuraChudnick/YCActionSheetDatePicker"

  s.license       = { :type => "MIT", :file => "License.md" }

  s.author        = { "Y.Chudnick" => "y.chudnovets@temabit.com" }

  s.platform      = :ios, "10.0"

  s.source        = { :git => "https://github.com/YuraChudnick/YCActionSheetDatePicker.git", :tag => s.version }

  s.source_files  = "YCActionSheetDatePicker", "YCActionSheetDatePicker/*.swift"

  s.swift_version = '4.2'

end
