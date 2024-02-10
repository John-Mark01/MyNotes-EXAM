//
//  ViewController.swift
//  MyNotes
//
//  Created by John-Mark Iliev on 4.02.24.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var saveNoteButton: UIButton!
    
    @IBOutlet weak var showSavedNoteButton: UIButton!
    
    
    var storageManager = StorageManager()
    var motionManager = MotionManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegates()
        setupUI()
        updateElements()
        motionManager.startUpdates()
        
       
    }
    
    // Tap Gesture Function
    @objc func tappedSomewhere() {
        textView.resignFirstResponder()
    }
    
    // Setting up some UI details
    func setupUI() {
        textView.layer.cornerRadius = 12.0
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedSomewhere))
        view.addGestureRecognizer(tapGesture)
    }
    
    // Setting up delegates
    func setDelegates() {
        textView.delegate = self
        motionManager.delegate = self
    }
    
    // Updating elements
    func updateElements() {
        
        showSavedNoteButton.isEnabled = storageManager.noNotes
        
        if textView.text.isEmpty {
            saveNoteButton.isEnabled = false
        } 
        
    }
    
    
    // IB Action's
    @IBAction func saveNoteTapped(_ sender: UIButton) {
        
        guard let textForNote = textView.text, !textForNote.isEmpty else {return}
        storageManager.saveNote(note: textForNote)
       
        textView.text = nil
        updateElements()
    }
    
    
    @IBAction func showSavedNoteTapped(_ sender: UIButton) {
        
        let note = storageManager.fetchNote()
        textView.text = note
        
        if textView.text.isEmpty || sender.isTouchInside {
            saveNoteButton.isEnabled = false
        }
        
        updateElements()
    }
}

//MARK: - UI Text View Delegates
extension ViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        
        saveNoteButton.isEnabled = true
    }
    
}

//MARK: - Motion Manager Delegate

extension ViewController: MotionManagerDelegate {
    func didDetectMovement() {
        let alert = UIAlertController(title: "Delete Text?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [self] _ in
            textView.text = ""
            
            DispatchQueue.main.async {
                self.updateElements()
            }
            
        }))
        present(alert, animated: true)
        
    }
    
    
}

