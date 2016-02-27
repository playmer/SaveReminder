//
//  ViewController.swift
//  SaveReminder
//
//  Created by Joshua T. Fisher on 2/21/16.
//  Copyright © 2016 Joshua T. Fisher. All rights reserved.
//

import Cocoa
import AppKit
import AVFoundation
import Foundation


class ViewController: NSViewController, NSTextFieldDelegate
{
  var mTimeToWait : Double  = 0.0
  var timer = NSTimer()
  @IBOutlet weak var StartStopButton: NSButtonCell!
  @IBOutlet weak var mNumberSelect: NSPopUpButton!

  override func viewDidLoad()
  {
    super.viewDidLoad()
    for index in 1...12
    {
      let indexAsString = (index * 5) as NSNumber
      mNumberSelect.addItemWithTitle(indexAsString.stringValue)
    }

    // Do any additional setup after loading the view.
  }
  
  override var representedObject: AnyObject?
  {
    didSet
    {
      // Update the view, if already loaded.
    }
  }
  
  func GetTimeToWait() -> Double
  {
    let item : NSString = mNumberSelect.titleOfSelectedItem!
    
    var value = item.doubleValue
    
    print("The value given was: ", value)
    
    // Multiply it by 60 seconds as these are minutes being input
    value *= 60
    return value
  }

  @IBAction func StartAlert(sender: AnyObject)
  {
    if (StartStopButton.title == "Start!")
    {
      mNumberSelect.enabled = false
      StartStopButton.title = "Stop!"
      timer = NSTimer.scheduledTimerWithTimeInterval(GetTimeToWait(),
                                                     target: self,
                                                     selector: "DoAlert",
                                                     userInfo: nil,
                                                     repeats: true)
    }
    else
    {
      mNumberSelect.enabled = true
      StartStopButton.title = "Start!"
      InternalStop()
    }
  }
  
  func InternalStop()
  {
    timer.invalidate()
  }
  
  @IBAction func showWordCountWindow(sender: AnyObject) {
    
  }
  
  func DoAlert()
  {
    timer.invalidate()
    
    // 1
    let storyboard = NSStoryboard(name: "Main", bundle: nil)
    let sRWindowController = storyboard.instantiateControllerWithIdentifier("SR Window Controller") as! NSWindowController
    
    if let sRWindow = sRWindowController.window {
      
      // 2
      //let sRWindowControllerModal = sRWindow.contentViewController as! SaveModal
      
      // 3
      if let soundURL = NSBundle.mainBundle().URLForResource("alarm", withExtension: "wav")
      {
        var mySound: SystemSoundID = 0
        
        AudioServicesCreateSystemSoundID(soundURL, &mySound)
        // Play
        AudioServicesPlaySystemSound(mySound);
      }
      
      let application = NSApplication.sharedApplication()
      application.runModalForWindow(sRWindow)
      
      
    }
    
    
    
    timer = NSTimer.scheduledTimerWithTimeInterval(GetTimeToWait(),
      target: self,
      selector: "DoAlert",
      userInfo: nil,
      repeats: false)
  }

}

