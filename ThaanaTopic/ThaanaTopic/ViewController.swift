//
//  ViewController.swift
//  ThaanaTopic
//
//  Created by Sofwathullah Mohamed on 09/06/2018.
//  Copyright © 2018 Sofwathullah Mohamed. All rights reserved.
//

import UIKit
import CoreML

@available(iOS 12.0, *)
@available(iOS 12.0, *)
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TopicInput.layer.borderColor = UIColor.gray.cgColor
        TopicInput.layer.borderWidth = 1.0
        
        textLabel.lineBreakMode = .byWordWrapping // notice the 'b' instead of 'B'
        textLabel.numberOfLines = 3
        textLabel.text = "Classify Thaana Text Topic (News) using Machine Learning. Copy and Paste Thaana Text Below:"
    }
    
    let model = thaana()
    
    @IBOutlet weak var TopicInput: UITextView!
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    
    @IBAction func onClick(_ sender: Any) {
        let ptext = TopicInput.text
        let pred = try? model.prediction(text: ptext!)
        labelText.text = pred?.label
    }
    @IBAction func clear(_ sender: Any) {
        TopicInput.text = " "
        labelText.text =  " "
    }
}

