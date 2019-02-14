//
//  DifficultMode.swift
//  WeighGame
//
//  Created by 김준우 on 2015. 12. 16..
//  Copyright © 2015년 김준우. All rights reserved.
//

import UIKit

import AudioToolbox

class ViewController: UIViewController {
    
    @IBOutlet weak var Numberthatwillchange: UILabel!
    
    @IBOutlet var timerlabel: UILabel!
    
    @IBOutlet var numberofsuccesses: UILabel!
    
    @IBOutlet var randomnumberlabel: UILabel!
    @IBOutlet var timeringView: CircularTimerView!

    @IBOutlet var ringView: CircularForceView!
    
    
    @IBOutlet var someView: UIView!
    
    @IBOutlet var backButton: UIButton!
    
    
    var currentForce: CGFloat! = 0
    var tareForce: CGFloat! = 0
    
    var timer = Timer()
    var othertimer = Timer()
    var counter = 0
    var othercounter = 5
    var successTapticTimer = Timer()
    var successTapticCounter = 0
    let lower : UInt32 = 1
    let upper : UInt32 = 67


    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        let defaults: UserDefaults = UserDefaults.standard
        
        self.numberofsuccesses.text = defaults.object(forKey: "DifSuc") as? String
        self.backButton.setTitle(NSLocalizedString("Back", comment: "Back"), for: UIControlState())

        
        timeringView.progress = 1
        
        timeringView.alpha = 0

        
        self.timeringView.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
        ringView.progress = 0

        self.timerlabel.text = "\(counter)"
        
