//
//  ViewController.swift
//  DesignPattern
//
//  Created by Jaeseong on 26/07/2018.
//  Copyright © 2018 Jaeseong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func drawCircle(_ sender: UIButton) {
        createShape(.circle, on: view)
    }
    @IBAction func drawSquare(_ sender: UIButton) {
        createShape(.square, on: view)
    }
    @IBAction func drawRectangle(_ sender: UIButton) {
        let rectangle = getShape(.rectangle, on: view)
        rectangle.display()
    }
}












