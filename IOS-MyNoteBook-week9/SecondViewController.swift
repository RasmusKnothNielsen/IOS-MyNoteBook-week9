//
//  SecondViewController.swift
//  MyNoteBook
//
//  Created by Rasmus Knoth Nielsen on 21/02/2020.
//  Copyright © 2020 Rasmus Knoth Nielsen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var headText: UITextView!
    @IBOutlet weak var bodyText: UITextView!
    
    var text = ""

    override func viewDidLoad() {
        print("Now we are in secondViewController")
        super.viewDidLoad()
        let newNote = CloudStorage.getNote(index: rowThatIsBeingEdited)
        headText.text = newNote.head
        bodyText.text = newNote.body
        print("Row that is being edited: \(rowThatIsBeingEdited)")
        print()
    }
    
    @IBAction func userPressedSaveButton(_ sender: UIButton) {
        print("Pressed the save button")
        print(headText.text!)
        print(rowThatIsBeingEdited)
        let newNote = CloudStorage.getNote(index: rowThatIsBeingEdited)
        CloudStorage.updateNote(index: rowThatIsBeingEdited, head: headText.text, body: bodyText.text)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
