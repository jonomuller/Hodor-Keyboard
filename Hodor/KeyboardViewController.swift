//
//  KeyboardViewController.swift
//  Hodor
//
//  Created by Jono Muller on 05/06/2014.
//  Copyright (c) 2014 Jonathan Muller. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton
    @IBOutlet var hodorButton: UIButton

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton.buttonWithType(.System) as UIButton
    
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.nextKeyboardButton.titleLabel.font = UIFont(name: "Helvetica", size: 10)
    
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
    
        var nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        var nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
        
        // Hodor button
        
        self.hodorButton = UIButton.buttonWithType(.System) as UIButton
        
        self.hodorButton.setTitle(NSLocalizedString("Hodor", comment: "Hodor button"), forState: .Normal)
        self.hodorButton.sizeToFit()
        self.hodorButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.hodorButton.titleLabel.font = UIFont(name: "Helvetica", size: 50)
        
        self.hodorButton.addTarget(self, action: "hodor", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.hodorButton)
        
        var hodorButtonCenterXConstraint = NSLayoutConstraint(item: self.hodorButton, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
        var hodorButtonCenterYConstraint = NSLayoutConstraint(item: self.hodorButton, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([hodorButtonCenterXConstraint, hodorButtonCenterYConstraint])
    }
    
    func hodor() {
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.insertText("Hodor ")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
        self.hodorButton.setTitleColor(textColor, forState: .Normal)
    }

}
