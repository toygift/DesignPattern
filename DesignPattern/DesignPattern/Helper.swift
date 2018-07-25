//
//  Helper.swift
//  DesignPattern
//
//  Created by Jaeseong on 26/07/2018.
//  Copyright © 2018 Jaeseong. All rights reserved.
//

import UIKit

let defaultHeight = 200
let defaultColor = UIColor.blue

protocol HelperViewFactoryProtocol {
    func configure()
    func position()
    func display()
    var height: Int { get }
    var view: UIView { get }
    var parentView: UIView { get }
}
enum Shapes {
    case square
    case circle
    case rectangle
}
fileprivate class Square: HelperViewFactoryProtocol  {
    let height: Int
    let parentView: UIView
    var view: UIView
    
    init(height: Int = defaultHeight, parentView: UIView) {
        self.height = height
        self.parentView = parentView
        view = UIView()
    }
    func configure() {
        let frame = CGRect(x: 0, y: 0, width: height, height: height)
        view.frame = frame
        view.backgroundColor = defaultColor
    }
    
    func position() {
        view.center = parentView.center
    }
    
    func display() {
        configure()
        position()
        parentView.addSubview(view)
    }
}
fileprivate class Circle: Square {
    override func configure() {
        super.configure()
        view.layer.cornerRadius = view.frame.width/2
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor.red
    }
}
fileprivate class Rectangle: Square {
    override func configure() {
        let frame = CGRect(x: 0, y: 0, width: height + height/2, height: height)
        view.frame = frame
        view.backgroundColor = UIColor.yellow
    }
}
class ShapeFactory {
    let parentView: UIView
    
    init(parentView: UIView) {
        self.parentView = parentView
    }
    func create(as shape: Shapes) -> HelperViewFactoryProtocol {
        switch shape {
        case .square:
            let square = Square(parentView: parentView)
            return square
        case .circle:
            let circle = Circle(parentView: parentView)
            return circle
        case .rectangle:
            let rectangle = Rectangle(parentView: parentView)
            return rectangle
        }
    }
}

func createShape(_ shape: Shapes, on view: UIView) {
    let shapeFactory = ShapeFactory(parentView: view)
    shapeFactory.create(as: shape).display()
}

func getShape(_ shape: Shapes, on view: UIView) -> HelperViewFactoryProtocol {
    let shapeFactory = ShapeFactory(parentView: view)
    return shapeFactory.create(as: shape)
}




