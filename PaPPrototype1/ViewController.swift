//
//  ViewController.swift
//  PaPPrototype1
//
//  Created by Jack Noble on 12/27/14.
//  Copyright (c) 2014 Noble Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var firstSelectorImageView: UIImageView!
    @IBOutlet weak var secondSelectorImageView: UIImageView!
    @IBOutlet weak var thirdSelectorImageView: UIImageView!
    
    @IBOutlet weak var playerMoneyLabel: UILabel!
    
    @IBOutlet weak var winLabel: UILabel!
    
    
    
    
    @IBOutlet weak var iconWheel1RandomImageView: UIImageView!
    @IBOutlet weak var iconWheel2RandomImageView: UIImageView!
    @IBOutlet weak var iconWheel3RandomImageView: UIImageView!
    @IBOutlet weak var iconWheel4RandomImageView: UIImageView!
    @IBOutlet weak var iconWheel5RandomImageView: UIImageView!
    @IBOutlet weak var iconWheel6RandomImageView: UIImageView!
    @IBOutlet weak var iconWheel7RandomImageView: UIImageView!
    @IBOutlet weak var iconWheel8RandomImageView: UIImageView!
    @IBOutlet weak var iconWheel9RandomImageView: UIImageView!
    @IBOutlet weak var iconWheel10RandomImageView: UIImageView!
    
    // Primary instance of the Icon class to be used
    var icon = Icon()
    
    // The values of icons in the rings
    var ringZeroIconValues:[Int] = []
    var ringOneIconValues:[Int] = []
    var ringTwoIconValues:[Int] = []

    var playerMoney = 0

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playerMoneyLabel.text = "\(playerMoney)"
        winLabel.hidden = true
        populateRings(0)
        populateRings(1)
        populateRings(2)
        
        
        let delay = 0.5 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()) {
            self.winFunction(self.checkForThreeInARow())
            self.updateView()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    // IBActions
    @IBAction func spinButtonZeroPressed(sender: UIButton) {
        ringZeroIconValues.removeAll(keepCapacity: true)
        spinFunction(0)
        if checkForThreeInARow() == true {
            let delay = 0.5 * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue()) {
                self.winFunction(true)
                self.updateView()
            }
        }


    }
    
    @IBAction func spinButtonOnePressed(sender: UIButton) {
        ringOneIconValues.removeAll(keepCapacity: true)
        spinFunction(1)
        if checkForThreeInARow() == true {
            let delay = 0.5 * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue()) {
                self.winFunction(true)
                self.updateView()
            }
        }


    }
    
    @IBAction func spinButtonTwoPressed(sender: UIButton) {
        ringTwoIconValues.removeAll(keepCapacity: true)
        spinFunction(2)
        if checkForThreeInARow() == true {
            let delay = 0.5 * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue()) {
                self.winFunction(true)
                self.updateView()
            }
        }

    }
    
    
    
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    // Check if there is a 3 in a row. *Note Boolian value for whether fo not there is in fact a 3 in a row.
    func checkForThreeInARow () -> Bool {
        if firstSelectorImageView.image == secondSelectorImageView.image && thirdSelectorImageView.image == secondSelectorImageView.image {
            println("3 in a row!")
            return true
        } else {
            println("Spin again")
            return false
        }
    }
 
    
    
