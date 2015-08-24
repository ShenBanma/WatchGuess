//
//  AnswerInterfaceController.swift
//  GuessWatchDemo
//
//  Created by 沈家瑜 on 15/8/24.
//  Copyright (c) 2015年 沈家瑜. All rights reserved.
//

import WatchKit
import Foundation


class AnswerInterfaceController: WKInterfaceController {
    
    let data = DataManger.data

    @IBOutlet weak var labelTitle: WKInterfaceLabel!
    @IBOutlet weak var labelAnswer: WKInterfaceLabel!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if let index = context as? Int {
            let json = data.informations[index].json
            labelTitle.setText(json["Title"].string)
            labelAnswer.setText(json["Answer"].string)
        }
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
