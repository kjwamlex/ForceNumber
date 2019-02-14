//
//  Instruction.swift
//  CatchNumber
//
//  Created by 김준우 on 2015. 12. 21..
//  Copyright © 2015년 김준우. All rights reserved.
//

import UIKit

import AudioToolbox

class Instruction: UIViewController {
    
    @IBOutlet var Description: UILabel!
    
    @IBOutlet var Description2: UILabel!
    
    @IBOutlet var numberThatWillChange: UILabel!
    
    @IBOutlet var numberThatYouHaveToMatch: UILabel!
    
    @IBOutlet var timerLabel : UILabel!
    
    @IBOutlet var successLabel: UILabel!
    
    @IBOutlet var dot: UIImageView!
    
    @IBOutlet var ring: UIImageView!
    
    @IBOutlet var arrow1: UIImageView!
    
    @IBOutlet var arrow2: UIImageView!
    
    @IBOutlet var finger: UIImageView!
    
    @IBOutlet var skipButton: UIButton!
    

    var timer = Timer()
    
    var counter = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(Instruction.InstructingGame), userInfo: nil, repeats: true)

        self.numberThatYouHaveToMatch.text = "9"
        
        self.skipButton.setTitle(NSLocalizedString("SKIP", comment: "Skip"), for: UIControlState())
        
        self.ring.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        self.dot.alpha = 0
        
        self.finger.alpha = 0
        
        self.timerLabel.alpha = 0
        
            self.Description.text = NSLocalizedString("Welcome", comment: "Welcome")
        
        self.Description2.text = "        "
        
        self.arrow1.alpha = 0
        
        self.arrow2.alpha = 0
        
    }
    
    //MARK: - iAd
    
    
    func appdelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    


    //MARK: - Functions
    
    @IBAction func dismissViewController(){
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func InstructingGame() {
        counter += 1
        
        if counter == 1{
            self.Description.text = NSLocalizedString("Welcome", comment: "Welcome")
        }
        
        if counter == 2{
            
            UIView.animate(withDuration: 0.5, animations: {
                self.Description.alpha = 0
            })
        }
        
        if counter == 3{
            self.Description.text = NSLocalizedString("IF_YOU_PRESS_THE_SCREEN", comment: "If you press the screen")
            UIView.animate(withDuration: 0.5, animations: {
                self.Description.alpha = 1
                self.dot.image = UIImage(named: "reddot.png")
                
                self.finger.alpha = 1
            })

            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: UIViewAnimationOptions(), animations: ({
                self.ring.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
                
            }), completion: nil)
        }
        
        if counter == 4 {
            UIView.animate(withDuration: 0.5, animations: {
                self.Description.alpha = 0
            })
            
        }
        
        if counter == 5{
            
            self.Description.text = NSLocalizedString("THE_NUMBER_IN_THE_MIDDLE", comment: "The number in the middle")
            
            self.Description2.text = NSLocalizedString("OF_THE_CIRCLE_WILL_CHANGE", comment: "of the circle will change.")
            
            UIView.animate(withDuration: 0.5, animations: {
                self.Description.alpha = 1
                self.Description2.alpha = 1
                self.numberThatWillChange.text = "1"
                self.arrow1.alpha = 1
            })
            UIView.animate(withDuration: 1, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: UIViewAnimationOptions(), animations: ({
                self.numberThatWillChange.text = "2"

            }), completion: nil)
        }
        
        if counter == 7{
            
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: UIViewAnimationOptions(), animations: ({
                self.numberThatWillChange.text = "3"
                 self.numberThatWillChange.fadeTransition(0.3)
            }), completion: nil)
            
            UIView.animate(withDuration: 1, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: UIViewAnimationOptions(), animations: ({
               self.numberThatWillChange.fadeTransition(0.3)
                
                self.numberThatWillChange.text = "4"
                
            }), completion: nil)
            UIView.animate(withDuration: 1, delay: 0.8, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: UIViewAnimationOptions(), animations: ({
                self.numberThatWillChange.text = "5"
                 self.numberThatWillChange.fadeTransition(0.3)
            }), completion: nil)
            UIView.animate(withDuration: 0.5, animations: {
                self.Description.alpha = 0
                self.Description2.alpha = 0
                self.timerLabel.text = "5"
                self.timerLabel.fadeTransition(0.3)
                self.timerLabel.alpha = 1

            })
        }
        
        if counter == 8{
            
            self.Description.text = NSLocalizedString("YOU_HAVE_TO_MATCH_THAT_NUMBER", comment: "You have to match that number")
            
            self.Description2.text = NSLocalizedString("WITH_THE_NUMBER_ON_TOP", comment: "with the number on top")
            
            self.dot.image = UIImage(named: "reddot.png")
            
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: UIViewAnimationOptions(), animations: ({
                self.numberThatWillChange.text = "6"
                 self.numberThatWillChange.fadeTransition(0.3)
            }), completion: nil)
            
            UIView.animate(withDuration: 1, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: UIViewAnimationOptions(), animations: ({
                self.numberThatWillChange.text = "7"
                 self.numberThatWillChange.fadeTransition(0.3)
            }), completion: nil)
            
            UIView.animate(withDuration: 1, delay: 0.7, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: UIViewAnimationOptions(), animations: ({
                self.numberThatWillChange.text = "8"
                 self.numberThatWillChange.fadeTransition(0.3)
            }), completion: nil)
            
            UIView.animate(withDuration: 1, delay: 0.9, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: UIViewAnimationOptions(), animations: ({
                self.numberThatWillChange.text = "9"
                 self.numberThatWillChange.fadeTransition(0.3)
            }), completion: nil)
            UIView.animate(withDuration: 0.5, animations: {
                self.dot.alpha = 0
                self.dot.image = UIImage(named: "Green Dot.png")
                self.Description.alpha = 1
                self.Description2.alpha = 1
               // self.numberThatWillChange.text = "9"
            })
            self.timerLabel.fadeTransition(0.3)
            self.timerLabel.text = "4"

        }
        
        if counter == 9{
            
            self.timerLabel.fadeTransition(0.3)
            self.timerLabel.text = "3"

        }
        
        if counter == 10{
            UIView.animate(withDuration: 0.5, animations: {
            
                self.Description.alpha = 0
                self.Description2.alpha = 0
            })
            self.timerLabel.fadeTransition(0.3)
            self.timerLabel.text = "2"

        }
        
        if counter == 11{
            
            UIView.animate(withDuration: 0.5, animations: {
                
            self.Description.alpha = 1
            self.Description2.alpha = 1
                self.Description.text = NSLocalizedString("IF_YOU_MATCH_THEM_THE_SCREEN", comment: "If you match them, the screen")
                self.Description2.text = NSLocalizedString("WILL_CHANGE_ITS_COLOR_TO_GREEN", comment: "will change its color to green.")
                
                self.arrow1.alpha = 0
                })
            self.timerLabel.fadeTransition(0.3)
            self.timerLabel.text = "1"
        }
        
        
        if counter == 13 {
            
            UIView.animate(withDuration: 0.5, animations: {
                //self.dot.alpha = 1
                //self.dot.image = UIImage(named: "Green Dot.png")
                self.view.backgroundColor = UIColor.green
                self.finger.alpha = 0
                self.Description.alpha = 0
                self.Description2.alpha = 0
                self.ring.alpha = 0
                self.timerLabel.alpha = 0
                self.successLabel.text = "1"
                self.numberThatWillChange.text = "0"
                
            })
        }
        
        if counter == 14 {
            
            UIView.animate(withDuration: 0.5, animations: {
                self.view.backgroundColor = UIColor.black
                //self.dot.alpha = 0
                self.Description.alpha = 1
                self.Description2.alpha = 1
                self.Description.text = NSLocalizedString("HOWEVER_IF_YOU_DONT_MATCH_THEM", comment: "However, if you don't match them,")
                self.Description2.text = NSLocalizedString("IT_WILL_CHANGE_TO_RED", comment: "it will change to red.")
            })
        }
        
        if counter == 15 {
            
            UIView.animate(withDuration: 0.5, animations: {
                //self.dot.image = UIImage(named: "reddot.png")
                //self.dot.alpha = 1
                self.view.backgroundColor = UIColor.red
                
            })
        }
        
        if counter == 17 {
            
            UIView.animate(withDuration: 0.5, animations: {
                //self.dot.alpha = 0
                self.view.backgroundColor = UIColor.black
                self.Description.alpha = 0
                self.Description2.alpha = 0
            })
        }

        if counter == 18 {
            
            UIView.animate(withDuration: 0.5, animations: {
                //self.dot.image = UIImage(named: "Green Dot.png")
                //self.dot.alpha = 1
                self.view.backgroundColor = UIColor.green
                self.Description.alpha = 1
                self.Description2.alpha = 1
                self.Description.text = NSLocalizedString("IF_YOU_SUCCEED", comment: "If you succeed,")
                self.Description2.text = NSLocalizedString("THE_BOTTOM_NUMBER_WILL_INCREASE", comment: "the bottom number will increase.")
                self.arrow2.alpha = 1

                
            })
        }
        
        if counter == 20 {
            
            UIView.animate(withDuration: 0.5, animations: {
               // self.dot.image = UIImage(named: "Green Dot.png")
                //self.dot.alpha = 0
                self.view.backgroundColor = UIColor.black
                self.successLabel.text = "2"
                self.Description.alpha = 0
                self.Description2.alpha = 0
                
            })
        }
        
        if counter == 21 {
            UIView.animate(withDuration: 0.5, animations: {
                
                self.Description.alpha = 1
                self.Description2.alpha = 1
            })
            self.Description.text = NSLocalizedString("THAT_COUNTS_THE_NUMBER_OF_TIMES", comment: "That counts the number of times")
            self.Description2.text = NSLocalizedString("YOU_WON", comment: "you won.")
        }
        
        if counter == 23 {
            UIView.animate(withDuration: 0.5, animations: {
                self.Description.alpha = 0
                self.Description2.alpha = 0

                
            })
        }
        
        if counter == 24{
            
            UIView.animate(withDuration: 0.5, animations: {
                self.Description.alpha = 1
                self.Description2.alpha = 1
                self.arrow2.alpha = 0
            })
            
            self.Description.text = NSLocalizedString("YOU_NEED_TO_LIFT_YOUR_FINGER_AFTER", comment: "You need to lift your finger after")
            self.Description2.text = NSLocalizedString("THE_SCREEN_CHANGES_ITS_COLOR", comment: "the color changes for the next round.")
            
        }
        
        if counter == 26{
            UIView.animate(withDuration: 0.5, animations: {
                self.Description.alpha = 0
                self.Description2.alpha = 0
            })


        }
        
        if counter == 27{
            UIView.animate(withDuration: 0.5, animations: {
                self.Description.alpha = 1
                self.Description2.alpha = 0
            })
            
            
        self.Description.text = NSLocalizedString("THE_TUTORIAL_IS_FINISHED", comment: "The tutorial is finished!")
            Description2.text = ""

        }
        
        if counter == 29 {
            UIView.animate(withDuration: 0.5, animations: {
                self.Description.alpha = 0
                self.Description2.alpha = 0
            })
            
        }
        
        
        if counter == 30{
            
            UIView.animate(withDuration: 0.5, animations: {
                self.Description.alpha = 1
                self.Description2.alpha = 1
            })

            
            self.Description.text = NSLocalizedString("YOU_ARE_WELL_ON_YOU", comment: "You're well on your")
            
            Description2.text = NSLocalizedString("WAY_TO_BECOMEING_A_CHAMPION", comment: "way to becoming a champion!")        }
        
        if counter == 32 {
            
            self.dismiss(animated: true, completion: nil)
        }

    }
    
}
