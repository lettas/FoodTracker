//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Toru Matsuoka on 2017/06/27.
//  Copyright © 2017年 Toru Matsuoka. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {

    // MARK: Properties

    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }

    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }

    private var ratingButtons = [UIButton]()

    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
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

    // MARK: Private Methods

    private func setupButtons() {
        // 既存のボタンを消す
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()

        // ボタンの画像を読み込む
        let bundle = Bundle(for: type(of: self))
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)

        for index in 0..<starCount {
            // ボタンを作る
            let button = UIButton()

            // ボタンに画像を設定
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])

            // レイアウト制約を設定
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true

            // アクセシビリティ設定
            button.accessibilityLabel = "Set \(index + 1) star rating"

            // ボタンのアクションを設定
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)

            // Viewに追加
            addArrangedSubview(button)

            ratingButtons.append(button)
        }

        updateButtonSelectionStates()
    }

    private func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = index < rating

            let hintString: String?
            if rating == index + 1 {
                hintString = "Tap to reset the rating to zero."
            }
            else {
                hintString = nil
            }

            let valueString: String
            switch(rating) {
            case 0:
                valueString = "No rating set."
            case 1:
                valueString = "1 star set."
            default:
                valueString = "\(rating) stars set."
            }

            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }
    }

    // MARK: Button Action

    func ratingButtonTapped(button: UIButton) {
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }

        let selectedRating = index + 1
        if selectedRating == rating {
            // 設定してあるratingと同じratingをタップしたらリセットする
            rating = 0
        }
        else {
            rating = selectedRating
        }
    }
}
