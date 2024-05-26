//
//  GameViewController.swift
//  Racing
//
//  Created by Maryia Dziarkach on 14.04.24.
//

import UIKit
import SnapKit


class GameViewController: UIViewController {
    
    // MARK: - Properties
    
    private var timer: Timer?
    private var countDownTimer: Double = 3
    private var leftRightMovingDistance: CGFloat = 10
    private var upDownMovingDistance: CGFloat = 10
    private var currentDirection: Direction = .left
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    private var selectedCar: String = ""
    private var selectedObstacle: String = ""
    
    private var currentCarIndex: Int = 0
    private var currentObstacleIndex: Int = 0
    
    
    private var countDownLabel: UILabel = {
        let countDownLabel = UILabel()
        countDownLabel.font = UIFont.systemFont(ofSize: 100, weight: .bold)
        countDownLabel.textColor = .systemOrange
        countDownLabel.textAlignment = .center
        return countDownLabel
    }()
    
    private var mainArea: UIView = {
        let mainArea = UIView()
        mainArea.backgroundColor = .lightGray
        return mainArea
    }()
    
    
    private var mainCar: UIImageView = {
        let mainCar = UIImageView()
        mainCar.image = UIImage(named: "BlackCar")
        return mainCar
    }()
    
    private var whiteCar: UIImageView = {
        let whiteCar = UIImageView()
        whiteCar.image = UIImage(named: "WhiteCar")
        return whiteCar
    }()
    
    private var leftViewBoarder: UIView = {
        let leftViewBoarder = UIView()
        leftViewBoarder.backgroundColor = UIColor(red: 178/255, green: 142/255, blue: 80/255, alpha: 1.0)
        return leftViewBoarder
    }()
    
    private var rightViewBoarder: UIView = {
        let rightViewBoarder = UIView()
        rightViewBoarder.backgroundColor = UIColor(red: 178/255, green: 142/255, blue: 80/255, alpha: 1.0)
        return rightViewBoarder
    }()
    
    private var leftShrubbery: UIImageView = {
        let leftShrubbery = UIImageView()
        leftShrubbery.image = UIImage(named: "Tree")
        return leftShrubbery
    }()
    
    private var rightShrubbery: UIImageView = {
        let rightShrubbery = UIImageView()
        rightShrubbery.image = UIImage(named: "Tree")
        return rightShrubbery
    }()
    
    private var leftStone: UIImageView = {
        let leftStone = UIImageView()
        leftStone.image = UIImage(named: "Stone")
        return leftStone
        
    }()
    
    private var rightStone: UIImageView = {
        let rightStone = UIImageView()
        rightStone.image = UIImage(named: "Stone")
        return rightStone
    }()
    
