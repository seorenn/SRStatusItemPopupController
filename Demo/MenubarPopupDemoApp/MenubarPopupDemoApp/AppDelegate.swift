//
//  AppDelegate.swift
//  MenubarPopupDemoApp
//
//  Created by Heeseung Seo on 2015. 8. 6..
//  Copyright © 2015년 Seorenn. All rights reserved.
//

import Cocoa
import SRStatusItemPopupController

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
  
  @IBOutlet weak var window: NSWindow!
  var popup: SRStatusItemPopupController?
  
  func applicationDidFinishLaunching(_ aNotification: Notification) {
    // Insert code here to initialize your application
    
    let viewController = ViewController(nibName: "ViewController", bundle: nil)
    let image = NSImage(named: NSImage.folderName)
    self.popup = SRStatusItemPopupController(viewController: viewController, image: image, alternateImage: nil, autoHide: true)
    viewController.popup = self.popup
  }
  
  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }
  
  @IBAction func pressedOpenPopoverButton(_ sender: AnyObject) {
    self.popup!.showPopover()
  }
  
  @IBAction func pressedClosePopoverButton(_ sender: AnyObject) {
    self.popup!.hidePopover()
  }
}

