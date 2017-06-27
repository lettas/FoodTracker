//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Toru Matsuoka on 2017/06/27.
//  Copyright © 2017年 Toru Matsuoka. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {

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
        // ボタンを作る
        let button = UIButton()
        button.backgroundColor = UIColor.red

        // レイアウト制約を設定
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true

        // Viewに追加
        addArrangedSubview(button)
    }
}
