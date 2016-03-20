//
//  AppDelegate.swift
//  ChicagoWhiteSox
//
//  Created by Naga Praveen Kumar Pendyala on 11/3/15.
//  Copyright (c) 2015 Naga Praveen Kumar Pendyala. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let splitViewController = self.window!.rootViewController as! UISplitViewController
        splitViewController.preferredDisplayMode = UISplitViewControllerDisplayMode.AllVisible
        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
        splitViewController.delegate = self
        
        // setting second navigation controller as PlayersViewController
        let secnavigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-2] as! UINavigationController
        let mainController = secnavigationController.childViewControllers[0] as! PlayersViewController
        
        var downloadFailed = false
        var error: NSError? = nil
        //set url to download
        if let url = NSURL(string: "https://www.prismnet.com/~mcmahon/CS321/WhiteSox.json")
        {
            //get data into NSData object from the url
            if let urlData = NSData(contentsOfURL: url)
            {
                if let dictionary: [String: AnyObject] = NSJSONSerialization.JSONObjectWithData(urlData, options: nil, error: &error) as? [String: AnyObject]{
                    
                    //read the player values into an array
                    let array: [AnyObject] = (dictionary["Players"] as? [AnyObject])!
                    
                    for dict in array{
                        let number = dict["Number"]
                        let height = dict["Height"]
                        let position = dict["Position"]
                        let dob = dict["DOB"]
                        let fname = dict["First Name"]
                        let weight = dict["Weight"]
                        let lname = dict["Last Name"]
                        let bats = dict["Bats"]
                        let throws = dict["Throws"]
                        //add player objects to the main controller
                        mainController.objects.append(Player(number: number as! String, fname: fname as! String, lname: lname as! String, position: position as! String, bats: bats as! String, throws: throws as! String, height: height as! String, weight: weight as! String, dob: dob as! String))
                    }
                    // sort the objects by last name and then by first name
                    mainController.objects.sort({($0.lname == $1.lname) ? ($0.fname < $0.fname):($0.lname < $1.lname)})
                    
                }
                else{
                    downloadFailed = true
                }
                
            }
            else{
                downloadFailed = true
            }
            
        }
        else{
            downloadFailed = true
        }
        
        //show an alert if the download failed
        if downloadFailed {
            let alert = UIAlertView(title: "Error", message: "Unable to download course data", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: - Split view

    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController:UIViewController!, ontoPrimaryViewController primaryViewController:UIViewController!) -> Bool {
        if let secondaryAsNavController = secondaryViewController as? UINavigationController {
            if let topAsDetailController = secondaryAsNavController.topViewController as? PlayersDetailViewController {
                if topAsDetailController.detailItem == nil {
                    // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
                    return true
                }
            }
        }
        return false
    }

}

extension UISplitViewController{
    
    override public func supportedInterfaceOrientations() -> Int {
    return Int(UIInterfaceOrientationMask.All.rawValue)
    }
}


