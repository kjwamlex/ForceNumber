//
//  AppDelegate.swift
//  WeighGame
//
//  Created by 김준우 on 2015. 12. 16..
//  Copyright © 2015년 김준우. All rights reserved.
//

import UIKit
import CoreData
import iAd

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var adbanner: ADBannerView = ADBannerView()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //didFinishLaunchingOnce()
        isAppAlreadyLaunchedOnce()
        adbanner.backgroundColor = UIColor.black
        UIViewController.prepareInterstitialAds()
        // Override point for customization after application launch.
        return true
    }
    func bannerViewDidLoadAd(_ banner: ADBannerView!) {
        NSLog("loadedAD for easyMode")
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        self.window?.rootViewController?.dismiss(animated: false, completion: nil)

    }
    
    /*
    func didFinishLaunchingOnce() -> Bool {

        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let hasBeenLauncherBefore = defaults.stringForKey("hasAppBeenLaunchedBefore")
        {
            print(" N-th time app launched ")
            return true
        }
        else
        {
            print(" First time app launched ")
            defaults.setBool(true, forKey: "hasAppBeenLaunchedBefore")
            return false
        }
    }
    */
    
    

    func isAppAlreadyLaunchedOnce()->Bool{
        let defaults = UserDefaults.standard
        
        if let isAppAlreadyLaunchedOnce = defaults.string(forKey: "isAppAlreadyLaunchedOnce"){
            print("App already launched")
            return true
        }else{
            defaults.set(true, forKey: "isAppAlreadyLaunchedOnce")
            //EasyMode2DTouch
            let defaults: UserDefaults = UserDefaults.standard
            defaults.set("0", forKey: "firstName")
            
            defaults.set("0", forKey: "MedSuc")
            
            defaults.set("0", forKey: "DifSuc")
            
            defaults.set("0", forKey: "EasyMode2DTouch")
            defaults.set("0", forKey: "NormalMode2DTouch")
            defaults.set("0", forKey: "HardMode2DTouch")

            
            defaults.synchronize()
            

            print("App launched first time")
            return false
        }
    }
    
    
    //DifSuc
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void)
    {
       // let handledShhortcutItem = self.handleShortcutItem(shortcutItem)
       // completionHandler(handledShhortcutItem)
        
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    @available(iOS 10.0, *)
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "WeighGame")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        if #available(iOS 10.0, *) {
            let context = persistentContainer.viewContext
            
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
            
        } else {
            // Fallback on earlier versions
        }
    }
    
}


    // MARK: - Core Data Saving support


    enum ShortcutIdentifier: String
    {
        case First
        case Second
        case Third
        case Fourth
        
        init?(fullType: String)
        {
            guard let last = fullType.components(separatedBy: ".").last else {return nil}
            self.init(rawValue: last)
        }
        
        var type: String
            {
                return Bundle.main.bundleIdentifier! + ".\(self.rawValue)"
        }
        
    }
    
    /*
    func handleShortcutItem(_ shortcutItem: UIApplicationShortcutItem) -> Bool
    {
        var handled = false
        //Messages
        guard ShortcutIdentifier(fullType: shortcutItem.type) != nil else { return false }
        guard let shortcutType = shortcutItem.type as String? else { return false }
        
        switch (shortcutType)
        {
        case ShortcutIdentifier.First.type:
            handled = true
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let navVC = storyboard.instantiateViewController(withIdentifier: "Easymode")
            self.window?.rootViewController?.present(navVC, animated: true, completion: nil)
            
            
            break
        case ShortcutIdentifier.Second.type:
            handled = true
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let navVC = storyboard.instantiateViewController(withIdentifier: "MediumMode")
            self.window?.rootViewController?.present(navVC, animated: true, completion: nil)
            UIWindow?.
            break
            
        case ShortcutIdentifier.Third.type:
            handled = true
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let navVC = storyboard.instantiateViewController(withIdentifier: "DifficultMode")
            self.window?.rootViewController?.present(navVC, animated: true, completion: nil)
            
            
            break
            
        case ShortcutIdentifier.Fourth.type:
            handled = true
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let navVC = storyboard.instantiateViewController(withIdentifier: "beats1")
            self.window?.rootViewController?.present(navVC, animated: true, completion: nil)
            
            
            break
            
        default:
            break
        }
        
        return handled
        
    }

*/


