//
//  SettingsViewController.swift
//  Racing
//
//  Created by Maryia Dziarkach on 28.04.24.
//

import UIKit
import SnapKit

private extension CGFloat {
    static let buttonsLeftOffset: CGFloat = 40
    static let buttonsRightInset: CGFloat = 40
    static let buttonsHeight: CGFloat = 40
    static let buttonsWidth: CGFloat = 40
}

class SettingsViewController: UIViewController {
    
    
    
    // MARK: - Properties
    
    private let carImagesArray = ["BlackCar", "DarkBlueCar", "GreyCar", "LightBlueCar"]
    private var currentCarIndex = 1
    
    private let obstacleImagesArray = ["Stone", "Tree", "Tumbleweed", "Hole"]
    private var currentObstacleIndex = 1
    
    
    
    private var Press = ""
    
    
//    
//    var selectedCar: String = ""
//    var selectedObstacle: String = ""
    
    
    private let backButton: UIButton = {
        let backButton = UIButton()
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        return backButton
    }()
    
    private let backgroundView: UIImageView = {
        let backgroundView = UIImageView()
        backgroundView.image = UIImage(named: "SettingsBackground")
        return backgroundView
    }()
    
    private let leftCarSwitchButton: UIButton = {
        let leftCarSwitchButton = UIButton()
        leftCarSwitchButton.setTitle("←", for: .normal)
        leftCarSwitchButton.setTitleColor(.black, for: .normal)
        leftCarSwitchButton.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .heavy)
        return leftCarSwitchButton
    }()
    
    private let rightCarSwitchButton: UIButton = {
        let rightCarSwitchButton = UIButton()
        rightCarSwitchButton.setTitle("→", for: .normal)
        rightCarSwitchButton.setTitleColor(.black, for: .normal)
        rightCarSwitchButton.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .heavy)
        return rightCarSwitchButton
    }()
    
    private var selectedCarImage: UIImageView = {
        let selectedCarImage = UIImageView()
        selectedCarImage.image = UIImage(named: "DarkBlueCar")
        return selectedCarImage
    }()
    
    private let leftObstacleSwitchButton: UIButton = {
        let leftObstacleSwitchButton = UIButton()
        leftObstacleSwitchButton.setTitle("←", for: .normal)
        leftObstacleSwitchButton.setTitleColor(.black, for: .normal)
        leftObstacleSwitchButton.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .heavy)
        return leftObstacleSwitchButton
    }()
    
    private let rightObstacleSwitchButton: UIButton = {
        let rightObstacleSwitchButton = UIButton()
        rightObstacleSwitchButton.setTitle("→", for: .normal)
        rightObstacleSwitchButton.setTitleColor(.black, for: .normal)
        rightObstacleSwitchButton.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .heavy)
        return rightObstacleSwitchButton
    }()
    
    private var selectedObstacleImage: UIImageView = {
        let selectedObstacle = UIImageView()
        selectedObstacle.image = UIImage(named: "Box")
        return selectedObstacle
    }()
    
    
    
    private var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        textField.textColor = .systemOrange
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        return textField
    }()
    
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        addBackground()
        addLeftCarSwitchButton()
        addSelectedCarImage()
        addRightCarSwitchButton()
        addSelectedObstacleImage()
        addLeftObstacleSwitchButton()
        addRightObstacleSwitchButton()
        addBackButton()
        addUserNameTextField()
        
    }
    
    private func addBackButton() {
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.left.equalToSuperview().offset(40)
            make.width.equalTo(CGFloat.buttonsHeight)
            make.height.equalTo(CGFloat.buttonsWidth)
        }
        let action = UIAction { _ in
            
            
            
            self.pressedBackButton()
        }
        backButton.addAction(action, for: .touchUpInside)
    }
    
    
    private func addBackground() {
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    private func addLeftCarSwitchButton() {
        view.addSubview(leftCarSwitchButton)
        leftCarSwitchButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.left.equalToSuperview().offset(CGFloat.buttonsLeftOffset) //40
            make.height.equalTo(CGFloat.buttonsHeight) // 40
        }
        let action = UIAction { _ in
            self.switchToPreviousCar()
        }
        leftCarSwitchButton.addAction(action, for: .touchUpInside)
    }
    
    
    private func addSelectedCarImage() {
        view.addSubview(selectedCarImage)
        selectedCarImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.left.equalTo(leftCarSwitchButton.snp.right).offset(80)
            make.centerX.equalToSuperview()
            make.height.equalTo(150)
        }
    }
    
    private func addRightCarSwitchButton() {
        view.addSubview(rightCarSwitchButton)
        rightCarSwitchButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.left.equalTo(selectedCarImage.snp.right).offset(80)
            make.right.equalToSuperview().inset(CGFloat.buttonsRightInset)
            make.height.equalTo(CGFloat.buttonsHeight)
        }
        let action = UIAction { _ in
            self.switchToNextCar()
        }
        rightCarSwitchButton.addAction(action, for: .touchUpInside)
    }
    
    
    private func addSelectedObstacleImage() {
        view.addSubview(selectedObstacleImage)
        selectedObstacleImage.snp.makeConstraints { make in
            //   make.left.equalTo(leftObstacleSwitchButton.snp.right).offset(80)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(130)
            make.width.equalTo(130)
        }
    }
    
    private func addLeftObstacleSwitchButton() {
        view.addSubview(leftObstacleSwitchButton)
        leftObstacleSwitchButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(CGFloat.buttonsLeftOffset) //40
            make.right.equalTo(selectedObstacleImage.snp.left).offset(-50)
            make.height.equalTo(CGFloat.buttonsHeight) // 40
        }
        let action = UIAction { _ in
            self.switchToPreviousObstacle()
        }
        leftObstacleSwitchButton.addAction(action, for: .touchUpInside)
    }
    
    
    
    private func addRightObstacleSwitchButton() {
        view.addSubview(rightObstacleSwitchButton)
        rightObstacleSwitchButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(selectedObstacleImage.snp.right).offset(50)
            make.right.equalToSuperview().inset(CGFloat.buttonsRightInset)
            make.height.equalTo(CGFloat.buttonsHeight) // 40
        }
        let action = UIAction { _ in
            self.switchToNextObstacle()
        }
        rightObstacleSwitchButton.addAction(action, for: .touchUpInside)
    }
    
    private func addUserNameTextField() {
        view.addSubview(userNameTextField)
        userNameTextField.snp.makeConstraints { make in
            make.top.equalTo(selectedObstacleImage.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
    }
    
    
    private func switchToNextCar() {
        let nextCarIndex = (currentCarIndex + 1) % carImagesArray.count
        let nextCarImageView = UIImageView(image: UIImage(named: carImagesArray[nextCarIndex]))
        
        nextCarImageView.frame = selectedCarImage.frame
        nextCarImageView.frame.origin.x = -view.frame.width
        
        view.addSubview(nextCarImageView)
        
        UIView.animate(withDuration: 0.01, animations: {
            nextCarImageView.frame.origin.x = self.selectedCarImage.frame.origin.x
        }, completion: { _ in
            self.selectedCarImage.image = nextCarImageView.image
            nextCarImageView.removeFromSuperview()
        })
        
        currentCarIndex = nextCarIndex
        
        
    }
    
    private func switchToPreviousCar() {
        let previousCarIndex = (currentCarIndex - 1 + carImagesArray.count) % carImagesArray.count
        let previousCarImageView = UIImageView(image: UIImage(named: carImagesArray[previousCarIndex]))
        
        previousCarImageView.frame = selectedCarImage.frame
        previousCarImageView.frame.origin.x = view.frame.width
        
        view.addSubview(previousCarImageView)
        
        UIView.animate(withDuration: 0.01, animations: {
            previousCarImageView.frame.origin.x = self.selectedCarImage.frame.origin.x
        }, completion: { _ in
            self.selectedCarImage.image = previousCarImageView.image
            previousCarImageView.removeFromSuperview()
        })
        
        currentCarIndex = previousCarIndex
        
    }
    
    
    private func switchToNextObstacle() {
        let nextObstacleIndex = (currentObstacleIndex + 1) % obstacleImagesArray.count
        let nextObstacleImageView = UIImageView(image: UIImage(named: obstacleImagesArray[nextObstacleIndex]))
        
        nextObstacleImageView.frame = selectedObstacleImage.frame
        nextObstacleImageView.frame.origin.x = -view.frame.width
        
        view.addSubview(nextObstacleImageView)
        
        UIView.animate(withDuration: 0.01, animations: {
            nextObstacleImageView.frame.origin.x = self.selectedObstacleImage.frame.origin.x
        }, completion: { _ in
            self.selectedObstacleImage.image = nextObstacleImageView.image
            nextObstacleImageView.removeFromSuperview()
        })
        
        currentObstacleIndex = nextObstacleIndex
        
    }
    
    private func switchToPreviousObstacle() {
        let previousObstacleIndex = (currentObstacleIndex - 1 + obstacleImagesArray.count) % obstacleImagesArray.count
        let previousObstacleImageView = UIImageView(image: UIImage(named: obstacleImagesArray[previousObstacleIndex]))
        
        previousObstacleImageView.frame = selectedObstacleImage.frame
        previousObstacleImageView.frame.origin.x = view.frame.width
        
        view.addSubview(previousObstacleImageView)
        
        UIView.animate(withDuration: 0.01, animations: {
            previousObstacleImageView.frame.origin.x = self.selectedObstacleImage.frame.origin.x
        }, completion: { _ in
            self.selectedObstacleImage.image = previousObstacleImageView.image
            previousObstacleImageView.removeFromSuperview()
        })
        
        currentObstacleIndex = previousObstacleIndex
        
    }
    
    private func saveObject(settings: Settings, forKey key: String) {
        let dictionary: [String: Any] = [Keys.currentCarName: settings.currentCarName, Keys.currentObstacleName: settings.currentObstacleName, Keys.userName: settings.userName]
        UserDefaults.standard.set(dictionary, forKey: key)
    }
    
    
    
    private func save() {
        let settingObj = Settings(currentCarName: "1", currentObstacleName: "1", userName: "") // устанавливаю начальные значения
        settingObj.currentCarName = self.carImagesArray[self.currentCarIndex] // устанавливаю имя текущей машинки
        settingObj.currentObstacleName = self.obstacleImagesArray[self.currentObstacleIndex] // устанавливаю имя текущего препятствия
        
        if let userName = userNameTextField.text {
            settingObj.userName = userName // устанавливаю имя в Settings, если оно есть
        }
        
        self.saveObject(settings: settingObj , forKey: "savedData") // сохраняю объект настроек в UserDefaults (settings - значение, forKey - ключ)
    }
    
    // MARK: - Navigation
    
    private func pressedBackButton() {
        self.save()
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    
}
