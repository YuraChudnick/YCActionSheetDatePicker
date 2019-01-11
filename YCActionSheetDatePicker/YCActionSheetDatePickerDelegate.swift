//
//  YCActionSheetDatePickerDelegate.swift
//  YCActionSheetDatePicker
//
//  Created by Yurii Chudnovets on 1/10/19.
//  Copyright © 2019 Yurii Chudnovets. All rights reserved.
//

import Foundation

public protocol YCActionSheetDatePickerDelegate: class {
    
    ///Delegate to handle selected date from DatePicker.
    func datePicker(selected date: Date)
    
}
