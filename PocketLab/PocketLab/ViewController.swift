//
//  ViewController.swift
//  PocketLab
//
//  Created by 배문기 on 2018. 5. 11..
//  Copyright © 2018년 배문기. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func Laboratory(_ sender: Any) {
        let VC = storyboard!.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        navigationController?.pushViewController(VC, animated: true)
    }
    
    
    @IBAction func theory(_ sender: Any) {
        let VC = storyboard!.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        
        navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func LaboTheo(_ sender: Any) {
       let VC = storyboard!.instantiateViewController(withIdentifier: "FourthViewController") as! FourthViewController
        
        navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func GoGraph(_ sender: Any) {
        let VC = storyboard!.instantiateViewController(withIdentifier: "FifthViewController") as! FifthViewController
        
        navigationController?.pushViewController(VC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

