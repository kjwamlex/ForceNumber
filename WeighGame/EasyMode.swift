//
//  EasyMode.swift
//  CatchNumber
//
//  Created by 김준우 on 2015. 12. 18..
//  Copyright © 2015년 김준우. All rights reserved.
//

import UIKit

import AudioToolbox

import GLKit

class EasyMode: UIViewController{
    
    
    @IBOutlet weak var Numberthatwillchange: UILabel!
    
    @IBOutlet var timerlabel: UILabel!
    
    @IBOutlet var numberofsuccesses: UILabel!
    
    @IBOutlet var ringView: CircularForceView!
    
    @IBOutlet var timeringView: CircularTimerView!
    
    
    
    @IBOutlet var randomnumberlabel: UILabel!
    
    @IBOutlet var someview: UIView!
    
    @IBOutlet var backButton: UIButton!
    var currentForce: CGFloat! = 0
    var tareForce: CGFloat! = 0
    var someView: UIView!
    var timer = Timer()
    var othertimer = Timer()
    var successTapticTimer = Timer()
    var successTapticCounter = 0
    var counter = 0
    var othercounter = 5
    let lower : UInt32 = 1
    let upper : UInt32 = 10
    let centerX:CGFloat = 150
    let centerY:CGFloat = 150
    let radius:CGFloat = 148
    
    var currentAngle:Float = -90
    
    let timeBetweenDraw:CFTimeInterval = 0.01

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.canDisplayBannerAds = true
        self.ringView.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
        self.timeringView.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
        self.timerlabel.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
        timeringView.progress = 1
        timeringView.alpha = 0
        
self.timerlabel.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
        self.backButton.setTitle(NSLocalizedString("Back", comment: "Back"), for: UIControlState())

        let defaults: UserDefaults = UserDefaults.standard
        
        self.numberofsuccesses.text = defaults.object(forKey: "firstName") as? String
        self.Numberthatwillchange.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
        
        self.timerlabel.text = "\(counter)"
        
        view.isMultipleTouchEnabled = true
        Numberthatwillchange.text = "0"
        
        timerlabel.text = "5"
        
        UIApplication.shared.isStatusBarHidden = true

