//
//  DrawView.swift
//  CoreGraphicSample
//
//  Created by Omid Shojaeian Zanjani on 04/07/23.
//
//
import UIKit
import CoreGraphics

class DrawView: UIView {

    enum Shape{
        case circle, filledCircle, rectangle, filledRectangle
    }
    
    var currentShape:Shape?
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        guard let context = UIGraphicsGetCurrentContext(), let currentShape = currentShape else {
            print("Couldn't find the context")
            return
        }
        
        switch currentShape {
        case .circle:
            drawCircle(using: context, isFilled: false)
        case .filledCircle:
            drawCircle(using: context, isFilled: true)
        case .rectangle:
            drawRectangle(using: context, isFilled: false)
        case .filledRectangle:
            drawRectangle(using: context, isFilled: true)
        }
        
    }
    
    func drawShape(selectedShape:Shape){
        currentShape = selectedShape
        // cuase to trig the draw function
        setNeedsDisplay()
    }

    func drawCircle(using context:CGContext, isFilled:Bool){
        let radius:CGFloat = 150
        let centerPoint = CGPoint(x: bounds.width / 2 , y: bounds.height / 2)
        
        context.addArc(center: centerPoint, radius: radius, startAngle: CGFloat(0).degreesToRadians, endAngle: CGFloat(45).degreesToRadians, clockwise: false)
        context.setLineCap(.square)
        context.setLineWidth(4.0)
        if isFilled{
            context.setFillColor(UIColor.purple.cgColor)
            // Note: Persian :
            /// دقت کن که خطوط هم اضافه کنی که تیکه دایره به خوبی رسم بشه
            /// اینجا قطعه دایره رسم میشه اما باید با رسم دوتا خط دیگه هم بتونی رسم رو کامل کنی
            context.addLine(to: centerPoint)
            context.addLine(to: CGPoint(x: centerPoint.x + 30, y: centerPoint.y ))
            context.fillPath()
        }else{
            context.setStrokeColor(UIColor.purple.cgColor)
            context.strokePath()
        }
    }
    
    func drawRectangle(using context:CGContext, isFilled:Bool){
        let strockDistance:CGFloat = 25
        let centerPoint = CGPoint(x: bounds.width / 2 , y: bounds.height / 2)
        
        let lowerLetfCorner = CGPoint(x: centerPoint.x - strockDistance, y: centerPoint.y + strockDistance)
        let lowerRightCorner = CGPoint(x: centerPoint.x + strockDistance, y: centerPoint.y + strockDistance)
        let upLeftCorner = CGPoint(x: centerPoint.x - strockDistance, y: centerPoint.y - strockDistance)
        let upRightCorner = CGPoint(x: centerPoint.x + strockDistance, y: centerPoint.y - strockDistance)
        
        context.move(to: lowerLetfCorner)
        context.addLine(to: lowerRightCorner)
        context.addLine(to: upRightCorner)
        context.addLine(to: upLeftCorner)
        context.addLine(to: lowerLetfCorner)
        
        context.setLineCap(.square)
        context.setLineWidth(8.0)
        
        if isFilled{
            context.setFillColor(UIColor.purple.cgColor)
            context.fillPath()
        }else{
            context.setStrokeColor(UIColor.purple.cgColor)
            context.strokePath()
        }
    }
}
