//
//  SaveModal.swift
//  SaveReminder
//
//  Created by Joshua T. Fisher on 2/24/16.
//  Copyright © 2016 Joshua T. Fisher. All rights reserved.
//

import Cocoa
import AppKit

class SaveModal: NSViewController {

    override func viewDidLoad() {
      super.viewDidLoad()
        // Do view setup here.
    }
  
  override func viewDidAppear() {
    super.viewDidAppear()
    self.view.window!.level = Int(CGWindowLevelForKey(CGWindowLevelKey.StatusWindowLevelKey))
  }
  
  @IBAction func dismissSaveReminderWindow(sender: NSButton) {
    let application = NSApplication.sharedApplication()
    application.stopModal()
  }
}
