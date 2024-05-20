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
}

class SettingsViewController: UIViewController {
    
    // MARK: - Properties
    
    private let carImagesArray = ["BlackCar", "DarkBlueCar", "GreyCar", "LightBlueCar"]
    private var currentCarIndex = 1
    
    private let obstacleImagesArray = ["Stone", "Tree", "Tumbleweed", "Hole"]
    private var currentObstacleIndex = 1
    
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
    
    
    
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // navigationItem.hidesBackButton = true
        addBackground()
        addLeftCarSwitchButton()
        addSelectedCarImage()
        addRightCarSwitchButton()
        addSelectedObstacleImage()
        addLeftObstacleSwitchButton()
        addRightObstacleSwitchButton()
        
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
    
    
    
    private func switchToNextCar() {
        let nextIndex = (currentCarIndex + 1) % carImagesArray.count
        let nextCarImageView = UIImageView(image: UIImage(named: carImagesArray[nextIndex]))
        
        nextCarImageView.frame = selectedCarImage.frame
        nextCarImageView.frame.origin.x = -view.frame.width
        
        view.addSubview(nextCarImageView)
        
        UIView.animate(withDuration: 0.2, animations: {
            nextCarImageView.frame.origin.x = self.selectedCarImage.frame.origin.x
        }, completion: { _ in
            self.selectedCarImage.image = nextCarImageView.image
            nextCarImageView.removeFromSuperview()
        })
        
        currentCarIndex = nextIndex
    }
    
    private func switchToPreviousCar() {
        let previousIndex = (currentCarIndex - 1 + carImagesArray.count) % carImagesArray.count
        let previousCarImageView = UIImageView(image: UIImage(named: carImagesArray[previousIndex]))
        
        previousCarImageView.frame = selectedCarImage.frame
        previousCarImageView.frame.origin.x = view.frame.width
        
        view.addSubview(previousCarImageView)
        
        UIView.animate(withDuration: 0.2, animations: {
            previousCarImageView.frame.origin.x = self.selectedCarImage.frame.origin.x
        }, completion: { _ in
            self.selectedCarImage.image = previousCarImageView.image
            previousCarImageView.removeFromSuperview()
        })
        
        currentCarIndex = previousIndex
    }
    
    
    private func switchToNextObstacle() {
        let nextIndex = (currentObstacleIndex + 1) % obstacleImagesArray.count
        let nextObstacleImageView = UIImageView(image: UIImage(named: obstacleImagesArray[nextIndex]))
        
        nextObstacleImageView.frame = selectedObstacleImage.frame
        nextObstacleImageView.frame.origin.x = -view.frame.width
        
        view.addSubview(nextObstacleImageView)
        
        UIView.animate(withDuration: 0.2, animations: {
            nextObstacleImageView.frame.origin.x = self.selectedObstacleImage.frame.origin.x
        }, completion: { _ in
            self.selectedObstacleImage.image = nextObstacleImageView.image
            nextObstacleImageView.removeFromSuperview()
        })
        
        currentObstacleIndex = nextIndex
    }
    
    private func switchToPreviousObstacle() {
        let previousIndex = (currentObstacleIndex - 1 + obstacleImagesArray.count) % obstacleImagesArray.count
        let previousObstacleImageView = UIImageView(image: UIImage(named: obstacleImagesArray[previousIndex]))
        
        previousObstacleImageView.frame = selectedObstacleImage.frame
        previousObstacleImageView.frame.origin.x = view.frame.width
        
        view.addSubview(previousObstacleImageView)
        
        UIView.animate(withDuration: 0.2, animations: {
            previousObstacleImageView.frame.origin.x = self.selectedObstacleImage.frame.origin.x
        }, completion: { _ in
            self.selectedObstacleImage.image = previousObstacleImageView.image
            previousObstacleImageView.removeFromSuperview()
        })
        
        currentObstacleIndex = previousIndex
    }
    
    
    
    
    
    
    
}








// MARK: - Navigation





