//
//  Migrator.swift
//  MarsCase
//
//  Created by Mehmet Bilir on 20.07.2023.
//

import Foundation
import RealmSwift

class Migrator {

    init() {
        updateSchema()
    }

    func updateSchema() {

        let config = Realm.Configuration(schemaVersion: 3) { migration, oldSchemaVersion in
                migration.enumerateObjects(ofType: SavedCurrency.className()) { _, newObject in
                    newObject!["category"] = ""
                }

        }

        Realm.Configuration.defaultConfiguration = config
        let _ = try! Realm()

    }

}
