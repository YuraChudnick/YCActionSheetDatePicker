//
//  YCDatePickerView.swift
//  YCActionSheetDatePicker
//
//  Created by Yurii Chudnovets on 1/10/19.
//  Copyright © 2019 Yurii Chudnovets. All rights reserved.
//

import UIKit

public class YCDatePickerView: UIView {
    
    var callback: ((Date) -> Void)?
    
    public let selectButton: YCButton = {
        let b = YCButton()
        b.backgroundColor = .orange
        b.titleLabel.text = "Save"
        b.titleLabel.textColor = .white
        return b
    }()
    
    public var selectButtonHeight: CGFloat = 50 {
        didSet {
            selectButtonHeightConstraint.constant = selectButtonHeight
        }
    }
    
    public var selectButtonInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10) {
        didSet {
            selectButtonLeftConstraint.constant = selectButtonInsets.left
            selectButtonRightConstraint.constant = selectButtonInsets.right
            selectButtonBottomConstraint.constant = selectButtonInsets.bottom
        }
    }
    
    public var selectButtonCornerRadius: CGFloat = 25 {
        didSet {
            selectButton.layer.cornerRadius = selectButtonCornerRadius
        }
    }
    
    private var selectButtonHeightConstraint: NSLayoutConstraint!
    private var selectButtonLeftConstraint: NSLayoutConstraint!
    private var selectButtonRightConstraint: NSLayoutConstraint!
    private var selectButtonBottomConstraint: NSLayoutConstraint!
    
    public let contentView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    public var contentViewCornerRadius: CGFloat = 10 {
        didSet {
            contentView.layer.cornerRadius = contentViewCornerRadius
        }
    }
    
    public var contentViewInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10) {
        didSet {
            contentViewLeftConstraint.constant = contentViewInsets.left
            contentViewRightConstraint.constant = contentViewInsets.right
            contentViewTopConstraint.constant = contentViewInsets.top
            contentViewBottomConstraint.constant = contentViewInsets.bottom
        }
    }
    
    private var contentViewLeftConstraint: NSLayoutConstraint!
    private var contentViewRightConstraint: NSLayoutConstraint!
    private var contentViewTopConstraint: NSLayoutConstraint!
    private var contentViewBottomConstraint: NSLayoutConstraint!
    
    public let titleLabel: UILabel = {
        let l = UILabel()
        l.text = "Select date"
        l.textColor = UIColor.darkGray
        l.textAlignment = .center
        return l
    }()
    
    public let datePicker: UIDatePicker = UIDatePicker()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupViews()
    }
    
    fileprivate func setupViews() {
        addSubview(selectButton)
        selectButton.translatesAutoresizingMaskIntoConstraints = false
        selectButton.layer.cornerRadius = selectButtonCornerRadius
        selectButton.layer.masksToBounds = true
        selectButton.addTarget(self, action: #selector(didTapSave(_:)), for: .touchUpInside)
        
        selectButtonHeightConstraint = selectButton.heightAnchor.constraint(equalToConstant: selectButtonHeight)
        selectButtonLeftConstraint = selectButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: selectButtonInsets.left)
        selectButtonRightConstraint = selectButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -selectButtonInsets.right)
        
        if #available(iOS 11.0, *) {
            selectButtonBottomConstraint = selectButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -selectButtonInsets.bottom)
        } else {
            selectButtonBottomConstraint = selectButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -selectButtonInsets.bottom)
        }
        
        NSLayoutConstraint.activate([selectButtonHeightConstraint, selectButtonLeftConstraint, selectButtonRightConstraint, selectButtonBottomConstraint])
        
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.layer.cornerRadius = contentViewCornerRadius
        contentView.layer.masksToBounds = true
        
        contentViewTopConstraint = contentView.topAnchor.constraint(equalTo: topAnchor, constant: contentViewInsets.top)
        contentViewLeftConstraint = contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: contentViewInsets.left)
        contentViewRightConstraint = contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -contentViewInsets.right)
        contentViewBottomConstraint = contentView.bottomAnchor.constraint(equalTo: selectButton.topAnchor, constant: -contentViewInsets.bottom)
        
        NSLayoutConstraint.activate([contentViewTopConstraint, contentViewLeftConstraint, contentViewRightConstraint, contentViewBottomConstraint])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, datePicker])
        stackView.axis = .vertical
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
                                     stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
                                     stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
                                     stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)])
        
    }
    
    @objc private func didTapSave(_ sender: UIButton) {
        callback.map({ $0(datePicker.date) })
    }
    
}
