//
//  StorageManager.swift
//  MyNotes
//
//  Created by John-Mark Iliev on 4.02.24.
//

import Foundation


class StorageManager {
    
    let userDefaults = UserDefaults.standard
    
    private let noteKey = "note"
    
    var notesArray = [String]()
    
    var noNotes: Bool {
        
        ((userDefaults.object(forKey: noteKey) as? [String]) != nil) ? true : false
    }
    

    func fetchNote() -> String {
        notesArray = userDefaults.object(forKey: noteKey) as? [String] ?? []
        return notesArray[notesArray.count - 1]
    }
    
    func saveNote(note: String) {
        notesArray.append(note)
        saveToUserDefaults()
    }
    
    
    func saveToUserDefaults() {
        userDefaults.setValue(notesArray, forKey: noteKey)
    }
    

}
