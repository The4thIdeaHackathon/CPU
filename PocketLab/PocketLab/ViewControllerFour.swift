//
//  ViewControllerFour.swift
//  PocketLab
//
//  Created by 배문기 on 2018. 5. 11..
//  Copyright © 2018년 배문기. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    
    
    @IBAction func GoSpring(_ sender: Any) {
        let VC = storyboard!.instantiateViewController(withIdentifier: "SpringModeling") as! SpringModeling
        
        navigationController?.pushViewController(VC, animated: true)
    }
    @IBAction func GoLoss(_ sender: Any) {
        let VC = storyboard!.instantiateViewController(withIdentifier: "LossModeling") as! LossModeling
        
        navigationController?.pushViewController(VC, animated: true)
    }
    @IBAction func GoElectric(_ sender: Any) {
        let VC = storyboard!.instantiateViewController(withIdentifier: "ElectricModeling") as! ElectricModeling
        
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

class SpringModeling: UIViewController {
    
    @IBAction func tapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBOutlet weak var m: UITextField!
    @IBOutlet weak var k: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var go: UIButton!
    
    @IBAction func GetResult(_ sender: Any) {
        let w = sqrt(Double(k.text!)! / Double(m.text!)!)
        
        if m.text == "" || k.text == "" {
            info.text = "값을 입력해주세요"
        }
        else {
            m.isHidden = true
            k.isHidden = true
            go.isHidden = true
            info.text = "F = ma , F = - ky"
            result.text = "ma = - ky 이다.\n\n∴  my'' + ky = 0\n\n의 비제차 이계 상계수 상미분방정식이 된다\n\n∴  y = Acos wt + Bsin wt (w = (k/m)^1/2)\n\n∴  y = Acos " + String(format: "%.3f", w) + "t + Bsin " + String(format: "%.3f", w) + "t"
        }
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

class LossModeling: UIViewController {
    
    @IBOutlet weak var explain: UILabel!
    
    
    @IBAction func first(_ sender: Any) {
        let VC = storyboard!.instantiateViewController(withIdentifier: "DrawGraphViewController") as! DrawGraphViewController
        
        navigationController?.pushViewController(VC, animated: true)
    }
    @IBAction func second(_ sender: Any) {
       let VC = storyboard!.instantiateViewController(withIdentifier: "SecondDrawGraphViewController") as! SecondDrawGraphViewController
        
        navigationController?.pushViewController(VC, animated: true)
    }
    @IBAction func third(_ sender: Any) {
        let VC = storyboard!.instantiateViewController(withIdentifier: "ThirdDrawGraphViewController") as! ThirdDrawGraphViewController
        
        navigationController?.pushViewController(VC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        explain.text = "if c^2 > 4mk 면\n\ny = Aexp(-(a-b)t) + Bexp(-(a+b)t)\n\na = c / 2m\nb = (c^2 - 4mk)^1/2) / 2m\n\nif c^2 = 4mk 면\n\ny = (A + Bt)exp(-at)\n\nif c^2 < 4mk 면\n\ny = Cexp(-at)cos(wt - d)"
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class ElectricModeling: UIViewController {
    
    @IBAction func tapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func graph(_ sender: Any) {
        let VC = storyboard!.instantiateViewController(withIdentifier: "FinalDrawGraphViewController") as! FinalDrawGraphViewController
        
        navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBOutlet weak var solution: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        solution.text = "LI' + RI + ∫ I dt / C = E(t) = Esin(wt)를 미분하면\n\nLI'' + RI' + I/C = E'(t) = wEcos(wt)\n\nif I = Q' 라면\n\nLQ'' + RQ'' + Q/C = E(t)\n\n보통 sin, cos의 그래프로 나온다."
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


