//
//  ViewController.swift
//  CoreGraphicSample
//
//  Created by Omid Shojaeian Zanjani on 04/07/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawView: DrawView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func drawCircle(_ sender: UIButton) {
        drawView.drawShape(selectedShape: .circle)
    }
    
    @IBAction func drawCircleFilled(_ sender: UIButton) {
        drawView.drawShape(selectedShape: .filledCircle)
    }
    
    
    
    @IBAction func drawRectangle(_ sender: UIButton) {
        drawView.drawShape(selectedShape: .rectangle)
    }
    
    @IBAction func drawFilledRectangle(_ sender: UIButton) {
        drawView.drawShape(selectedShape: .filledRectangle)
    }
}

