//
//  ViewController.swift
//  Racing
//
//  Created by Maryia Dziarkach on 14.04.24.
//

import UIKit
import SnapKit

private extension CGFloat {
    static let buttonsLeftOffset: CGFloat = 90
    static let buttonsRightInset: CGFloat = 90
    static let buttonsHeight: CGFloat = 70
}

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private let backgroundView: UIImageView = {
        let backgroundView = UIImageView()
        backgroundView.image = UIImage(named: "Background")
        return backgroundView
    }()
    
    private let playButton: UIButton = {
        let playButton = UIButton()
        playButton.setTitle("Play", for: .normal)
        playButton.setTitleColor(UIColor(red: 176/255, green: 52/255, blue: 22/255, alpha: 1.0), for: .normal)
        playButton.backgroundColor = UIColor(red: 231/255, green: 187/255, blue: 97/255, alpha: 1.0)
        playButton.titleLabel?.font = UIFont(name: "Chalkboard SE", size: 35)
        return playButton
    }()
    
    private let achievmentsButton: UIButton = {
        let achievmentsButton = UIButton()
        achievmentsButton.setTitle("Achievments", for: .normal)
        achievmentsButton.setTitleColor(UIColor(red: 176/255, green: 52/255, blue: 22/255, alpha: 1.0), for: .normal)
        achievmentsButton.backgroundColor = UIColor(red: 231/255, green: 187/255, blue: 97/255, alpha: 1.0)
        achievmentsButton.titleLabel?.font = UIFont(name: "Chalkboard SE", size: 35)
        return achievmentsButton
    }()
    
    private let settingsButton: UIButton = {
        let settingsButton = UIButton()
        settingsButton.setTitle("Settings", for: .normal)
        settingsButton.setTitleColor(UIColor(red: 176/255, green: 52/255, blue: 22/255, alpha: 1.0), for: .normal)
        settingsButton.backgroundColor = UIColor(red: 231/255, green: 187/255, blue: 97/255, alpha: 1.0)
        settingsButton.titleLabel?.font = UIFont(name: "Chalkboard SE", size: 35)
        return settingsButton
    }()
    
    // MARK: - IBOutlets
    
    
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    private func configureUI() {
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(playButton)
        playButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(250)
            make.left.equalToSuperview().offset(CGFloat.buttonsLeftOffset)
            make.right.equalToSuperview().inset(CGFloat.buttonsRightInset)
            make.height.equalTo(CGFloat.buttonsHeight)
        }
        
        view.addSubview(achievmentsButton)
        achievmentsButton.snp.makeConstraints { make in
            make.top.equalTo(playButton).offset(120)
            make.left.equalToSuperview().offset(CGFloat.buttonsLeftOffset)
            make.right.equalToSuperview().inset(CGFloat.buttonsRightInset)
            make.height.equalTo(CGFloat.buttonsHeight)
        }
        
        view.addSubview(settingsButton)
        settingsButton.snp.makeConstraints { make in
            make.top.equalTo(achievmentsButton).offset(120)
            make.left.equalToSuperview().offset(CGFloat.buttonsLeftOffset)
            make.right.equalToSuperview().inset(CGFloat.buttonsRightInset)
            make.height.equalTo(CGFloat.buttonsHeight)
        }
      
        let playButtonAction = UIAction { _ in
            self.playButtonPressed()
        }
        playButton.addAction(playButtonAction, for: .touchUpInside)
        
        let achievmentsButtonAction = UIAction { _ in
            self.achievmentsButtonPressed()
        }
        achievmentsButton.addAction(achievmentsButtonAction, for: .touchUpInside)
        
        
        let settingsButtonAction = UIAction { _ in
            self.settingsButtonPressed()
        }
        settingsButton.addAction(settingsButtonAction, for: .touchUpInside)
    }
    
    

    
    
    
    
    
    // MARK: - IBActions
    
    
    
    
    
    
    
    
    
    
    // MARK: - Custom Methods
    
    
    
    // MARK: - Navigation
    
    private func playButtonPressed() {
        let controller = GameViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func achievmentsButtonPressed() {
        let controller = AchievmentsViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func settingsButtonPressed() {
        let controller = SettingsViewController()
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
