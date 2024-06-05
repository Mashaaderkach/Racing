//
//  AchievmentsViewController.swift
//  Racing
//
//  Created by Maryia Dziarkach on 28.04.24.
//

import UIKit
import SnapKit

private extension CGFloat {
    static let buttonsLeftOffset: CGFloat = 40
    static let buttonsRightInset: CGFloat = 40
    static let buttonsHeight: CGFloat = 50
    static let buttonsWidth: CGFloat = 80
    static let datePickerHeight: CGFloat = 100
    static let datePickerWidth: CGFloat = 160
    static let textLabelHeight: CGFloat = 100
    static let textLabelWidth: CGFloat = 170
    
}

class AchievmentsViewController: UIViewController {
    
    private let backButton: UIButton = {
        let backButton = UIButton()
        backButton.setTitle("< Back", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        return backButton
    }()
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        return datePicker
    }()
    
    private var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        textLabel.textColor = .black
        textLabel.textAlignment = .center
        return textLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .white
        addBackButton()
        addTextLabel()
        addDatePicker()
    }
    
    private func addBackButton() {
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.left.equalToSuperview().offset(15)
            make.width.equalTo(CGFloat.buttonsWidth)
            make.height.equalTo(CGFloat.buttonsHeight)
        }
        let action = UIAction { _ in
            self.pressedBackButton()
        }
        backButton.addAction(action, for: .touchUpInside)
    }
    
    private func addTextLabel() {
        view.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.centerX.equalToSuperview()
            make.width.equalTo(CGFloat.textLabelWidth)
            make.height.equalTo(CGFloat.textLabelHeight)
        }
    }
    
    private func addDatePicker() {
        view.addSubview(datePicker)
        datePicker.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-40)
            make.centerX.equalToSuperview()
            make.width.equalTo(CGFloat.datePickerWidth)
            make.height.equalTo(CGFloat.datePickerHeight)
        }
        let action = UIAction { _ in
            
        }
        datePicker.addAction(action, for: .touchUpInside)
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd / MMM / yyyy HH:mm"
        let dateString = formatter.string(from: sender.date)
        textLabel.text = dateString
    }
    
    private func pressedBackButton() {
        navigationController?.popToRootViewController(animated: true)
    }
     
}
