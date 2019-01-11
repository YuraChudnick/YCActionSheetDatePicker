//
//  YCActionSheetDatePickerVC.swift
//  YCActionSheetDatePicker
//
//  Created by Yurii Chudnovets on 1/10/19.
//  Copyright © 2019 Yurii Chudnovets. All rights reserved.
//

import UIKit

public class YCActionSheetDatePickerVC: UIViewController {
    
    //MARK: - Public properties
    
    /// Delegate to handle selected date.
    public weak var delegate: YCActionSheetDatePickerDelegate?
    
    /// Callback to handle selected date.
    public var callback: ((Date) -> Void)?
    
    /// View with titleLabel, datePicker and selectButton.
    public let datePickerView: YCDatePickerView = {
        let v = YCDatePickerView()
        v.backgroundColor = .clear
        return v
    }()
    
    /// Background color.
    public var backColor: UIColor = UIColor.black.withAlphaComponent(0.5) {
        didSet {
            view.backgroundColor = backColor
        }
    }
    
    private let datePickerViewHeight: CGFloat = 380
    
    //MARK: - Init
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setupPresentationStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupPresentationStyle()
    }
    
    //MARK: - View lifecycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        showDatePickerView()
    }
    
    //MARK: - Setup presentation style
    
    fileprivate func setupPresentationStyle() {
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
    }
    
    //MARK: Setup views
    
    fileprivate func setupViews() {
        view.backgroundColor = backColor
        
        view.addSubview(datePickerView)
        datePickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([datePickerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     datePickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     datePickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     datePickerView.heightAnchor.constraint(equalToConstant: datePickerViewHeight)])
        datePickerView.callback = { [weak self] (selectedDate) in
            guard let `self` = self else { return }
            self.callback.map({ $0(selectedDate) })
            self.delegate.map({ $0.datePicker(selected: selectedDate) })
            self.hideDatePickerView()
        }
    }
    
    //MARK: - Actions
    
    private func showDatePickerView() {
        datePickerView.center.y += datePickerViewHeight
        UIView.animate(withDuration: 0.25, delay: 0.05, options: [.curveEaseOut], animations: {
            self.datePickerView.center.y -= self.datePickerViewHeight
        }, completion: nil)
    }
    
    private func hideDatePickerView() {
        UIView.animate(withDuration: 0.15, delay: 0, options: [.curveEaseIn], animations: {
            self.datePickerView.center.y += self.datePickerViewHeight
        }, completion: { _ in
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view == self.view {
                hideDatePickerView()
            }
        }
    }

}
