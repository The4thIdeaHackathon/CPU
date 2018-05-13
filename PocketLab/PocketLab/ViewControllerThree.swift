//
//  ViewControllerThree.swift
//  PocketLab
//
//  Created by 배문기 on 2018. 5. 11..
//  Copyright © 2018년 배문기. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBAction func GoOne(_ sender: Any) {
        let VC = storyboard!.instantiateViewController(withIdentifier: "Oneprimeequ") as! Oneprimeequ
        
        navigationController?.pushViewController(VC, animated: true)
    }
    
    
    @IBAction func GoConDou(_ sender: Any) {
        let VC = storyboard!.instantiateViewController(withIdentifier: "DoublePrimeEqu") as! DoublePrimeEqu
        
        navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func GoECDou(_ sender: Any) {
        let VC = storyboard!.instantiateViewController(withIdentifier: "ECDoublePrime") as! ECDoublePrime
        
        navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func GoHigh(_ sender: Any) {
        let VC = storyboard!.instantiateViewController(withIdentifier: "HighPrimeEqu") as! HighPrimeEqu
        
        navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func GoECHigh(_ sender: Any) {
        let VC = storyboard!.instantiateViewController(withIdentifier: "ECHighPrimeEqu") as! ECHighPrimeEqu
        
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

class Oneprimeequ: UIViewController {
    
    @IBAction func tapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    var result = ""
    
    
    @IBOutlet weak var resultt: UIButton!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var solution: UILabel!
    
    @IBOutlet weak var integralpx: UITextField!
    @IBOutlet weak var rx: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        solution.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func GetResult(_ sender: Any) {
        
        if integralpx.text == "" || rx.text == "" {
            info.text = "값을 입력해주세요"
        }
        else {
            info.text = "y' + p(x)y = r(x)"
            result = "exp(-" + integralpx.text! + ")∫ exp(" + integralpx.text! + ")" + rx.text! + " dx + c"
            solution.isHidden = false
            rx.isHidden = true
            integralpx.isHidden = true
            resultt.isHidden = true
            solution.text = "f(x)y' + f(x)p(x)y = f(x)r(x)\n\nf(x)p(x) = f'(x)\n\nln|f| = ∫ p dx\n\nf = exp(∫ p dx)\n\n∴  y = exp(-∫ p dx)∫ exp(∫ p dx)r(x) dx + c\n\n∴  y = " + result
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class DoublePrimeEqu: UIViewController {
    
    @IBAction func tapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var solution: UILabel!
    
    @IBOutlet weak var yp: UITextField!
    @IBOutlet weak var getre: UIButton!
    @IBOutlet weak var a: UITextField!
    @IBOutlet weak var b: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        solution.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func GetResult(_ sender: Any) {
        if yp.text == "" || a.text == "" || b.text == ""{
            info.text = "값을 입력해주세요"
        }
        else {
            info.text = "y'' + ay' + by = r(x)"
            var resulta = (-Double(a.text!)! + sqrt(pow(Double(a.text!)!, 2) - 4 * Double(b.text!)!)) / 2
            var resultb = (-Double(a.text!)! - sqrt(pow(Double(a.text!)!, 2) - 4 * Double(b.text!)!)) / 2
            yp.isHidden = true
            solution.isHidden = false
            b.isHidden = true
            a.isHidden = true
            getre.isHidden = true
            if pow(Double(a.text!)!, 2) - 4 * Double(b.text!)! > 0 {
                
                solution.text = "특성방정식 m^2 + " + a.text! + "m + " + b.text! + " = 0\n\n\n에서 m = " + String(format: "%.3f", resulta) + " or " + String(format: "%.3f", resultb) + "이다.\n\n\n∴  Yh = A exp(" + String(format: "%.3f", resulta) + ") + B exp(" + String(format: "%.3f", resultb) + ")"
            }
            else if pow(Double(a.text!)!, 2) - 4 * Double(b.text!)! == 0 {
                solution.text = "특성방정식 m^2 + " + a.text! + "m + " + b.text! + " = 0\n\n\n에서 m = " + String(format: "%.3f", resulta) + " 으로 중근이다.\n\n\n∴  Yh = A exp(" + String(format: "%.3f", resulta) + ") + B x exp(" + String(format: "%.3f", resulta) + ")"
            }
            else{
                resulta = (-Double(a.text!)! + sqrt((pow(Double(a.text!)!, 2) - 4 * Double(b.text!)!).magnitude).magnitude) / 2
                resultb = (-Double(a.text!)! - sqrt((pow(Double(a.text!)!, 2) - 4 * Double(b.text!)!).magnitude)) / 2
                let minus = -Double(a.text!)! / 2
                let inst = sqrt((pow(Double(a.text!)!, 2) - 4 * Double(b.text!)!).magnitude) / 2
                    solution.text = "특성방정식 m^2 + " + a.text! + "m + " + b.text! + " = 0\n\n\n에서 m = " + String(format: "%.3f", minus) + String(format: "%.3f", inst) + " i " + "or" + String(format: "%.3f", minus) + String(format: "%.3f", -inst) + " i " + "이다. 허근이므로\n\n\n∴  Yh = A exp(-" + a.text! + "x/2) cos" + String(format: "%.3f", inst) + "x\n+ B exp(-" + a.text! + "x/2) sin" + String(format: "%.3f", inst) + "x"
            }
            if yp.text != "" || yp.text != "0" {
                solution.text = solution.text! + " + " + yp.text!
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class ECDoublePrime: UIViewController {
    
    @IBAction func tapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBOutlet weak var yp: UITextField!
    @IBOutlet weak var solution: UILabel!
    
    @IBOutlet weak var getre: UIButton!
    @IBOutlet weak var Equation: UILabel!
    
    @IBOutlet weak var a: UITextField!
    @IBOutlet weak var b: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let font:UIFont? = UIFont(name: "Helvetica", size:20)
        let fontSuper:UIFont? = UIFont(name: "Helvetica", size:10)
        let attString:NSMutableAttributedString = NSMutableAttributedString(string: "x2y'' + axy' + by = r(x)", attributes: [.font:font!])
        attString.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:1,length:1))
        Equation.attributedText = attString
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func GetResult(_ sender: Any) {
        
        if yp.text == "" || a.text == "" || b.text == ""{
            Equation.text = "값을 입력해주세요"
        }
        else {
            
            let font:UIFont? = UIFont(name: "Helvetica", size:20)
            let fontSuper:UIFont? = UIFont(name: "Helvetica", size:10)
            let attString:NSMutableAttributedString = NSMutableAttributedString(string: "x2y'' + axy' + by = r(x)", attributes: [.font:font!])
            attString.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:1,length:1))
            Equation.attributedText = attString
            
            solution.isHidden = false
            b.isHidden = true
            a.isHidden = true
            getre.isHidden = true
            
            let inta = Int(a.text!)! - 1
            
            var resulta = (-Double(inta) + sqrt(pow(Double(inta), 2) - 4 * Double(b.text!)!)) / 2
            var resultb = (-Double(inta) - sqrt(pow(Double(inta), 2) - 4 * Double(b.text!)!)) / 2
            
            if pow(Double(inta), 2) - 4 * Double(b.text!)! > 0 {
                solution.text = "특성방정식 m^2 + " + String(inta) + "m + " + b.text! + " = 0\n\n\n에서 m = " + String(format: "%.3f", resulta) + " or " + String(format: "%.3f", resultb) + "이다.\n\n\n∴  Yh = A x^" + String(resulta) + " + B x^" + String(resultb)

            }
            else if pow(Double(inta), 2) - 4 * Double(b.text!)! == 0 {
                    solution.text = "특성방정식 m^2 + " + String(inta) + "m + " + b.text! + " = 0\n\n\n에서 m = " + String(format: "%.3f", resulta) + " 으로 중근이다.\n\n\n∴  y = A x^" + String(format: "%.3f", resulta) + " + B x^" + String(format: "%.3f", resulta) + "ln x"
            }
            else{
                resulta = (-Double(inta) + sqrt((pow(Double(inta), 2) - 4 * Double(b.text!)!).magnitude).magnitude) / 2
                resultb = (-Double(inta) - sqrt((pow(Double(inta), 2) - 4 * Double(b.text!)!).magnitude)) / 2
                let minus = -Double(inta) / 2
                let inst = sqrt((pow(Double(inta), 2) - 4 * Double(b.text!)!).magnitude) / 2
                
                solution.text = "특성방정식 m^2 + " + String(inta) + "m + " + b.text! + " = 0\n\n\n에서 m = " + String(format: "%.3f", minus) + String(format: "%.3f", inst) + " i " + "or" + String(format: "%.3f", minus) + String(format: "%.3f", -inst) + " i " + "이다. 허근이므로\n\n\n∴  Y = A x^(-" + a.text! + "x/2) cos(" + String(format: "%.3f", inst) + "ln x)\n+ B x^(-" + a.text! + "x/2) sin(" + String(format: "%.3f", inst) + "ln x)"
                solution.text = "특성방정식 m^2 + " + String(inta) + "m + " + b.text! + " = 0\n\n\n에서 m = " + String(format: "%.3f", minus) + String(format: "%.3f", inst) + " i " + "or" + String(format: "%.3f", minus) + String(format: "%.3f", -inst) + " i " + "이다. 허근이므로\n\n\n∴  Y = A x^(-" + a.text! + "x/2) cos(" + String(format: "%.3f", inst) + "ln x)\n+ B x^(-" + a.text! + "x/2) sin(" + String(format: "%.3f", inst) + "ln x)"
                if yp.text != "" || yp.text != "0" {
                    solution.text = solution.text! + " + " + yp.text!
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class HighPrimeEqu: UIViewController {
    
    @IBAction func tapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBOutlet weak var ConstEqua: UILabel!
    @IBOutlet weak var Eculabel: UILabel!
    @IBOutlet weak var Calout: UIButton!
    @IBOutlet weak var NumOfEcu: UITextField!
    @IBOutlet weak var Infolabel: UILabel!
    
    @IBAction func StartCal(_ sender: Any) {
        
        let info = Int(NumOfEcu.text!)
        
        if Int(NumOfEcu.text!)! < 3 || Int(NumOfEcu.text!)! > 5 {
            NumOfEcu.text = ""
            Infolabel.text = "3 ~ 5 사이의 수를 입력해주세요!"
        }
        else {
            Calout.isHidden = true
            NumOfEcu.isHidden = true
            Infolabel.isHidden = true
            Eculabel.isHidden = false
            ConstEqua.isHidden = false
            
            if info == 3 {
                Eculabel.text = "y''' + ay'' + by' + cy = r(x)"
                ConstEqua.text = "특성방정식 : \nm^3 + am^2 + bm + c 이 나옵니다.\n\n\n이를 이용하여, 3계상미분 방정식이므로\n\n\n실근 : Yh = Aexp(m(1)x) + Bexp(m(2)x) + Cexp(m(3)x)\n\n\n에서 중근일때는 x및 x^2을 곱하여 표현\n\n\n허근일때는 sin, cos으로 표현합니다."
            }
            else if info == 4 {
                Eculabel.text = "y'''' + ay''' + by'' + cy' + dy = r(x)"
                ConstEqua.text = "특성방정식 : \nm^4 + am^3 + bm^2 + cm + d 이 나옵니다.\n\n\n이를 이용하여, 4계상미분 방정식이므로\n\n\n실근 : Yh = Aexp(m(1)x) + Bexp(m(2)x) + Cexp(m(3)x) + Dexp(m(4)x)\n\n\n에서 중근일때는 x및 x^2및 x^3을 곱하여 표현\n\n\n허근일때는 sin, cos으로 표현합니다."
            }
            else {
                Eculabel.text = "y''''' + ay'''' + by''' + cy'' + dy' + ey = r(x)"
                ConstEqua.text = "특성방정식 : \nm^5 + am^4 + bm^3 + cm^2 + dm + e 이 나옵니다.\n\n\n이를 이용하여, 4계상미분 방정식이므로\n\n\n실근 : Yh = Aexp(m(1)x) + Bexp(m(2)x) + Cexp(m(3)x) + Dexp(m(4)x) + Eexp(m(5))\n\n\n에서 중근일때는 x및 x^2및 x^3및 x^4을 곱하여 표현\n\n\n허근일때는 sin, cos으로 표현합니다."
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ConstEqua.isHidden = true
        Eculabel.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class ECHighPrimeEqu: UIViewController {
    
    @IBAction func tapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBOutlet weak var ECEqua: UILabel!
    @IBOutlet weak var Eculabel: UILabel!
    @IBOutlet weak var Calout: UIButton!
    @IBOutlet weak var NumOfEcu: UITextField!
    @IBOutlet weak var Infolabel: UILabel!
    
    @IBAction func StartCal(_ sender: Any) {
        
        let info = Int(NumOfEcu.text!)
        
        if info! < 3 || info! > 5 {
            NumOfEcu.text = ""
            Infolabel.text = "3 ~ 5 사이의 수를 입력해주세요!"
        }
        else {
            ECEqua.isHidden = false
            Calout.isHidden = true
            NumOfEcu.isHidden = true
            Infolabel.isHidden = true
            Eculabel.isHidden = false
            Eculabel.text = ""
            if info == 3 {
                Eculabel.text = "x^3y''' + ax^2y'' + bxy' + cy = r(x)"
                ECEqua.text = "특성방정식 : \n\nm^3 + (a - 3)m^2 + \n(2 - a)m + c 이 나옵니다.\n\n\n이를 이용하여, 3계상미분 방정식이므로\n\n\n실근 : Yh = Ax^(m(1)x) + Bx^(m(2)x) + Cx^(m(3)x)\n\n\n에서 중근일때는 ln(x)및 (ln(x))^2을 곱하여 표현\n\n\n허근일때는 sin, cos으로 표현합니다."
            }
            else if info == 4 {
                Eculabel.text = "x^4y'''' + ax^3y''' + bx^2y'' + cxy' + dy = r(x)"
                ECEqua.text = "특성방정식 : \n\nm^4 + (a - 6)m^3 + (11 - 3a + b)m^2\n+ (6 + 2a - b + c)m + d 이 나옵니다.\n\n\n이를 이용하여, 4계상미분 방정식이므로\n\n\n실근 : Yh = Aexp(m(1)x) + Bexp(m(2)x) + Cexp(m(3)x) + Dexp(m(4)x)\n\n\n에서 중근일때는 ln(x)및 (ln(x))^2및 (ln(x))^3을 곱하여 표현\n\n\n허근일때는 sin, cos으로 표현합니다."
            }
            else {
                Eculabel.text = "x^5y''''' + ax^4y'''' + bx^3y''' + cx^2y'' + dxy' + ey = r(x)"
                ECEqua.text = "특성방정식 : \n\nx^5 + (a - 10)m^4 + (35 - 6a + b)m^3\n+ (11a - 50 - 3b + c)m^2\n+ (24 - 6a + 2b - c + d)m + e 이 나옵니다.\n\n\n이를 이용하여, 4계상미분 방정식이므로\n\n\n실근 : Yh = Aexp(m(1)x) + Bexp(m(2)x) + Cexp(m(3)x) + Dexp(m(4)x) + Eexp(m(5))\n\n\n에서 중근일때는 ln(x)및 (ln(x))^2및 (ln(x))^3및 (ln(x))^4을 곱하여 표현\n\n\n허근일때는 sin, cos으로 표현합니다."
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Eculabel.isHidden = true
        ECEqua.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



