//
//  ViewController.swift
//  userDefaultSetting
//
//  Created by SAFCSP.
//  Copyright © SAFCSP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let defaults = UserDefaults.standard
    var fontSize : Int!

    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // checking text size
        if defaults.integer(forKey: "fontSize") > 0{
            updateTextSize(defaults.integer(forKey: "fontSize"))
            print(defaults.integer(forKey: "fontSize"))
        } else {
            print(defaults.integer(forKey: "fontSize"))
            fontSize = 30
            defaults.set(fontSize, forKey: "fontSize")
        }
        
        
        //checking if switched on
        if defaults.bool(forKey: "SwitchState") != false {
            updateSwitch(value: defaults.bool(forKey: "SwitchState") )
            
        } else {
            updateSwitch(value: false)
            print(defaults.bool(forKey: "SwitchState"))
        }
        
    }
    
    
    @IBAction func switchAction(_ sender: UISwitch) {
        updateSwitch(value: sender.isOn)
    }
    
    func updateSwitch(value : Bool){
        if value {
            defaults.set(true, forKey: "SwitchState")
            overrideUserInterfaceStyle = .dark
            darkModeSwitch.isOn = true
        } else {
            defaults.set(false, forKey: "SwitchState")
            overrideUserInterfaceStyle = .light
            darkModeSwitch.isOn = false
        }
        
    }
    
    @IBAction func bigFont(_ sender: Any) {
        updateTextSize(defaults.integer(forKey: "fontSize") + 5)
    }
    
    func updateTextSize(_ newSize : Int){
        if newSize > 0 {
        fontSize = newSize
        labelText.font = labelText.font.withSize(CGFloat(fontSize))
        defaults.set(fontSize, forKey: "fontSize")
        }
    }
    
    @IBAction func smallFont(_ sender: Any) {
        updateTextSize(  defaults.integer(forKey: "fontSize") - 5)
    }
    
}

