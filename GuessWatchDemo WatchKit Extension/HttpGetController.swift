//
//  HttpGetController.swift
//  GuessWatchDemo
//
//  Created by 沈家瑜 on 15/8/24.
//  Copyright (c) 2015年 沈家瑜. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

struct GuessInformation {
    let json:JSON
}

class HttpGetController: NSObject {
    var delegate:GetInformationDelegate?
    var data = DataManger.data
    var count = 0
    func getHttpInformation(url: String, id: Int) {
        Alamofire.request(.GET, url, parameters: ["id": id], headers: ["apikey": "14f99e26b9bc57a36970ddd09e0b9264"]).responseJSON(options: NSJSONReadingOptions.MutableContainers) { (_, _, json, _) -> Void in
            if let json: AnyObject = json {
                let j = JSON(json)
                self.data.informations.append(GuessInformation(json: j))
                self.count++
                if self.count == 10 {
                    self.delegate?.doSomethingAfterGetInformation()
                    self.count = 0
                }
            }
        }
    }
}

protocol GetInformationDelegate {
    func doSomethingAfterGetInformation()
}

