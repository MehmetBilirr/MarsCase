//
//  SavedCurrency.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 20.07.2023.
//

import Foundation
import RealmSwift

class SavedCurrency:Object,Identifiable {

  @Persisted(primaryKey: true) var id:ObjectId
  @Persisted var image:String
  @Persisted var name:String
  @Persisted var amount:Double
  @Persisted var sign:String
  @Persisted var date:Date
  



}
