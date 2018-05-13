//
//  ViewControllerTwo.swift
//  PocketLab
//
//  Created by 배문기 on 2018. 5. 11..
//  Copyright © 2018년 배문기. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBAction func tapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    var average = 0.0 // 평균
    var standardDeviation = 0.0// 표준편차
    
    @IBOutlet weak var nextview: UIButton!
    
    var Secondstringpassed : [Double] = []
    @IBOutlet var textfielda : [UITextField] = []
    
    @IBOutlet weak var Systemlabel: UILabel!
    
    @IBOutlet weak var theoryValue: UITextField!
    
    var i = 0
    
    @IBOutlet weak var averageText: UILabel!
    @IBOutlet weak var sDeviationText: UILabel!
    @IBOutlet weak var rErrorText: UILabel!
    @IBOutlet weak var rSDeviationText: UILabel!
    
    
    @IBAction func GoNext(_ sender: Any) {
        let VC = storyboard!.instantiateViewController(withIdentifier: "FinalViewController") as! FinalViewController
        
        VC.passedstring.append(average)
        VC.passedstring.append(standardDeviation)
        VC.passedstring.append(Double(theoryValue.text!)!)
        navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func GoSys(_ sender: Any) {
        let VC = storyboard!.instantiateViewController(withIdentifier: "SystemViewController") as! SystemViewController
        for k in 0 ... i - 1 {
            VC.stringPassed.append(Double(textfielda[k].text!) ?? 0)
        }
        VC.stringPassed.append(Double(theoryValue.text!) ?? 0) // i 번째 방
        VC.stringPassed.append(Double(i))
        
        navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func GoResult(_ sender: Any) {
            
            // averageText, devitationText, rErrorText, rSDeviationText
        
        nextview.isHidden = false
        
        let theoryval = Double(theoryValue.text!) ?? 0
        var sum = 0.0 // 합계
        var sumsquare = 0.0 // 제곱의 합계
        var rError = 0.0 // 상대오차
        var rStandardDeviation = 0.0 // 상대표준편차
        
        if theoryval == 0 {
            theoryValue.placeholder = "입력해주세요"
        }
        else {
            for arrnum in 0 ... i - 1 {
                sum += (Double(textfielda[arrnum].text!) ?? 0)
            }
            
            for arrnum in 0 ... i - 1 {
                sumsquare += pow(Double(textfielda[arrnum].text!) ?? 0, 2)
            }
            
            average = sum / Double(i)
            if Systemlabel.text == "계통오차" {
                standardDeviation = sqrt(((sumsquare / Double(i)) - pow(average, 2)) / Double(i))
            }
            else {
                standardDeviation = sqrt(((sumsquare / Double(i)) - pow(average, 2)) / Double(i) + pow(Double(Systemlabel.text!)!, 2))
            }
            rError = (average - theoryval) / theoryval * 100
            rStandardDeviation = (standardDeviation / average) * 100
            
            averageText.text = "평균값 : " + String(format: "%.3f", average)
            sDeviationText.text = "표준편차 : " + String(format: "%.3f", standardDeviation)
            rErrorText.text = "상대오차(오차율) : " + String(format: "%.3f", rError) + " %"
            rSDeviationText.text = "상대표준편차 : " + String(format: "%.3f", rStandardDeviation) + " % RSD"
        }
    }
    
    @IBAction func Minus(_ sender: Any) {
        if i != 0 {
            i = i - 1
            textfielda[i].isHidden = true
            textfielda[i].text = ""
            textfielda.removeLast()
        }
    }
    
    @IBAction func Plus(_ sender: Any) {
        textfielda.append(UITextField())
        
        textfielda[i].frame = CGRect(x : 37 + 120 * (i % 3), y : 100 + 50 * (i / 3), width : 100, height : 30)
        
        textfielda[i].placeholder = "실험값"
        textfielda[i].textAlignment = .center
        textfielda[i].font = UIFont.systemFont(ofSize: 15)
        textfielda[i].textColor = UIColor.black
        textfielda[i].backgroundColor = UIColor.white
        textfielda[i].borderStyle = UITextBorderStyle.roundedRect
        textfielda[i].keyboardType = UIKeyboardType.numberPad
        textfielda[i].returnKeyType = UIReturnKeyType.done
        textfielda[i].clearButtonMode = UITextFieldViewMode.whileEditing;
        view.addSubview(textfielda[i])
        i = i + 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextview.isHidden = true
        
        if Secondstringpassed == [] {
            Systemlabel.text = "계통오차"
        }
        else {
            i = Int(Secondstringpassed.last!)
            theoryValue.text = String(Int(Secondstringpassed[i]))
            Systemlabel.text = String(Secondstringpassed[i + 1])
            for k in 0 ... i - 1 {
                textfielda.append(UITextField())
                
                textfielda[k].frame = CGRect(x : 37 + 120 * (k % 3), y : 100 + 50 * (k / 3), width : 100, height : 30)
                
                textfielda[k].placeholder = "실험값"
                textfielda[k].textAlignment = .center
                textfielda[k].font = UIFont.systemFont(ofSize: 15)
                textfielda[k].textColor = UIColor.black
                textfielda[k].backgroundColor = UIColor.white
                textfielda[k].borderStyle = UITextBorderStyle.roundedRect
                textfielda[k].keyboardType = UIKeyboardType.numberPad
                textfielda[k].returnKeyType = UIReturnKeyType.done
                textfielda[k].clearButtonMode = UITextFieldViewMode.whileEditing;
                view.addSubview(textfielda[k])
                
                textfielda[k].text = String(Int(Secondstringpassed[k]))
            }
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

class SystemViewController: UIViewController {
    
    
    @IBAction func tapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBOutlet var textfielda : [UITextField] = []
    var stringPassed : [Double] = []
    var i = 0
    
    @IBAction func Minus(_ sender: Any) {
        if i != 0 {
            i = i - 1
            textfielda[i].isHidden = true
            textfielda[i].text = ""
            textfielda.removeLast()
        }
    }
    
    @IBAction func Plus(_ sender: Any) {
        textfielda.append(UITextField())
        
        textfielda[i].frame = CGRect(x : 37 + 120 * (i % 3), y : 100 + 50 * (i / 3), width : 100, height : 30)
        
        textfielda[i].placeholder = "계통오차"
        textfielda[i].textAlignment = .center
        textfielda[i].font = UIFont.systemFont(ofSize: 15)
        textfielda[i].textColor = UIColor.black
        textfielda[i].backgroundColor = UIColor.white
        textfielda[i].borderStyle = UITextBorderStyle.roundedRect
        textfielda[i].keyboardType = UIKeyboardType.numberPad
        textfielda[i].returnKeyType = UIReturnKeyType.done
        textfielda[i].clearButtonMode = UITextFieldViewMode.whileEditing;
        view.addSubview(textfielda[i])
        i = i + 1
    }
    
    @IBAction func GoSecond(_ sender: Any) {
        var sumsquare = 0.0
        for arrnum in 0 ... i - 1 {
            sumsquare += pow(Double(textfielda[arrnum].text!) ?? 0, 2)
        }
        sumsquare = sqrt(sumsquare)
        let VC = storyboard!.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        for k in 0 ... Int(stringPassed.last!) - 1 {
        VC.Secondstringpassed.append(stringPassed[k])
        }
        VC.Secondstringpassed.append(stringPassed[Int(stringPassed.last!)])
        VC.Secondstringpassed.append(sumsquare)
        VC.Secondstringpassed.append(stringPassed.last!)
        
        navigationController?.pushViewController(VC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

class FinalViewController: UIViewController {
    
    @IBOutlet weak var analy: UILabel!
    
    var passedstring: [Double] = []
    
    func drawLine() -> UIImage {
        let Z = (passedstring[0] - passedstring[2]).magnitude / passedstring[1]
        
        var pointList = Array<CGPoint>()
        var pointLista = Array<CGPoint>()
        var pointListb = Array<CGPoint>()
        var pointListx = Array<CGPoint>()
        var pointListy = Array<CGPoint>()
        
        var pointListar = Array<CGPoint>()
        
        let graghSizeRate = 15 / sqrt(Z)
        
        let pointCount = 300
        
        let dx = Double(view.frame.width) / Double(pointCount)
        
        for n in Int(graghSizeRate) ... pointCount - Int(graghSizeRate) {
            let px = CGFloat(dx * Double(n))
            let py = CGFloat(400 - 700 * (pow(M_E, (pow(((dx * Double(n)) - (Double(view.frame.width) / 2)) / 70, 2)/(-2))) / sqrt(2*Double.pi)))
            let point = CGPoint(x: px, y: py)
            pointList.append(point)
        }
        
        let pxv = CGFloat(-1 * Z * 5 * graghSizeRate + Double(view.frame.width) / 2)
        
        let pxu = CGFloat(Z * 5 * graghSizeRate + Double(view.frame.width) / 2)
        let pyub = CGFloat(405)
        
        pointListar.append(CGPoint(x: pxv,y: pyub))
        
        for q in Int(-1 * Z * 5 * graghSizeRate + Double(view.frame.width) / 2) * pointCount / Int(view.frame.width) ... pointCount - Int(-1 * Z * 5 * graghSizeRate + Double(view.frame.width) / 2) * pointCount / Int(view.frame.width) {
            let px = CGFloat(dx * Double(q))
            let py = CGFloat(400 - 700 * (pow(M_E, (pow(((dx * Double(q)) - (Double(view.frame.width) / 2)) / 70, 2)/(-2))) / sqrt(2*Double.pi)))
            let point = CGPoint(x: px, y: py)
            pointListar.append(point)
        }
        
        pointListar.append(CGPoint(x: pxu, y: pyub))
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let Z = (passedstring[0] - passedstring[2]).magnitude / passedstring[1]
        
        var u = 0.0
        var e = 0.0
        
        while (u <= Z){
            e += (pow(M_E, (pow(u, 2)/(-2))) / sqrt(2*Double.pi)) * 0.0000001 * Z
            u += 0.0000001 * Z
        }
        
        let drawimage = drawLine()
        let drawview = UIImageView(image: drawimage)
        view.addSubview(drawview)
        if 2 * e < 0.6745 {
            analy.text = "\u{2022}  위 정규분포 그래프에서 넓이가 " + String(format: "%.3f", 2 * e) + "로 0.6745보다 작아 실험이 잘 되었습니다.\n\n\u{2022}  위 정규분포는 계통오차와 무작위오차의 RSS로 계산되었습니다."
        }
        else {
            analy.text = "\u{2022}  위 정규분포 그래프에서 넓이가 " + String(format: "%.3f", 2 * e) + "로 0.6745보다 커 offset 또는 재실험이 필요합니다.\n\n\u{2022}  위 정규분포는 계통오차와 무작위오차의 RSS로 계산되었습니다."
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
