//
//  Introduction.swift
//  WeighGame
//
//  Created by 김준우 on 2015. 12. 17..
//  Copyright © 2015년 김준우. All rights reserved.
//

import UIKit



class MainPage: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var EasymodeButton: UIButton!
    
    @IBOutlet var MediummodeButton: UIButton!
    
    @IBOutlet var HardmodeButton: UIButton!
    
    @IBOutlet var TutorialModeButton: UIButton!
    
    @IBOutlet var ForceNumberlabel: UILabel!

    
    @IBOutlet var dot: UIImageView!
    
    
    override func viewDidLoad() {
        UIApplication.shared.isStatusBarHidden = true
        super.viewDidLoad()
        self.EasymodeButton.setTitle(NSLocalizedString("EASY_MODE", comment: "Easy Mode"), for: UIControlState())
        self.MediummodeButton.setTitle(NSLocalizedString("NORMAL_MODE", comment: "Normal Mode"), for: UIControlState())
        self.HardmodeButton.setTitle(NSLocalizedString("HARD_MODE", comment: "Hard Mode"), for: UIControlState())

        self.ForceNumberlabel.text = "ForceNumber"
    }
    
    
    
    // 1
    func appdelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    

    override func viewDidAppear(_ animated: Bool) {
        is3DTouchAvailable()

        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    }
    override func viewDidDisappear(_ animated: Bool) {
        //AddBannerVIew.delegate = nil
        
       // AddBannerVIew = nil

    }
    
    

    
    func is3DTouchAvailable() -> Bool {
        if self.traitCollection.forceTouchCapability == UIForceTouchCapability.available{
            

            print("Available")
            return true;
        } else {
           // let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "no3dTouch")
            
           // self.show(vc as! UIViewController, sender: vc)
            
            let alertController = UIAlertController(title: "ForceNumber unavailable", message: "ForceNumber is not available on the devices without 3D Touch Capabilities.", preferredStyle: .alert)
            let actionOk = UIAlertAction(title: "OK",
                                         style: .default,
                                         handler: nil)
            
            alertController.addAction(actionOk)
            
            self.present(alertController, animated: true, completion: nil)


            print("Unavailable")

            return false;
        }
    }


}