    private let leftButton: UIButton = {
        let leftButton = UIButton()
        leftButton.setTitle("←", for: .normal)
        leftButton.setTitleColor(.black, for: .normal)
        leftButton.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .heavy)
        return leftButton
    }()
    
    
    private let rightButton: UIButton = {
        let rightButton = UIButton()
        rightButton.setTitle("→", for: .normal)
        rightButton.setTitleColor(.black, for: .normal)
        rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .heavy)
        return rightButton
    }()
    
    private let boomImage: UIImageView = {
        let boomImage = UIImageView()
        boomImage.image = UIImage(named: "Boom")
        return boomImage
    }()
    
    
    enum Direction {
        case left
        case right
    }
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addMainArea()
        addLeftViewBoarder()
        addRightViewBoarder()
        addLeftShrubbery()
        addRightShrubbery()
        addRightStone()
        addLeftStone()
        addLeftButton()
        addRightButton()
        addMainCar()
        addWhiteCar()
        startCountDownTimer()
        loadObject(forKey: "savedData")
       // loadSettings()
    }
    
    
    // MARK: - Custom Methods
    
    
    private func addMainArea() {
        view.addSubview(mainArea)
        mainArea.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().offset(0)
            make.height.equalTo(screenHeight)
        }
        
    }
    
    private func addCountDownTimer() {
        mainArea.addSubview(countDownLabel)
        countDownLabel.snp.makeConstraints { make in
            make.centerY.equalTo(mainArea.snp.centerY)
            make.centerX.equalTo(mainArea.snp.centerX)
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
    }
    
    
    private func addLeftViewBoarder() {
        view.addSubview(leftViewBoarder)
        leftViewBoarder.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(0)
            make.width.equalTo(75)
            make.height.equalTo(screenHeight)
        }
    }
    
    private func addRightViewBoarder() {
        view.addSubview(rightViewBoarder)
        rightViewBoarder.snp.makeConstraints { make in
            make.top.right.equalToSuperview().offset(0)
            make.left.equalTo(leftViewBoarder.snp.right).offset(240)
            make.height.equalTo(screenHeight)
        }
    }
    
    private func addLeftShrubbery() {
        leftViewBoarder.addSubview(leftShrubbery)
        leftShrubbery.snp.makeConstraints { make in
            make.top.equalTo(leftViewBoarder.snp.top).offset(110)
            make.left.right.equalTo(leftViewBoarder).offset(0)
            make.height.equalTo(65)
        }
    }
    
    
    private func addRightShrubbery() {
        rightViewBoarder.addSubview(rightShrubbery)
        rightShrubbery.snp.makeConstraints { make in
            make.top.equalTo(rightViewBoarder.snp.top).offset(370)
            make.left.right.equalTo(rightViewBoarder).offset(0)
            make.height.equalTo(65)
        }
    }
    
    private func addLeftStone() {
        mainArea.addSubview(leftStone)
        leftStone.snp.makeConstraints { make in
            make.bottom.equalTo(mainArea.snp.bottom).offset(-200)
            make.left.equalTo(mainArea.snp.left).offset(100)
            make.width.equalTo(95)
            make.height.equalTo(95)
        }
    }
    
    private func addRightStone() {
        mainArea.addSubview(rightStone)
        rightStone.snp.makeConstraints { make in
            make.top.equalTo(mainArea.snp.top).offset(55)
            make.right.equalTo(mainArea.snp.right).offset(-100)
            make.width.equalTo(95)
            make.height.equalTo(95)
        }
    }
    
    private func addLeftButton() {
        mainArea.addSubview(leftButton)
        leftButton.snp.makeConstraints { make in
            make.left.equalTo(mainArea.snp.left).offset(110)
            make.width.equalTo(40)
            make.height.equalTo(30)
            make.bottom.equalTo(mainArea.snp.bottom).offset(-30)
        }
        let action = UIAction { _ in
            UIView.animate(withDuration: 0.3) {
                self.currentDirection = Direction.left
                self.moveMainCar()
            }
        }
        leftButton.addAction(action, for: .touchUpInside)
    }
    
    private func addRightButton() {
        mainArea.addSubview(rightButton)
        rightButton.snp.makeConstraints { make in
            make.left.equalTo(mainArea.snp.right).offset(-155)
            make.width.equalTo(40)
            make.height.equalTo(30)
            make.bottom.equalTo(mainArea.snp.bottom).offset(-30)
        }
        let action = UIAction { _ in
            UIView.animate(withDuration: 0.3) {
                self.currentDirection = Direction.right
                self.moveMainCar()
            }
        }
        rightButton.addAction(action, for: .touchUpInside)
    }
    
    private func addMainCar() {
        mainArea.addSubview(mainCar)
        mainCar.snp.makeConstraints { make in
            make.left.equalTo(mainArea.snp.right).offset(-180)
            make.bottom.equalTo(mainArea.snp.bottom).offset(-100)
            make.width.equalTo(95)
            make.height.equalTo(175)
            
        }
    }
    
    private func addWhiteCar() {
        mainArea.addSubview(whiteCar)
        whiteCar.snp.makeConstraints { make in
            make.left.equalTo(mainArea.snp.left).offset(100)
            make.width.equalTo(95)
            make.height.equalTo(175)
            make.centerY.equalTo(mainArea.snp.centerY)
        }
    }
    
    
    
    private func moveMainCar() {
        UIView.animate(withDuration: 0.3) {
            switch self.currentDirection {
            case .left:
                self.mainCar.frame.origin.x -= self.leftRightMovingDistance
            case .right:
                self.mainCar.frame.origin.x += self.leftRightMovingDistance
            }
        } completion: { _ in
            if self.mainCar.frame.intersects(self.whiteCar.frame) ||
                self.mainCar.frame.intersects(self.leftStone.frame) ||
                self.mainCar.frame.intersects(self.rightStone.frame) {
                self.showBoomImage()
            }
        }
    }
    
    
    private func startAnimations() {
        moveDownWhiteCar()
        moveDownLeftShrubbery()
        moveDownRightShrubbery()
        moveDownLeftStone()
        moveDownRightStone()
    }
    
    private func moveDownWhiteCar() {
        UIView.animate(withDuration: 0.3) {
            self.whiteCar.frame.origin.y += self.upDownMovingDistance
        } completion: { _ in
            if self.whiteCar.frame.maxY > self.screenHeight {
                self.whiteCar.frame.origin.y = -self.whiteCar.frame.height
            }
            self.moveDownWhiteCar()
        }
    }
    
    
    private func moveDownLeftShrubbery() {
        UIView.animate(withDuration: 0.3) {
            self.leftShrubbery.frame.origin.y += self.upDownMovingDistance
        } completion: { _ in
            if self.leftShrubbery.frame.maxY > self.screenHeight {
                self.leftShrubbery.frame.origin.y = -self.leftShrubbery.frame.height
            }
            self.moveDownLeftShrubbery()
        }
    }
    
    private func moveDownRightShrubbery() {
        UIView.animate(withDuration: 0.3) {
            self.rightShrubbery.frame.origin.y += self.upDownMovingDistance
        } completion: { _ in
            if self.rightShrubbery.frame.maxY > self.screenHeight {
                self.rightShrubbery.frame.origin.y = -self.rightShrubbery.frame.height
            }
            self.moveDownRightShrubbery()
        }
    }
    
    private func moveDownLeftStone() {
        UIView.animate(withDuration: 0.3) {
            self.leftStone.frame.origin.y += self.upDownMovingDistance
        } completion: { _ in
            if self.leftStone.frame.maxY > self.screenHeight {
                self.leftStone.frame.origin.y = -self.leftStone.frame.height
            }
            self.moveDownLeftStone()
        }
        
    }
    
    private func moveDownRightStone() {
        UIView.animate(withDuration: 0.3) {
            self.rightStone.frame.origin.y += self.upDownMovingDistance
        } completion: { _ in
            if self.rightStone.frame.maxY > self.screenHeight {
                self.rightStone.frame.origin.y = -self.rightStone.frame.height
            }
            self.moveDownRightStone()
        }
        
    }
    
    
    
    private func showBoomImage() {
        mainArea.addSubview(boomImage)
        boomImage.snp.makeConstraints { make in
            make.centerY.centerX.equalTo(mainArea)
            make.width.height.equalTo(200)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.boomImage.removeFromSuperview()
        }
        
    }
    
    // MARK: - Timer
    private func startCountDownTimer() {
        addCountDownTimer()
        var countDown = 3
        var isGoDisplayed = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if countDown >= 1 {
                self.countDownLabel.text = "\(countDown)"
                countDown -= 1
            } else {
                if !isGoDisplayed {
                    self.countDownLabel.text = "GO!"
                    isGoDisplayed = true
                } else {
                    timer.invalidate()
                    UIView.animate(withDuration: 0.5, animations: {
                        self.countDownLabel.alpha = 0
                    }) { _ in
                        self.startAnimations()
                    }
                }
            }
        }
        timer?.fire()
    }
    
    // MARK: - UserDefaults
    

    
    func loadObject(forKey key: String) -> Settings? { // загружаю настройки из UserDefaults
        if let dictionary = UserDefaults.standard.dictionary(forKey: key),
           let currentCarName = dictionary[Keys.currentCarName] as? String,
           let currentObstacleName = dictionary[Keys.currentObstacleName] as? String,
           let userName = dictionary[Keys.userName] as? String
        {
            self.mainCar.image = UIImage(named: currentCarName)
            self.leftStone.image = UIImage(named: currentObstacleName)
            self.rightStone.image = UIImage(named: currentObstacleName)
            return Settings(currentCarName: Keys.currentCarName, currentObstacleName: Keys.currentObstacleName, userName: Keys.userName)
        }
        return nil
    }
    }




// MARK: - Navigation






