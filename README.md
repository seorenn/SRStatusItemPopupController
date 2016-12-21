SRStatusItemPopupController
===========================

The Controller for NSStatusItem with NSPopover components.

## Examples

In AppDelegate.swift:

```swift
import Cocoa
import SRStatusItemPopupController

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  ...

  var popup: SRStatusItemPopupController?

  func applicationDidFinishLaunching(_ aNotification: NSNotification) {
    let viewController = ViewController(nibName: "ViewController",
                                        bundle: nil)
    let image = NSImage(named: NSImageNameFolder) // System Folder Icon
    self.popup = SRStatusItemPopupController(viewController: viewController!,
                                             image: image,
                                             alternateImage: nil
                                             autoHide: true)
  }

  ...

}
```

