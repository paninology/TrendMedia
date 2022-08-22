//
//  RealmModel.swift
//  TrendMedia
//
//  Created by yongseok lee on 2022/08/22.
//

import Foundation
import RealmSwift

class ShoppingList: Object {
    @Persisted var shoppingTitle: String
    @Persisted var favorite: Bool
    @Persisted var isDone: Bool
    @Persisted var regDate: Date
    @Persisted(primaryKey: true) var objectId: ObjectId
    
    
    convenience init(shoppingTitle: String, regDate: Date) {
        self.init()
        self.shoppingTitle = shoppingTitle
        self.favorite = false
        self.isDone = false
        self.regDate = regDate
        }
}
