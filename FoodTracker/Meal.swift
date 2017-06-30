//
//  Meal.swift
//  FoodTracker
//
//  Created by Toru Matsuoka on 2017/06/28.
//  Copyright © 2017年 Toru Matsuoka. All rights reserved.
//

import UIKit
import os.log

class Meal: NSObject, NSCoding {

    // MARK: Properties

    struct PropertyKeys {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }

    var name: String
    var photo: UIImage?
    var rating: Int

    // MARK: Archiving Paths

    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")

    // MARK: Initialization

    init?(name: String, photo: UIImage?, rating: Int) {
        guard !name.isEmpty else {
            return nil
        }

        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }

        self.name = name
        self.photo = photo
        self.rating = rating
    }

    // MARK: NSCoding

    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKeys.name)
        aCoder.encode(photo, forKey: PropertyKeys.photo)
        aCoder.encode(rating, forKey: PropertyKeys.rating)
    }

    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKeys.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }

        let photo = aDecoder.decodeObject(forKey: PropertyKeys.photo) as? UIImage
        let rating = aDecoder.decodeInteger(forKey: PropertyKeys.rating)

        self.init(name: name, photo: photo, rating:rating)
    }
}
