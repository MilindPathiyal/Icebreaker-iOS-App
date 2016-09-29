//
//  FinalViewController.swift
//  Icebreaker
//
//  Created by Milind Pathiyal on 7/29/16.
//  Copyright © 2016 Milind Pathiyal. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

typealias Person = (name: String, truth: String)

class FinalViewController: UIViewController {
    
    @IBOutlet weak var gameOver: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var truthTextView: UITextView!
    
    @IBOutlet weak var funny: UILabel!
    @IBOutlet weak var revealName: UIButton!
  //  @IBOutlet weak var next: UIButton!
    @IBOutlet weak var next: UIBarButtonItem!
    
   var ya = 0
    @IBAction func nextTapped(sender: AnyObject) {
       
        let randomIndex = arc4random_uniform(UInt32(people.count - 1))
        
        person = people.removeAtIndex(Int(randomIndex))
        
        playSound("button")
        funny.hidden = false
        
        
    }
  
    
    
    
    
    @IBAction func revealNameTapped(sender: AnyObject) {
        nameTextField.hidden = false
        
        if people.count == 0{
            
            gameOver.hidden = false
            revealName.hidden = true
            funny.hidden = true
            self.next.title = "";
            self.next.enabled = false
            
           
            
            
        }
        funny.hidden = true
        playSound("tada")
        self.next.enabled = true
    }
    
    var people = [Person]()
    var person: Person! {
        didSet {
            nameTextField.hidden = true
            nameTextField.text = person.name
            truthTextView.text = person.truth
            truthTextView.textColor = UIColor.whiteColor()

            truthTextView.font = .systemFontOfSize(25)
            truthTextView.textAlignment = .Center
            gameOver.hidden = true
            self.next.enabled = false
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "finalToMain"{
            
            print("Quit button pressed")
            
        }
    }

    
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
      

        let randomIndex = arc4random_uniform(UInt32(people.count - 1))
        person = people.removeAtIndex(Int(randomIndex))
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FinalViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    
    
    var audioPlayer: AVAudioPlayer?
    
    func playSound(str:String) {
        let url = NSBundle.mainBundle().URLForResource(str, withExtension: "wav")!
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL: url)
            guard let audioPlayer = audioPlayer else { return }
            
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch let error as NSError {
            print(error.description)
        }
    }

    
    
   
    
    }