//
//  ViewControllerFive.swift
//  PocketLab
//
//  Created by 배문기 on 2018. 5. 12..
//  Copyright © 2018년 배문기. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    @IBOutlet weak var calfield: UITextField!
    var actualcal = ""
    
    @IBAction func zero(_ sender: Any) {
        calfield.text = calfield.text! + "0"
        actualcal = actualcal + "0"
        
    }

    @IBAction func dot(_ sender: Any) {
        calfield.text = calfield.text! + "."
        actualcal = actualcal + "."
        
    }
    
    @IBAction func e(_ sender: Any) {
        calfield.text = calfield.text! + "e"
        actualcal = actualcal + "M_E"
        
    }
    
    @IBAction func one(_ sender: Any) {
        calfield.text = calfield.text! + "1"
        actualcal = actualcal + "1"
        
    }
    @IBAction func two(_ sender: Any) {
        calfield.text = calfield.text! + "2"
        actualcal = actualcal + "2"
        
    }
    @IBAction func three(_ sender: Any) {
        calfield.text = calfield.text! + "3"
        actualcal = actualcal + "3"
        
    }
    @IBAction func four(_ sender: Any) {
        calfield.text = calfield.text! + "4"
        actualcal = actualcal + "4"
        
    }
    @IBAction func five(_ sender: Any) {
        calfield.text = calfield.text! + "5"
        actualcal = actualcal + "5"
        
    }
    @IBAction func six(_ sender: Any) {
        calfield.text = calfield.text! + "6"
        actualcal = actualcal + "6"
        
    }
    @IBAction func seven(_ sender: Any) {
        calfield.text = calfield.text! + "7"
        actualcal = actualcal + "7"
        
    }
    @IBAction func eight(_ sender: Any) {
        calfield.text = calfield.text! + "8"
        actualcal = actualcal + "8"
        
    }
    @IBAction func nine(_ sender: Any) {
        calfield.text = calfield.text! + "9"
        actualcal = actualcal + "9"
        
    }
    @IBAction func plus(_ sender: Any) {
        calfield.text = calfield.text! + "+"
        actualcal = actualcal + "+"
        
    }
    @IBAction func minus (_ sender: Any) {
        calfield.text = calfield.text! + "-"
        actualcal = actualcal + "-"
        
    }
    @IBAction func devide (_ sender: Any) {
        calfield.text = calfield.text! + "/"
        actualcal = actualcal + "/"
        
    }
    @IBAction func gop (_ sender: Any) {
        calfield.text = calfield.text! + "*"
        actualcal = actualcal + "*"
        
    }
    @IBAction func ln (_ sender: Any) {
        calfield.text = calfield.text! + "ln("
        actualcal = actualcal + "1/log(M_E)*log("
        
    }
    @IBAction func Pi (_ sender: Any) {
        calfield.text = calfield.text! + "π"
        actualcal = actualcal + "M_PI"
        
    }
    @IBAction func AC(_ sender: Any) {
        calfield.text = ""
        actualcal = ""
        
    }
    @IBAction func root(_ sender: Any) {
        calfield.text = calfield.text! + "√("
        actualcal = actualcal + "sqrt("
        
    }
    @IBAction func exp(_ sender: Any) {
        calfield.text = calfield.text! + "e^("
        actualcal = actualcal + "exp("
        
    }
    @IBAction func minuus(_ sender: Any) {
        calfield.text = calfield.text! + "(-)"
        actualcal = actualcal + "-1*"
        
    }
    @IBAction func x(_ sender: Any) {
        calfield.text = calfield.text! + "x"
        actualcal = actualcal + "x"
        
    }
    @IBAction func pow(_ sender: Any) {
        calfield.text = calfield.text! + "x^("
        actualcal = actualcal + "pow(x, "
        
    }
    @IBAction func sin(_ sender: Any) {
        calfield.text = calfield.text! + "sin("
        actualcal = actualcal + "sin("
        
    }
    @IBAction func cos(_ sender: Any) {
        calfield.text = calfield.text! + "cos("
        actualcal = actualcal + "cos("
        
    }
    @IBAction func tan(_ sender: Any) {
        calfield.text = calfield.text! + "tan("
        actualcal = actualcal + "tan("
        
    }
    @IBAction func left(_ sender: Any) {
        calfield.text = calfield.text! + "("
        actualcal = actualcal + "("
        
    }
    @IBAction func right(_ sender: Any) {
        calfield.text = calfield.text! + ")"
        actualcal = actualcal + ")"
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        calfield.isEnabled = false
        // Do any additional setup after loading the view.
    }
    @IBAction func draw(_ sender: Any) {
        print(actualcal)
        let VC = storyboard!.instantiateViewController(withIdentifier: "DrawGragh") as! DrawGragh
        VC.passedstring = actualcal
        navigationController?.pushViewController(VC, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

class DrawGragh: UIViewController {
    
    var passedstring = ""
    
    override func viewDidLoad() {
        
        let drawimage = drawLine()
        let drawview = UIImageView(image: drawimage)
        view.addSubview(drawview)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawLine() -> UIImage {
        let Z = passedstring
        
        var pointList = Array<CGPoint>()
        var pointLista = Array<CGPoint>()
        var pointListb = Array<CGPoint>()
        var pointListx = Array<CGPoint>()
        var pointListy = Array<CGPoint>()
        
        var pointListar = Array<CGPoint>()
        
        let pointCount = 300
        
        let dx = Double(view.frame.width) / Double(pointCount)
        
        for x in 15 ... pointCount - 15 {
            let px = CGFloat(dx * Double(x))
            let py = CGFloat(Double(Z)!)
            let point = CGPoint(x: px, y: py)
            pointList.append(point)
        }
        
        //let pxv = CGFloat(-1 * Z * 5 * graghSizeRate + Double(view.frame.width) / 2)
        
        //let pxu = CGFloat(Z * 5 * graghSizeRate + Double(view.frame.width) / 2)
        let pyub = CGFloat(405)
        
//        pointListar.append(CGPoint(x: pxv,y: pyub))
        
        //for q in Int(-1 * Z * 5 * graghSizeRate + Double(view.frame.width) / 2) * pointCount / Int(view.frame.width) ... pointCount - Int(-1 * Z * 5 * graghSizeRate + Double(view.frame.width) / 2) * pointCount / Int(view.frame.width) {
//            let px = CGFloat(dx * Double(q))
//            let py = CGFloat(400 - 700 * (pow(M_E, (pow(((dx * Double(q)) - (Double(view.frame.width) / 2)) / 70, 2)/(-2))) / sqrt(2*Double.pi)))
//            let point = CGPoint(x: px, y: py)
//            pointListar.append(point)
//        }
        
//        pointListar.append(CGPoint(x: pxu, y: pyub))
        
        let pxa = CGFloat(20)
        let pxb = CGFloat(Double(view.frame.width) - 20)
        let pya = CGFloat(405)
        
        let pxc = CGFloat(CGFloat(Double(view.frame.width)) / 2)
        let pyb = CGFloat(80)
        let pyc = CGFloat(450)
        
        let pxxa = CGFloat(Double(view.frame.width) - 30)
        let pyxa = CGFloat(395)
        let pyxb = CGFloat(415)
        
        let pxya = CGFloat(CGFloat(Double(view.frame.width)) / 2 - 10)
        let pxyb = CGFloat(CGFloat(Double(view.frame.width)) / 2 + 10)
        let pyy = CGFloat(90)
        
        let pointa = CGPoint(x: pxa, y: pya)
        let pointb = CGPoint(x: pxb, y: pya)
        
        let pointc = CGPoint(x: pxc, y: pyb)
        let pointd = CGPoint(x: pxc, y: pyc)
        
        let pointxa = CGPoint(x: pxxa, y: pyxa)
        let pointxb = CGPoint(x: pxb, y: pya)
        let pointxc = CGPoint(x: pxxa, y: pyxb)
        
        let pointya = CGPoint(x: pxya, y: pyy)
        let pointyb = CGPoint(x: pxc, y: pyb)
        let pointyc = CGPoint(x: pxyb, y: pyy)
        
        pointLista.append(pointa)
        pointLista.append(pointb)
        
        pointListb.append(pointc)
        pointListb.append(pointd)
        
        pointListx.append(pointxa)
        pointListx.append(pointxb)
        pointListx.append(pointxc)
        
        pointListy.append(pointya)
        pointListy.append(pointyb)
        pointListy.append(pointyc)
        
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        
        let drawpath = UIBezierPath()
        let drawpatha = UIBezierPath()
        let drawpathb = UIBezierPath()
        let drawpathx = UIBezierPath()
        let drawpathy = UIBezierPath()
        let drawpathar = UIBezierPath()
        
        drawpath.move(to: pointList[0])
        drawpatha.move(to: pointLista[0])
        drawpathb.move(to: pointListb[0])
        drawpathx.move(to: pointListx[0])
        drawpathy.move(to: pointListy[0])
        drawpathar.move(to: pointListar[0])
        
        pointListar.removeFirst()
        for par in pointListar {
            drawpathar.addLine(to: par)
        }
        pointList.removeFirst()
        for pt in pointList {
            drawpath.addLine(to: pt)
        }
        pointLista.removeFirst()
        for pk in pointLista {
            drawpatha.addLine(to: pk)
        }
        pointListb.removeFirst()
        for ps in pointListb {
            drawpathb.addLine(to: ps)
        }
        pointListx.removeFirst()
        for pa in pointListx {
            drawpathx.addLine(to: pa)
        }
        pointListy.removeFirst()
        for pu in pointListy {
            drawpathy.addLine(to: pu)
        }
        
        drawpath.lineWidth = 1.0
        drawpatha.lineWidth = 0.5
        drawpathb.lineWidth = 0.5
        drawpathx.lineWidth = 0.5
        drawpathy.lineWidth = 0.5
        
        drawpathar.lineWidth = 0.5
        
        drawpath.lineJoinStyle = .round
        drawpatha.lineJoinStyle = .round
        drawpathb.lineJoinStyle = .round
        drawpathx.lineJoinStyle = .round
        drawpathy.lineJoinStyle = .round
        
        drawpathar.lineJoinStyle = .round
        
        let RGB: UInt32 = 0x6AD0E3
        let red = (RGB & 0xFF0000) >> 16
        let green = (RGB & 0x00FF00) >> 8
        let blue = RGB & 0x0000FF
        
        let R = CGFloat(red)/255
        let G = CGFloat(green)/255
        let B = CGFloat(blue)/255
        
        UIColor.black.setStroke()
        UIColor(red:R,green:G,blue:B,alpha:1).setFill()
        
        drawpathar.fill()
        
        drawpath.stroke()
        drawpathar.stroke()
        drawpatha.stroke()
        drawpathb.stroke()
        drawpathx.stroke()
        drawpathy.stroke()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
}

