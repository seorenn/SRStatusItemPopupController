//
// SRStatusItemPopupController.swift
// SRChoco
//
// Created by Seorenn.
// Copyright (c) 2014 Seorenn. All rights reserved.
//

/* NOTE: SRStatusItemPopupController cannot working well without these extensions:
 extension NSWindow {
 func canBecomeKeyWindow() -> Bool {
 return true
 }
 }
 */


import AppKit

public class SRStatusItemPopupController: NSObject {
  // TODO: is this need?
  private static let minWidth: CGFloat = 22.0
  
  private let statusItem: NSStatusItem
  private let statusItemButton: NSButton
  private let viewController: NSViewController
  private let popover: NSPopover
  private var event: Any!
  
  public var popoverWillShowHandler: (() -> ())?
  
  public init(viewController: NSViewController, image: NSImage?, alternateImage: NSImage?, autoHide: Bool) {

    self.viewController = viewController
    
    statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    statusItemButton = self.statusItem.value(forKey: "_button") as! NSButton
    statusItemButton.focusRingType = .none
    statusItemButton.setButtonType(.pushOnPushOff)
    
    if let icon = image {
      self.statusItem.image = icon
    }
    if let altIcon = alternateImage {
      self.statusItem.alternateImage = altIcon
    }
    
    popover = NSPopover()
    popover.contentViewController = self.viewController
    
    popover.behavior = autoHide ? .transient : .applicationDefined
    
    super.init()
    
    statusItem.target = self
    //statusItem.action = #selector(SRStatusItemPopupController.showPopover as (SRStatusItemPopupController) -> () -> ())
    statusItem.action = #selector(showPopover(_:))
    
    event = NSEvent.addGlobalMonitorForEvents(matching: [.leftMouseUp, .leftMouseDown], handler: {
      event in
      self.hidePopover()
    })!
    
  }
  
  deinit {
    NSEvent.removeMonitor(event)
  }
  
  @objc func showPopover(_ animated: Bool) {
    if popover.isShown {
      popover.close()
      return
    }
    
    if let handler = popoverWillShowHandler {
      handler()
    }
    
    statusItemButton.state = NSControl.StateValue.on
    NSApp.activate(ignoringOtherApps: true)
    
    popover.animates = animated
    popover.contentSize = self.viewController.view.frame.size
    popover.show(relativeTo: NSZeroRect, of: self.statusItemButton, preferredEdge: NSRectEdge.maxY)
  }
  
  public func showPopover() {
    self.showPopover(true)
  }
  
  public func hidePopover() {
    if self.popover.isShown == false { return }
    
    self.statusItemButton.state = NSControl.StateValue.off
    self.popover.close()
  }
}

