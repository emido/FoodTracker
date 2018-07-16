//
//  StarRatingControl.swift
//  FoodTrack
//
//  Created by Maryam on 2018-07-15.
//  Copyright © 2018 avanet.tech. All rights reserved.
//

import UIKit

@IBDesignable class StarRatingControl: UIStackView {
    
    // MARK: Properties
    private var ratingButtons = [UIButton]()
    var rating = 0
    @IBInspectable var starSize : CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starCount : Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    // MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton) {
        print("Button Pressed 👍🏽")
    }
    
    // MARK: Private Methods
    private func setupButtons() {
        // clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        
        for _ in 0..<starCount {
            let button = UIButton()
            button.backgroundColor = .red
            
            // add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // setup the button action
            button.addTarget(self, action: #selector(StarRatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // add the button to the stack
            addArrangedSubview(button)
            
            // add the new button to the rating button array
            ratingButtons.append(button)
        }
    }
}
