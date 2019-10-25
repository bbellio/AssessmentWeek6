//
//  PersonController.swift
//  Pair
//
//  Created by Bethany Wride on 10/25/19.
//  Copyright © 2019 Bethany Bellio. All rights reserved.
//

import Foundation

class PersonController {
// MARK: - Properties
    var people: [Person] = []
    
// MARK: - CRUD
    func update(person: Person, with name: String) {
        person.name = name
    }
    
//    func delete
    
// MARK: - Save and Load
    // Creates the URL
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "pair.json"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    
    func saveToPersistentStore() {
        do {
            let jsonPeople = try JSONEncoder().encode(people)
            try jsonPeople.write(to: fileURL())
        } catch let encodingError {
            print("Error encoding data: \(encodingError)")
        }
    }
    
    func loadFromPersistenStore() {
        do {
            let jsonData = try Data(contentsOf: fileURL())
            let decodedPeople = try JSONDecoder().decode([Person].self, from: jsonData)
            people = decodedPeople
        } catch let decodingError {
            print("Error decoding data: \(decodingError)")
        }
    }
}

