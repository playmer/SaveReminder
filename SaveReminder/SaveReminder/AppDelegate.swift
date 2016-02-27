//
//  AppDelegate.swift
//  SaveReminder
//
//  Created by Joshua T. Fisher on 2/21/16.
//  Copyright © 2016 Joshua T. Fisher. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate
{
  // View controller instance, this is the hook to your ViewController
  var vc = ViewController()

  func applicationDidFinishLaunching(aNotification: NSNotification)
  {
    // Insert code here to initialize your application
  }
  
  func applicationShouldTerminateAfterLastWindowClosed (aApplication : NSApplication) -> Bool
  {
    return true;
  }

  func applicationWillTerminate(aNotification: NSNotification)
  {
    vc.InternalStop()
  }
}

