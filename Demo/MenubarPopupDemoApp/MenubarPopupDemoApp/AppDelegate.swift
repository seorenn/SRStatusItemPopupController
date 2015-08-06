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

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        let viewController = ViewController(nibName: "ViewController", bundle: nil)
        let image = NSImage(named: NSImageNameFolder)
        self.popup = SRStatusItemPopupController(viewController: viewController!, image: image, alternateImage: nil)
        viewController!.popup = self.popup
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBAction func pressedOpenPopoverButton(sender: AnyObject) {
        self.popup!.showPopover()
    }

    @IBAction func pressedClosePopoverButton(sender: AnyObject) {
        self.popup!.hidePopover()
    }
}

