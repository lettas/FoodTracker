//
//  Meal.swift
//  FoodTracker
//
//  Created by Toru Matsuoka on 2017/06/28.
//  Copyright © 2017年 Toru Matsuoka. All rights reserved.
//

import UIKit

class Meal {

    // MARK: Properties

    var name: String
    var photo: UIImage?
    var rating: Int

    // MARK: Initialization

    init?(name: String, photo: UIImage?, rating: Int) {
        if name.isEmpty || rating < 0 {
            return nil
        }
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
