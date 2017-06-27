//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Toru Matsuoka on 2017/06/27.
//  Copyright © 2017年 Toru Matsuoka. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {

    // MARK: Properties

    private var ratingButtons = [UIButton]()
    var rating = 0

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
        for _ in 0..<5 {
            // ボタンを作る
            let button = UIButton()
            button.backgroundColor = UIColor.red

            // レイアウト制約を設定
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
            button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true

            // ボタンのアクションを設定
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)

            // Viewに追加
            addArrangedSubview(button)

            ratingButtons.append(button)
        }
    }

    // MARK: Button Action

    func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }
}
