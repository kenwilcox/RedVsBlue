//
//  InterfaceController.swift
//  RedVsBlue WatchKit Extension
//
//  Created by Kenneth Wilcox on 3/28/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
  
  @IBOutlet weak var group: WKInterfaceGroup!
  @IBOutlet weak var label: WKInterfaceLabel!
  @IBOutlet weak var slider: WKInterfaceSlider!
  var state = true
  
  override func awakeWithContext(context: AnyObject?) {
    super.awakeWithContext(context)
    
    // Configure interface objects here.
    toggleElements()
  }
  
  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }
  
  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }
  
  func toggleElements() {
    if state {
      group.setBackgroundColor(UIColor.blueColor())
      label.setText("Cool")
    } else {
      group.setBackgroundColor(UIColor.redColor())
      label.setText("Hot")
    }
    state = !state
  }
  
  @IBAction func alphaChanged(value: Float) {
    println(value/100)
    group.setAlpha(CGFloat(value/100))
  }
  
  @IBAction func switchPressed(value: Bool) {
    toggleElements()
  }
  
  @IBAction func resetPressed() {
    state = true
    toggleElements()
    // Weird, seting the value does not fire the value changed?
    slider.setValue(100)
  }
}
