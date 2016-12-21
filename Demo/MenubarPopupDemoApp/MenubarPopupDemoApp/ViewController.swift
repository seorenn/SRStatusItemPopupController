//
//  ViewController.swift
//  MenubarPopupDemoApp
//
//  Created by Heeseung Seo on 2015. 8. 6..
//  Copyright © 2015년 Seorenn. All rights reserved.
//

import Cocoa
import SRStatusItemPopupController

class ViewController: NSViewController {
  
  weak var popup: SRStatusItemPopupController?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do view setup here.
  }
  
  @IBAction func pressedCloseButton(_ sender: AnyObject) {
    if let p = self.popup {
      p.hidePopover()
    }
  }
}
