//
//  GameViewController.swift
//  Racing
//
//  Created by Maryia Dziarkach on 14.04.24.
//

import UIKit

class GameViewController: UIViewController {

    // MARK: - Properties
    
    let movingDistance: CGFloat = 3
    var selectedCar: UIImageView?
    
    let screenWidthe = UIScreen.main.bounds.width
    
    let screenHeight = UIScreen.main.bounds.height
    
    enum Direction {
        case left
        case right
    }
    
    
    
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var leftButton: UIButton!
    
    @IBOutlet weak var rightButton: UIButton!
    
    
    @IBOutlet weak var leftViewBoarder: UIView!
    
    @IBOutlet weak var rightViewBoarder: UIView!
    
    @IBOutlet weak var whiteCar: UIImageView!
    
    @IBOutlet weak var blackCar: UIImageView!
    
    
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedCar = blackCar
       
        let tapGestureBlack = UITapGestureRecognizer(target: self, action: #selector(selectCar(_:)))
            blackCar.addGestureRecognizer(tapGestureBlack)
            blackCar.isUserInteractionEnabled = true
        
        let tapGestureWhite = UITapGestureRecognizer(target: self, action: #selector(selectCar(_:)))
           whiteCar.addGestureRecognizer(tapGestureWhite)
           whiteCar.isUserInteractionEnabled = true
        
        
        let leftViewBoarderWidth = leftViewBoarder.frame.width
        let leftViewBoarderHeight = leftViewBoarder.frame.height
        let leftViewBoarderX = leftViewBoarder.frame.origin.x
        let leftViewBoarderY = leftViewBoarder.frame.origin.y
        
        
        let rightViewBoarderWidth = rightViewBoarder.frame.width
        let rightViewBoarderHeight = rightViewBoarder.frame.height
        let rightViewBoarderX = rightViewBoarder.frame.origin.x
        let rightViewBoarderY = rightViewBoarder.frame.origin.y
        
    }
    
    
    func movingBlackCar(to direction: Direction) {
        guard let car = selectedCar, car == blackCar else { return }
        var newFrame = car.frame
        switch direction {
        case .left:
            newFrame.origin.x = max(newFrame.origin.x - movingDistance, leftViewBoarder.frame.maxX)
        case .right:
            newFrame.origin.x = min(newFrame.origin.x + movingDistance, rightViewBoarder.frame.minX - car.frame.width)
        }
        car.frame = newFrame
    }
    
    
    func movingWhiteCar(to direction: Direction) {
        guard let car = selectedCar, car == whiteCar else { return }
        var newFrame = car.frame
        switch direction {
        case .left:
            newFrame.origin.x = max(newFrame.origin.x - movingDistance, leftViewBoarder.frame.maxX)
        case .right:
            newFrame.origin.x = min(newFrame.origin.x + movingDistance, rightViewBoarder.frame.minX - car.frame.width)
        }
        car.frame = newFrame
    }
    
    
    
    
    
    // MARK: - IBActions
    
    @IBAction func pressedLeftButton(_ sender: UIButton) {
        movingBlackCar(to: .left)
        movingWhiteCar(to: .left)
    }
    
    @IBAction func pressedRightButton(_ sender: UIButton) {
        movingBlackCar(to: .right)
        movingWhiteCar(to: .right)
    }
    
    
    
    
    // MARK: - Custom Methods
    
    @objc func selectCar(_ sender: UITapGestureRecognizer) {
        if sender.view === blackCar {
            selectedCar = blackCar
        } else if sender.view === whiteCar {
            selectedCar = whiteCar
        }
    }
    
    
    // MARK: - Navigation
    
    
    


}
