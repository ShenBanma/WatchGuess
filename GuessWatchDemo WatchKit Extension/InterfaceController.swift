//
//  InterfaceController.swift
//  GuessWatchDemo WatchKit Extension
//
//  Created by 沈家瑜 on 15/8/24.
//  Copyright (c) 2015年 沈家瑜. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController,GetInformationDelegate {
    @IBOutlet weak var table: WKInterfaceTable!
    let data = DataManger.data
    
    @IBOutlet weak var labelRemind: WKInterfaceLabel!
    var controller = HttpGetController()

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        labelRemind.setHidden(false)
        table.setHidden(true)
        table.setNumberOfRows(10, withRowType: "customTable")
        controller.delegate = self
        
        for i in 0..<10 {
            controller.getHttpInformation("http://apis.baidu.com/myml/c1c/c1c", id: -1)
        }
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    @IBAction func refresh() {
        controller.count = 0
        labelRemind.setHidden(false)
        table.setHidden(true)
        let co = data.informations
        data.informations.removeAll(keepCapacity: false)
        for i in 0..<10 {
            controller.getHttpInformation("http://apis.baidu.com/myml/c1c/c1c", id: -1)
        }
    }
    
    func doSomethingAfterGetInformation() {
        labelRemind.setHidden(true)
        table.setHidden(false)
        for i in 0..<10 {
            let row = table.rowControllerAtIndex(i) as! CustomTable
            let j = data.informations[i].json
            row.labelTitle.setText(j["Title"].string)
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        self.pushControllerWithName("answerController", context: rowIndex)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