        let randomNumber = arc4random_uniform(upper - lower) + lower
        randomnumberlabel.text = "\(randomNumber)"
        //randomnumberlabel.text = "320.01"
        //let randomNumber = arc4random_uniform(40) + 10
        
          }
    
    
    
    
    // 1
    func appdelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
       @IBAction func regeneratenumber(_ sender: UIButton!) {
        let randomNumber = arc4random_uniform(upper - lower) + lower
        randomnumberlabel.text = "\(randomNumber)"
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first as UITouch?
        
        
        if (touch!.view == someview){

            currentForce = touch!.force
            Numberthatwillchange.text = "\(currentForce.grams(tareForce))"
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIViewAnimationOptions(), animations: {
                self.timerlabel.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.Numberthatwillchange.transform = CGAffineTransform(scaleX: 1, y: 1)

                }, completion: nil)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.timeringView.alpha = 1

                self.ringView.alpha = 1
                
            })
            
            timer = Timer.scheduledTimer(timeInterval: 5.0, target:self, selector: #selector(EasyMode.finished), userInfo: nil, repeats: false)
            
            othertimer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(EasyMode.updatetext), userInfo: nil, repeats: true)
            
            
        }else{

        }
        
        UIView.animate(withDuration: 0.2, animations: {
            self.timerlabel.alpha = 1
        })
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first as UITouch?
        
        if (touch!.view == someview){
            
            if Numberthatwillchange.text == "0" {
                ringView.progress = 0
            }

            if Numberthatwillchange.text == "1" {
                ringView.progress = 0.1
            }
            
            
            if Numberthatwillchange.text == "2" {
                ringView.progress = 0.2
            }

            
            if Numberthatwillchange.text == "3" {
                ringView.progress = 0.3
            }

            if Numberthatwillchange.text == "4" {
                ringView.progress = 0.4
            }
            if Numberthatwillchange.text == "5" {
                ringView.progress = 0.5
            }
            if Numberthatwillchange.text == "6" {
                ringView.progress = 0.6
            }
            if Numberthatwillchange.text == "7" {
                ringView.progress = 0.7
            }
            if Numberthatwillchange.text == "8" {
                ringView.progress = 0.8
            }
            if Numberthatwillchange.text == "9" {
                ringView.progress = 0.9
            }
            if Numberthatwillchange.text == "10" {
                ringView.progress = 1
            }

            
            currentForce = touch!.force
            Numberthatwillchange.text = "\(currentForce.grams(tareForce))"

        }else{
            
        }
    }
    
    func updatetext() {
        timerlabel.fadeTransition(0.5)
        othercounter -= 1
        timerlabel.text = "\(othercounter)"
        
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
    
    /*
    
    func isAppAlreadyLaunchedOnce()->Bool{
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let isAppAlreadyLaunchedOnce = defaults.stringForKey("isAppAlreadyLaunchedOnce"){
            print("App already launched")
            return true
        }else{
            defaults.setBool(true, forKey: "isAppAlreadyLaunchedOnce")
            print("App launched first time")
            return false
        }
    }
*/
    
    
    
    
    
    
    
    func finished() {
        
        //timerlabel.text = "\(counter)"
        
        if Numberthatwillchange.text == randomnumberlabel.text {
            
            let ss:Int? = Int(numberofsuccesses.text!)
            
            

            
            //AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                        successTapticTimer = Timer.scheduledTimer(timeInterval: 0.17, target:self, selector: #selector(EasyMode.successTaptic), userInfo: nil, repeats: true)
            
            _ = 0

            numberofsuccesses.text = "\(ss! + 1)"
            UIView.animate(withDuration: 0.5, animations: {
                //self.dot.image = UIImage(named: "Green Dot.png")
                self.view.backgroundColor = UIColor.green
                //self.dot.alpha = 1
            })
            print("succeded")
            
            timer.invalidate()
            othertimer.invalidate()
            timerlabel.text = "1"
            
            if timer.timeInterval == 5 {
                print("succeeded")
                timer.invalidate()
                othertimer.invalidate()
                timerlabel.text = "1"

            }
            
        } else {
            
            
            UIView.animate(withDuration: 1, animations: {
                //self.dot.image = UIImage(named: "reddot.png")
                //self.dot.alpha = 1
                self.view.backgroundColor = UIColor.red
                AudioServicesPlaySystemSound(1521)
            })
            
            print ("failed")
            
            timer.invalidate()
            othertimer.invalidate()
            timerlabel.text = "1"
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
        timeringView.progress = 1
        
        UIView.animate(withDuration: 0.5, animations: {
            self.ringView.progress = 0
            self.view.backgroundColor = UIColor.black
           
            self.timeringView.alpha = 0
        })
        
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIViewAnimationOptions(), animations: {
            self.Numberthatwillchange.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)

            self.timerlabel.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
            
            }, completion: nil)

        
        let defaults: UserDefaults = UserDefaults.standard
        defaults.set(self.numberofsuccesses.text, forKey: "firstName")
//defaults.setObject("0", forKey: "")
        defaults.synchronize()
        
        timer.invalidate()
        
        timerlabel.text = "5"
        
        othertimer.invalidate()
        othercounter = 5
        currentForce = 0
        Numberthatwillchange.text = "\(tareForce > 0 ? "-" : "")\(tareForce.grams(0))"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CGFloat {
    func grams(_ tare: CGFloat) -> String {
        return String(format: "%.0f", (self - tare) / CGFloat(0.65))
    }
}

extension UIView {
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionFade
        animation.duration = duration
        self.layer.add(animation, forKey: kCATransitionFade)
    }
}


