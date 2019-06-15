//
//  ViewController.swift
//  DataStructures
//
//  Created by x on 2018/7/31.
//  Copyright © 2018年 x. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func merageSort(_ sender: Any) {
        var number = [1,6,2,8,9]
        number.mergeSort(number.startIndex, number.endIndex)
        print(number)
    }
    
}