//**** REMODEL FUNCTION STRUCTURE **** \\
    // Exicute 3 in a work protocall, primarly making icons in selector disapear and all other icons to "fall" and take their place, and determining how much the player wins.
    func winFunction (win : Bool) {
        if win == true {
            playerMoney += 150
            winLabel.hidden = false
            var preRotationRingZeroIconImages = [iconWheel1RandomImageView.image, iconWheel2RandomImageView.image, iconWheel3RandomImageView.image, firstSelectorImageView.image, iconWheel4RandomImageView.image, iconWheel5RandomImageView.image, iconWheel6RandomImageView.image]
            var preRotationRingOneIconImages = [iconWheel7RandomImageView.image, iconWheel8RandomImageView.image, secondSelectorImageView.image, iconWheel9RandomImageView.image, iconWheel10RandomImageView.image]
            self.icon = generateRandomIcon()

            
            
            
                // Ring Zero
                icon = generateRandomIcon()
                self.iconWheel2RandomImageView.image = preRotationRingZeroIconImages[0]
                self.iconWheel3RandomImageView.image = preRotationRingZeroIconImages[1]
                self.firstSelectorImageView.image = preRotationRingZeroIconImages[2]
                self.iconWheel1RandomImageView.image = self.icon.image
            
                // Ring One
                var pGenorateRandomIcon = self.generateRandomIcon()
                self.iconWheel8RandomImageView.image = preRotationRingOneIconImages[0]
                self.secondSelectorImageView.image = preRotationRingOneIconImages[1]
                self.iconWheel7RandomImageView.image = pGenorateRandomIcon.image
            
                // Ring Three
                var yGenorateRandomIcon = self.generateRandomIcon()
                self.thirdSelectorImageView.image = yGenorateRandomIcon.image

        }
    }
    
    
    
    
    // The Spin Function's job is to "rotate" the icons places in a "- 1" positional update (i.e. an icon takes the form of the icon above it, and that above takes the form of the icon above it.
    func spinFunction (ring: Int) {
        winLabel.hidden = true
        
        
        // Ring Zero
        if ring == 0 {
        icon = generateRandomIcon()
        var preRotationRingZeroIconImages = [iconWheel1RandomImageView.image, iconWheel2RandomImageView.image, iconWheel3RandomImageView.image, firstSelectorImageView.image, iconWheel4RandomImageView.image, iconWheel5RandomImageView.image, iconWheel6RandomImageView.image]
        
            iconWheel2RandomImageView.image = preRotationRingZeroIconImages[0]
            iconWheel3RandomImageView.image = preRotationRingZeroIconImages[1]
            firstSelectorImageView.image = preRotationRingZeroIconImages[2]
            iconWheel4RandomImageView.image = preRotationRingZeroIconImages[3]
            iconWheel5RandomImageView.image = preRotationRingZeroIconImages[4]
            iconWheel6RandomImageView.image = preRotationRingZeroIconImages[5]
            iconWheel1RandomImageView.image = icon.image
        }
        
        // Ring One
        else if ring == 1 {
            icon = generateRandomIcon()
            var preRotationRingOneIconImages = [iconWheel7RandomImageView.image, iconWheel8RandomImageView.image, secondSelectorImageView.image, iconWheel9RandomImageView.image, iconWheel10RandomImageView.image]
            
            iconWheel8RandomImageView.image = preRotationRingOneIconImages[0]
            secondSelectorImageView.image = preRotationRingOneIconImages[1]
            iconWheel9RandomImageView.image = preRotationRingOneIconImages[2]
            iconWheel10RandomImageView.image = preRotationRingOneIconImages[3]
            iconWheel7RandomImageView.image = icon.image
        }
        
        // Ring Two
        else {
            icon = generateRandomIcon()
            thirdSelectorImageView.image = icon.image
            
            


        }

    }
    
    
    // This function fills the three rings with random icons.
    func populateRings (ring : Int) {
        // Arrays of image views, sorted specficly by ring in which they reside
        var ringZeroImageViews = [iconWheel1RandomImageView, iconWheel2RandomImageView, iconWheel3RandomImageView, firstSelectorImageView, iconWheel4RandomImageView, iconWheel5RandomImageView, iconWheel6RandomImageView]
        var ringOneImageViews = [iconWheel7RandomImageView, iconWheel8RandomImageView, secondSelectorImageView, iconWheel9RandomImageView, iconWheel10RandomImageView]
        var ringTwoImageViews = [thirdSelectorImageView] 
        var selectedIconValues:[Int] = []
            
        if ring == 0 {
            var index = 0
            for index; index < ringZeroImageViews.count; index++ {
                icon = generateRandomIcon()
                var currnetImageView = ringZeroImageViews[index]
                currnetImageView.image = icon.image
                ringZeroIconValues.append(icon.value)
                println("Ring Zero Icon Values: \(ringZeroIconValues)")
                
            }
        
        } else if ring == 1 {
            var index = 0
            for index; index < ringOneImageViews.count; index++ {
                icon = generateRandomIcon()
                var currnetImageView = ringOneImageViews[index]
                currnetImageView.image = icon.image
                ringOneIconValues.append(icon.value)
                println("Ring One Icon Values: \(ringOneIconValues)")
                
                }
            } else {
            var index = 0
            for index; index < ringTwoImageViews.count; index++ {
                icon = generateRandomIcon()
                var currnetImageView = ringTwoImageViews[index]
                currnetImageView.image = icon.image
                ringTwoIconValues.append(icon.value)
                println("Ring Two Icon Values: \(ringTwoIconValues)")
                
            }
        }

        
    }
    
    
    // This function creates a single random icon. One may call it any number of times to create a desired number of random icons, however, that functionality is not available in this function.
    func generateRandomIcon () -> Icon {
        var icon:Icon
            var randomNumber = Int(arc4random_uniform(UInt32(4)))
            switch randomNumber {
            case 0:
                icon = Icon(image: UIImage(named: "Icon1"), value: 0)
            case 1:
                icon = Icon(image: UIImage(named: "Icon2"), value: 1)
            case 2:
                icon = Icon(image: UIImage(named: "Icon3"), value: 2)
            case 3:
                icon = Icon(image: UIImage(named: "Icon4"), value: 3)
            
            default:
                icon = Icon(image: UIImage(named: "Icon1"), value: 0)
        }
            return icon
    }

    
    // Function that updates the "Player Money", and any other labels on the screen.
    func updateView () {
        
        UIView.transitionWithView(self.view, duration: 0.3, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            self.playerMoneyLabel.text = "\(self.playerMoney)"
            }, completion: {
                (finished: Bool) -> () in
        })
    }

}













