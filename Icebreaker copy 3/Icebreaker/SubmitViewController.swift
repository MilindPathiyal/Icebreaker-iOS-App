//
//  ViewController.swift
//  Icebreaker
//
//  Created by Milind Pathiyal on 7/29/16.
//  Copyright © 2016 Milind Pathiyal. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation


class SubmitViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var truthTextView: UITextView!
   // @IBOutlet weak var info: UILabel!
    @IBOutlet weak var startGame: UIBarButtonItem!
    

    
    //let PLACEHOLDER_TEXT = "enter your name"
    
    var people = [Person]()
    
   // let truthFieldPlaceholder = "Enter an unexpected truth about yourself"
    
    @IBAction func Submit(sender: AnyObject) {
        let name = nameTextField.text!
        let truth = truthTextView.text!
        // Validate Input
        
        
        if name != "" || truth != "" {
            people.append((name: name, truth: truth))
            
            nameTextField.text  = ""
            truthTextView.text = ""
        } else {
            
            print("NOT VALID")
        }
        self.startGame.enabled = true
        playSound("button")
        truthTextView.text = "Enter a Truth"
        truthTextView.textColor = UIColor.whiteColor()
    
    }


    
    
    
    
       
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toFinal" {
            let viewController = segue.destinationViewController as! FinalViewController
            viewController.people = self.people
            
        }
        else if segue.identifier == "submitToMain"{
            
            print("Quit button pressed")
            
        }
    }
    
  
    
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if people.count ==  0{
            
            self.startGame.enabled = false
        }
        else{
            
           // self.startGame.title = "Start Game";
            self.startGame.enabled = true
        }
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FinalViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.nameTextField.delegate = self
         truthTextView.delegate = self
        
        truthTextView.text = "Enter a Truth"
        truthTextView.textColor = UIColor.whiteColor()

        
        
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
  
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        if textView.textColor == UIColor.whiteColor() {
            textView.text = nil
            textView.textColor = UIColor.whiteColor()
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Enter a Truth"
            textView.textColor = UIColor.whiteColor()
        }
    }
    
    
    
    
    
    
}

    