        self.ringView.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))

        
        view.isMultipleTouchEnabled = true
        Numberthatwillchange.text = "0"
        
        timerlabel.text = "5"
        timerlabel.alpha = 0
        
        UIApplication.shared.isStatusBarHidden = true

        let randomNumber = arc4random_uniform(upper - lower) + lower
        randomnumberlabel.text = "\(randomNumber)"
        //randomnumberlabel.text = "320.01"
        //let randomNumber = arc4random_uniform(40) + 10
        
        
    }
    func appdelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
       
    @IBAction func regeneratenumber(_ sender: UIButton!) {
        
        let randomNumber = arc4random_uniform(upper - lower) + lower
        randomnumberlabel.text = "\(randomNumber)"

        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first as UITouch?
        
        if (touch!.view == someView){
            self.timeringView.alpha = 1


            currentForce = touch!.force
            Numberthatwillchange.text = "\(currentForce.easygram(tareForce))"
            
            timer = Timer.scheduledTimer(timeInterval: 5.0, target:self, selector: #selector(ViewController.finished), userInfo: nil, repeats: false)
            
            othertimer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(ViewController.updatetext), userInfo: nil, repeats: true)
            
            UIView.animate(withDuration: 0.2, animations: {
                self.timerlabel.alpha = 1
            })
            
            
        }else{

        }




    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first as UITouch?
        
        if (touch!.view == someView){
            
            
            if Numberthatwillchange.text == "0" {
                ringView.progress = 0
            }
            
            
            if Numberthatwillchange.text == "1" {
                ringView.progress = 0.016
            }
            
            
            if Numberthatwillchange.text == "2" {
                ringView.progress = 0.016 + 0.016
            }
            
            
            if Numberthatwillchange.text == "3" {
                ringView.progress = CGFloat(0.016 + 0.016 + 0.016)
            }
            
            if Numberthatwillchange.text == "4" {
                ringView.progress = CGFloat(0.016 + 0.016 + 0.016 + 0.016)
            }
            if Numberthatwillchange.text == "5" {
                ringView.progress = CGFloat(0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }
            if Numberthatwillchange.text == "6" {
                ringView.progress = CGFloat(0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }
            if Numberthatwillchange.text == "7" {
                ringView.progress = CGFloat(0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }
            if Numberthatwillchange.text == "8" {
                ringView.progress = CGFloat(0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }
            if Numberthatwillchange.text == "9" {
                ringView.progress = CGFloat(0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }
            if Numberthatwillchange.text == "10" {
                ringView.progress = CGFloat(0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }
            
            if Numberthatwillchange.text == "11" {
                ringView.progress = 0.16 + 0.016
            }
            
            if Numberthatwillchange.text == "12" {
                ringView.progress = CGFloat(0.16 + 0.016 + 0.016 + 0.016)
            }
            
            if Numberthatwillchange.text == "13" {
                ringView.progress = CGFloat(0.16 + 0.016 + 0.016 + 0.016 + 0.016)
            }
            
            if Numberthatwillchange.text == "14" {
                ringView.progress = CGFloat(0.16 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }
            
            if Numberthatwillchange.text == "15" {
                ringView.progress = CGFloat(0.16 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }
            
            if Numberthatwillchange.text == "16" {
                ringView.progress = CGFloat(0.16 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }
            if Numberthatwillchange.text == "17" {
                ringView.progress = CGFloat(0.16 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }
            if Numberthatwillchange.text == "18" {
                ringView.progress = CGFloat(0.16 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }
            if Numberthatwillchange.text == "19" {
                ringView.progress = CGFloat(0.16 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }
            if Numberthatwillchange.text == "20" {
                ringView.progress = CGFloat(0.16 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }
            if Numberthatwillchange.text == "21" {
                ringView.progress = 0.336 + 0.016
            }
            
            if Numberthatwillchange.text == "22" {
                ringView.progress = CGFloat(0.336 + 0.016 + 0.016)
            }
            if Numberthatwillchange.text == "23" {
                ringView.progress = CGFloat(0.336 + 0.016 + 0.016 + 0.016)
            }
            if Numberthatwillchange.text == "24" {
                ringView.progress = CGFloat(0.336 + 0.016 + 0.016 + 0.016 + 0.016)
            }
            if Numberthatwillchange.text == "25" {
                ringView.progress = CGFloat(0.336 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }
            if Numberthatwillchange.text == "26" {
                ringView.progress = CGFloat(0.336 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }
            
            if Numberthatwillchange.text == "27" {
                ringView.progress = CGFloat(0.336 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "28" {
                ringView.progress = CGFloat(0.336 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "29" {
                ringView.progress = CGFloat(0.336 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "30" {
                ringView.progress = CGFloat(0.336 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "31" {
                ringView.progress = 0.496 + 0.016
            }
            if Numberthatwillchange.text == "32" {
                ringView.progress = CGFloat(0.496 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "33" {
                ringView.progress = CGFloat(0.496 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "34" {
                ringView.progress = CGFloat(0.496 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "35" {
                ringView.progress = CGFloat(0.496 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "36" {
                ringView.progress = CGFloat(0.496 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "37" {
                ringView.progress = CGFloat(0.496 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "38" {
                ringView.progress = CGFloat(0.496 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "39" {
                ringView.progress = CGFloat(0.496 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "40" {
                ringView.progress = CGFloat(0.496 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "41" {
                ringView.progress = 0.656 + 0.016
            }

            if Numberthatwillchange.text == "42" {
                ringView.progress = CGFloat(0.656 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "43" {
                ringView.progress = CGFloat(0.656 + 0.016 + 0.016 + 0.016)
            }
            if Numberthatwillchange.text == "44" {
                ringView.progress = CGFloat(0.656 + 0.016 + 0.016 + 0.016 + 0.016)
            }
            if Numberthatwillchange.text == "45" {
                ringView.progress = CGFloat(0.656 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            
            if Numberthatwillchange.text == "46" {
                ringView.progress = CGFloat(0.656 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "47" {
                ringView.progress = CGFloat(0.656 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "48" {
                ringView.progress = CGFloat(0.656 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "49" {
                ringView.progress = CGFloat(0.656 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "50" {
                ringView.progress = CGFloat(0.656 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "51" {
                ringView.progress = 0.816 + 0.016
            }

            if Numberthatwillchange.text == "52" {
                ringView.progress = CGFloat(0.816 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "53" {
                ringView.progress = CGFloat(0.816 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "54" {
                ringView.progress = CGFloat(0.816 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "55" {
                ringView.progress = CGFloat(0.816 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "56" {
                ringView.progress = CGFloat(0.816 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "57" {
                ringView.progress = CGFloat(0.816 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "58" {
                ringView.progress = CGFloat(0.816 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "59" {
                ringView.progress = CGFloat(0.816 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "60" {
                ringView.progress = CGFloat(0.816 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "61" {
                ringView.progress = 0.976 + 0.016
            }

            if Numberthatwillchange.text == "62" {
                ringView.progress = CGFloat(0.976 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "63" {
                ringView.progress = CGFloat(0.976 + 0.016 + 0.016 + 0.016)
            }
            if Numberthatwillchange.text == "64" {
                ringView.progress = CGFloat(0.976 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            if Numberthatwillchange.text == "65" {
                ringView.progress = CGFloat(0.976 + 0.016  + 0.016 + 0.016 + 0.016 + 0.016)
            }
            if Numberthatwillchange.text == "66" {
                ringView.progress = CGFloat(0.976 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016 + 0.016)
            }

            
            if Numberthatwillchange.text == "67" {
                ringView.progress = 1
            }
            
            currentForce = touch!.force
            Numberthatwillchange.text = "\(currentForce.easygram(tareForce))"
            
            
        }else{
           
        }
        
    }
    
    func updatetext() {
        
        othercounter -= 1
        timerlabel.text = "\(othercounter)"
        timerlabel.fadeTransition(0.5)
        
        if othercounter == 5 {
            
            timeringView.progress = 0.8
            AudioServicesPlaySystemSound(1519)
        }
        
        if othercounter == 4 {
            
            timeringView.progress = 0.6
            AudioServicesPlaySystemSound(1519)
        }
        
        if othercounter == 3 {
            
            timeringView.progress = 0.4
            AudioServicesPlaySystemSound(1519)
        }
        
        if othercounter == 2 {
            
            timeringView.progress = 0.2
            AudioServicesPlaySystemSound(1519)
        }
        
        if othercounter == 1 {
            
            timeringView.progress = 0
            AudioServicesPlaySystemSound(1519)
        }


        UIView.animate(withDuration: 0.2, animations: {
            self.timerlabel.alpha = 1
        })

    }
    
    
    
    func finished() {
        
        //timerlabel.text = "\(counter)"
        
        if Numberthatwillchange.text == randomnumberlabel.text {
            
            let ss:Int? = Int(numberofsuccesses.text!)
            
           // AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            
            UIView.animate(withDuration: 0.5, animations: {
               // self.dot.image = UIImage(named: "Green Dot.png")
                self.view.backgroundColor = UIColor.green

               // self.dot.alpha = 1
            })
            
            successTapticTimer = Timer.scheduledTimer(timeInterval: 0.17, target:self, selector: #selector(ViewController.successTaptic), userInfo: nil, repeats: true)
            
            // let ss = Int(numberofsuccesses.text!)
            
            //    let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
            
            //   self.numberofsuccesses.text = defaults.objectForKey("firstName") as? String
            
            numberofsuccesses.text = "\(ss! + 1)"
            print("succeded")
            
            UIView.animate(withDuration: 0.1, animations: {
                
                self.timerlabel.alpha = 0
            })

            timer.invalidate()
            
            othertimer.invalidate()
            
            timerlabel.text = "5"

            if timer.timeInterval == 5 {
                print("succeeded")
            }
            
        } else {
            
            UIView.animate(withDuration: 0.1, animations: {
                
                self.timerlabel.alpha = 0
            })

            UIView.animate(withDuration: 0.5, animations: {
               // self.dot.image = UIImage(named: "reddot.png")
               // self.dot.alpha = 1
                self.view.backgroundColor = UIColor.red
                AudioServicesPlaySystemSound(1521)

            })
 

            
            print ("failed")
            
            timer.invalidate()
            
            othertimer.invalidate()
            
            timerlabel.text = "5"
        }
        
    }
    
    func successTaptic() {
        successTapticCounter += 1
        
        if successTapticCounter == 1{
            
            AudioServicesPlaySystemSound(1520)
        }
        
        if successTapticCounter == 2{
            
            AudioServicesPlaySystemSound(1519)
        }
        
        if successTapticCounter == 3{
            
        successTapticTimer.invalidate()
            successTapticCounter = 0
        }
    }

    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let randomNumber = arc4random_uniform(upper - lower) + lower
        randomnumberlabel.text = "\(randomNumber)"

        let defaults: UserDefaults = UserDefaults.standard
        defaults.set(self.numberofsuccesses.text, forKey: "DifSuc")
        defaults.synchronize()
        ringView.progress = 0
        timeringView.progress = 1
        UIView.animate(withDuration: 0.5, animations: {
            
            self.view.backgroundColor = UIColor.black
            self.timeringView.alpha = 0


            self.timerlabel.alpha = 0
            
        })
        ringView.progress = 0

        othertimer.invalidate()
        othercounter = 5
        currentForce = 0
        Numberthatwillchange.text = "\(tareForce > 0 ? "-" : "")\(tareForce.easygram(0))"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CGFloat {
    func easygram(_ tare: CGFloat) -> String {
        return String(format: "%.0f", (self - tare) / CGFloat(0.1))
    }
}

