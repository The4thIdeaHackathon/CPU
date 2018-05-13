//
//  DrawGraphViewController.swift
//  PocketLab
//
//  Created by 배문기 on 2018. 5. 12..
//  Copyright © 2018년 배문기. All rights reserved.
//

import UIKit

class DrawGraphViewController: UIViewController {

    func drawLine() -> UIImage {
        
        var pointList = Array<CGPoint>()
        var pointLista = Array<CGPoint>()
        var pointListb = Array<CGPoint>()
        var pointListx = Array<CGPoint>()
        var pointListy = Array<CGPoint>()
        
        var pointListar = Array<CGPoint>()
        
        let pointCount = 10000
        
        let dx = Double(view.frame.width) / Double(pointCount)
        
        for x in 1000 - pointCount/2 ... pointCount/2 - 1000 {
            let px = CGFloat(dx * Double(x) + Double(view.frame.width)/2)
            let py = CGFloat(415 + -Double(x + pointCount/2)*exp(-Double(x + pointCount/2)*dx/30))
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
        let pyc = CGFloat(600)
        
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
        //drawpathar.move(to: pointListar[0])
        
        //        pointListar.removeFirst()
        //        for par in pointListar {
        //            drawpathar.addLine(to: par)
        //        }
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
        
        //        drawpathar.lineWidth = 0.5
        
        drawpath.lineJoinStyle = .round
        drawpatha.lineJoinStyle = .round
        drawpathb.lineJoinStyle = .round
        drawpathx.lineJoinStyle = .round
        drawpathy.lineJoinStyle = .round
        
        //        drawpathar.lineJoinStyle = .round
        
        let RGB: UInt32 = 0x6AD0E3
        let red = (RGB & 0xFF0000) >> 16
        let green = (RGB & 0x00FF00) >> 8
        let blue = RGB & 0x0000FF
        
        let R = CGFloat(red)/255
        let G = CGFloat(green)/255
        let B = CGFloat(blue)/255
        
        UIColor.black.setStroke()
        UIColor(red:R,green:G,blue:B,alpha:1).setFill()
        
        //        drawpathar.fill()
        
        drawpath.stroke()
        //        drawpathar.stroke()
        drawpatha.stroke()
        drawpathb.stroke()
        drawpathx.stroke()
        drawpathy.stroke()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let drawimage = drawLine()
        let drawview = UIImageView(image: drawimage)
        view.addSubview(drawview)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class SecondDrawGraphViewController: UIViewController {

    func drawLine() -> UIImage {
        
        var pointList = Array<CGPoint>()
        var pointLista = Array<CGPoint>()
        var pointListb = Array<CGPoint>()
        var pointListx = Array<CGPoint>()
        var pointListy = Array<CGPoint>()
        
        var pointListar = Array<CGPoint>()
        
        let pointCount = 10000
        
        let dx = Double(view.frame.width) / Double(pointCount)
        
        for x in 1000 - pointCount/2 ... pointCount/2 - 1000 {
            let px = CGFloat(dx * Double(x) + Double(view.frame.width)/2)
            let py = CGFloat(395 + -exp(-Double(x)*dx/30))
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
        let pyc = CGFloat(600)
        
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
        //drawpathar.move(to: pointListar[0])
        
        //        pointListar.removeFirst()
        //        for par in pointListar {
        //            drawpathar.addLine(to: par)
        //        }
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
        
        //        drawpathar.lineWidth = 0.5
        
        drawpath.lineJoinStyle = .round
        drawpatha.lineJoinStyle = .round
        drawpathb.lineJoinStyle = .round
        drawpathx.lineJoinStyle = .round
        drawpathy.lineJoinStyle = .round
        
        //        drawpathar.lineJoinStyle = .round
        
        let RGB: UInt32 = 0x6AD0E3
        let red = (RGB & 0xFF0000) >> 16
        let green = (RGB & 0x00FF00) >> 8
        let blue = RGB & 0x0000FF
        
        let R = CGFloat(red)/255
        let G = CGFloat(green)/255
        let B = CGFloat(blue)/255
        
        UIColor.black.setStroke()
        UIColor(red:R,green:G,blue:B,alpha:1).setFill()
        
        //        drawpathar.fill()
        
        drawpath.stroke()
        //        drawpathar.stroke()
        drawpatha.stroke()
        drawpathb.stroke()
        drawpathx.stroke()
        drawpathy.stroke()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let drawimage = drawLine()
        let drawview = UIImageView(image: drawimage)
        view.addSubview(drawview)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
class ThirdDrawGraphViewController: UIViewController {
    
    func drawLine() -> UIImage {
        
        var pointList = Array<CGPoint>()
        var pointLista = Array<CGPoint>()
        var pointListb = Array<CGPoint>()
        var pointListx = Array<CGPoint>()
        var pointListy = Array<CGPoint>()
        
        var pointListar = Array<CGPoint>()
        
        let pointCount = 10000
        
        let dx = Double(view.frame.width) / Double(pointCount)
        
        for x in 1000 - pointCount/2 ... pointCount/2 - 1000 {
            let px = CGFloat(dx * Double(x) + Double(view.frame.width)/2)
            let py = CGFloat(405 +  -exp(-Double(x)*dx / 180) * sin(Double(x)*dx/10)*20)
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
        let pyc = CGFloat(600)
        
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
        //drawpathar.move(to: pointListar[0])
        
        //        pointListar.removeFirst()
        //        for par in pointListar {
        //            drawpathar.addLine(to: par)
        //        }
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
        
        //        drawpathar.lineWidth = 0.5
        
        drawpath.lineJoinStyle = .round
        drawpatha.lineJoinStyle = .round
        drawpathb.lineJoinStyle = .round
        drawpathx.lineJoinStyle = .round
        drawpathy.lineJoinStyle = .round
        
        //        drawpathar.lineJoinStyle = .round
        
        let RGB: UInt32 = 0x6AD0E3
        let red = (RGB & 0xFF0000) >> 16
        let green = (RGB & 0x00FF00) >> 8
        let blue = RGB & 0x0000FF
        
        let R = CGFloat(red)/255
        let G = CGFloat(green)/255
        let B = CGFloat(blue)/255
        
        UIColor.black.setStroke()
        UIColor(red:R,green:G,blue:B,alpha:1).setFill()
        
        //        drawpathar.fill()
        
        drawpath.stroke()
        //        drawpathar.stroke()
        drawpatha.stroke()
        drawpathb.stroke()
        drawpathx.stroke()
        drawpathy.stroke()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let drawimage = drawLine()
        let drawview = UIImageView(image: drawimage)
        view.addSubview(drawview)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
class FinalDrawGraphViewController: UIViewController {
    func drawLine() -> UIImage {
        
        var pointList = Array<CGPoint>()
        var pointLista = Array<CGPoint>()
        var pointListb = Array<CGPoint>()
        var pointListx = Array<CGPoint>()
        var pointListy = Array<CGPoint>()
        
        var pointListar = Array<CGPoint>()
        
        let pointCount = 1000000
        
        let dx = Double(view.frame.width) / Double(pointCount)
        
        for x in 100000 - pointCount/2 ... pointCount/2 - 100000 {
            let px = CGFloat(dx * Double(x) + Double(view.frame.width)/2)
            let py = CGFloat(405 + 100 * -sin(Double(x)*dx/20))
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
        let pyc = CGFloat(600)
        
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
        //drawpathar.move(to: pointListar[0])
        
//        pointListar.removeFirst()
//        for par in pointListar {
//            drawpathar.addLine(to: par)
//        }
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
        
//        drawpathar.lineWidth = 0.5
        
        drawpath.lineJoinStyle = .round
        drawpatha.lineJoinStyle = .round
        drawpathb.lineJoinStyle = .round
        drawpathx.lineJoinStyle = .round
        drawpathy.lineJoinStyle = .round
        
//        drawpathar.lineJoinStyle = .round
        
        let RGB: UInt32 = 0x6AD0E3
        let red = (RGB & 0xFF0000) >> 16
        let green = (RGB & 0x00FF00) >> 8
        let blue = RGB & 0x0000FF
        
        let R = CGFloat(red)/255
        let G = CGFloat(green)/255
        let B = CGFloat(blue)/255
        
        UIColor.black.setStroke()
        UIColor(red:R,green:G,blue:B,alpha:1).setFill()
        
//        drawpathar.fill()
        
        drawpath.stroke()
//        drawpathar.stroke()
        drawpatha.stroke()
        drawpathb.stroke()
        drawpathx.stroke()
        drawpathy.stroke()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let drawimage = drawLine()
        let drawview = UIImageView(image: drawimage)
        view.addSubview(drawview)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }    
}


