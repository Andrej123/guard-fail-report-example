//
//  ViewController.swift
//  Report Guard Fail
//
//  Created by Andrej Krizmancic on 16/05/2017.
//  Copyright © 2017 Andrej Krizmancic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let optionalInt: Int? = 5
    let optionalString: String? = ""
    let optionalBool: Bool? = nil
    let testBool: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let _ = optionalInt ??? reportFail(),
            let _ = optionalString ??? reportFail(),
            let _ = optionalBool ??? reportFail(),
            testBool ??? reportFail()
            else {
                print("Fail")
                return
        }
        print("Success")
    }
    
}

