//
//  ViewController.swift
//  Counters
//
//  Created by Enes Koç on 21.09.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TimeLabel: UILabel!
    
    var timer = Timer()
    var remainingTime = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        remainingTime = 15
        TimeLabel.text = "Time : \(remainingTime)"
        
    }


    @IBAction func StartTime(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerFunction), userInfo: nil, repeats: true)
    }
    
    @objc func TimerFunction(){
        TimeLabel.text = "Time : \(remainingTime)"
        remainingTime = remainingTime - 1
        
        if remainingTime == 0 {
            TimeLabel.text = "Süre Bitti ! "
            timer.invalidate()
            remainingTime = 15
        }
        
        
    }
}

