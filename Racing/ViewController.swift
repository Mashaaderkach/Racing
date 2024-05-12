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
        //        playButton.setTitle("Play", for: .normal)
        //        playButton.setTitleColor(UIColor(red: 176/255, green: 52/255, blue: 22/255, alpha: 1.0), for: .normal)
        playButton.backgroundColor = UIColor(red: 231/255, green: 187/255, blue: 97/255, alpha: 1.0)
        //        playButton.titleLabel?.font = UIFont(name: "Chalkboard SE", size: 35)
        playButton.layer.cornerRadius = 10
        return playButton
    }()
    
    private let achievmentsButton: UIButton = {
        let achievmentsButton = UIButton()
        //        achievmentsButton.setTitle("Achievments", for: .normal)
        //        achievmentsButton.setTitleColor(UIColor(red: 176/255, green: 52/255, blue: 22/255, alpha: 1.0), for: .normal)
        achievmentsButton.backgroundColor = UIColor(red: 231/255, green: 187/255, blue: 97/255, alpha: 1.0)
        //  achievmentsButton.titleLabel?.font = UIFont(name: "Chalkboard SE", size: 35)
        achievmentsButton.layer.cornerRadius = 10
        return achievmentsButton
    }()
    
    private let settingsButton: UIButton = {
        let settingsButton = UIButton()
        //        settingsButton.setTitle("Settings", for: .normal)
        //        settingsButton.setTitleColor(UIColor(red: 176/255, green: 52/255, blue: 22/255, alpha: 1.0), for: .normal)
        settingsButton.backgroundColor = UIColor(red: 231/255, green: 187/255, blue: 97/255, alpha: 1.0)
        // settingsButton.titleLabel?.font = UIFont(name: "Chalkboard SE", size: 35)
        settingsButton.layer.cornerRadius = 10
        return settingsButton
    }()
    
    // MARK: - IBOutlets
    
    
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsTextFont()
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
            self.playButtonPressed()
        }
        achievmentsButton.addAction(achievmentsButtonAction, for: .touchUpInside)
        
        
        let settingsButtonAction = UIAction { _ in
            self.settingsButtonPressed()
        }
        settingsButton.addAction(settingsButtonAction, for: .touchUpInside)
    }
    
    
    private func buttonsTextFont() {
        
        let shadow = NSShadow()
        shadow.shadowBlurRadius = 5
        shadow.shadowOffset = CGSize(width: 1, height: 1)
        shadow.shadowColor = UIColor.systemBrown
        
        
        let playButtonText = "Play"
        let playButtonAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 176/255, green: 52/255, blue: 22/255, alpha: 1.0),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 35, weight: .semibold),
            NSAttributedString.Key.shadow: shadow
        ]
        let playButtonAttributesText = NSAttributedString(
            string: playButtonText,
            attributes: playButtonAttributes
        )
        playButton.setAttributedTitle(playButtonAttributesText, for: .normal)
        
        
        let achievmentsButtonText = "Achievments"
        let achievmentsButtonAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 176/255, green: 52/255, blue: 22/255, alpha: 1.0),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 35, weight: .semibold),
            NSAttributedString.Key.shadow: shadow
        ]
        let achievmentsButtonAttributesText = NSAttributedString(
            string: achievmentsButtonText,
            attributes: achievmentsButtonAttributes
        )
        achievmentsButton.setAttributedTitle(achievmentsButtonAttributesText, for: .normal)
        
        
        let settingsButtonText = "Settings"
        let settingsButtonAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 176/255, green: 52/255, blue: 22/255, alpha: 1.0),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 35, weight: .semibold),
            NSAttributedString.Key.shadow: shadow
        ]
        let settingsButtonAttributesText = NSAttributedString(
            string: settingsButtonText,
            attributes: settingsButtonAttributes
        )
        settingsButton.setAttributedTitle(settingsButtonAttributesText, for: .normal)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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
