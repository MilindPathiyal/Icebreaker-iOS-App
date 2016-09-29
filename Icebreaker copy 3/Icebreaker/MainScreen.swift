//
//  MainScreen.swift
//  Icebreaker
//
//  Created by Milind Pathiyal on 8/2/16.
//  Copyright © 2016 Milind Pathiyal. All rights reserved.
//

import UIKit

class MainScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "submitToMain" {
                print("Submit to Main")
            }
            else if identifier == "finalToMain"{
                print("Final to Main")
        }
            else if identifier == "contactToMain"{
                print("Contact to Main")
            }
            else if identifier == "gamerulesToMain"{
                
                print("GameRules to Main")
            
            }
      }
}
    
    @IBAction func unwindToMainScreenViewController(segue: UIStoryboardSegue) {
        
        // for now, simply defining the method is sufficient.
        // we'll add code later
        
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
}
