//
//  SecondViewController.swift
//  MolarMassCalculator
//
//  Created by SETSI on 2017-07-25.
//  Copyright © 2017 SETSI. All rights reserved.
//

import UIKit
import AVFoundation

class ThirdViewController: UIViewController {
    
    var titleLabel:UILabel!
    var instructions:UILabel!
    var errorMessage: UILabel!
    
    
    var volLabel:UILabel!
    var conLabel: UILabel!
    var volLabelFinal:UILabel!
    var conLabelFinal: UILabel!
 
    var userInputVolume : UIButton!
    var userInputMolarity : UIButton!
    var userInputVolumeFinal : UIButton!
    var userInputMolarityFinal : UIButton!
    
    var calcButton : UIButton!
    var clearButton : UIButton!
    
    var width:CGFloat!
    var height:CGFloat!
    var scale:CGFloat!
    
    var volSegment : UISegmentedControl!
    var conSegment : UISegmentedControl!
    var volSegmentFinal : UISegmentedControl!
    var conSegmentFinal : UISegmentedControl!
 
    
    let iphone7plusW: CGFloat = 414
    let iphone7plusH: CGFloat = 736

    var editVolume:Bool = false
    var editMolarity:Bool = false
    var editVolumeFinal:Bool = false
    var editMolarityFinal:Bool = false
    var validCalculation:Bool = false
    
    //keypad
    var button1: UIButton!
    var button2: UIButton!
    var button3: UIButton!
    var button4: UIButton!
    var button5: UIButton!
    var button6: UIButton!
    var button7: UIButton!
    var button8: UIButton!
    var button9: UIButton!
    var button0: UIButton!
    var buttonDot: UIButton!
    var buttonE: UIButton!
    var buttonNeg: UIButton!
    var buttonBack: UIButton!
    var buttonClr: UIButton!
    var resetButton: UIButton!
    
    var keyPad = [UIButton]()
    
    var unitString = " "
    
    var posSound = AVAudioPlayer()
    var negSound = AVAudioPlayer()
    var switchSeg = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //constants to be used throughout the code
        width = UIScreen.main.bounds.width
        height = UIScreen.main.bounds.height - 50
          scale = height / 736 // designed for Iphone 7 plus
        
        
       
      
        
        
        if scale > 1 {
        titleLabel = createLabelTitle(x: 10, y: 15 , width2: width - 20, height2: 200, size: 24*scale, text: "Calculating CiVi = CfVf")
            
        addSubscriptsInLabel(label: titleLabel!, text: "Calculating CiVi = CfVf", num1: 13, num2: 15, num3: 20, num4: 22)
        
        instructions = createLabelTitle(x: 10, y: titleLabel.frame.maxY + 5, width2: width - 20, height2: 200 , size: 18*scale, text: "Enter any three values")
    
        volLabel = createLabelWithoutCentering(x:5, y : instructions.frame.maxY + 2, width2: width/3*2 - 10, height2: 50, size: 14*scale, text: "Initial Volume of Stock Solution Vi")
            
        addSingleSubscriptsInLabel(label: volLabel!, text: "Initial Volume of Stock Solution Vi", num1: 34)

        }
        else{
        
     
            // set attributed text on a UILabel
            
            titleLabel = createLabelTitle(x: 10, y: 20 , width2: width - 20, height2: 200, size: 24, text: "Calculating CiVi = CfVf")
            
            addSubscriptsInLabel(label: titleLabel!, text: "Calculating CiVi = CfVf", num1: 13, num2: 15, num3: 20, num4: 22)
            
            instructions = createLabelTitle(x: 10, y: titleLabel.frame.maxY + 10, width2: width - 20, height2: 200 , size: 20, text: "Enter any three values")
            
            volLabel = createLabelWithoutCentering(x:5, y : instructions.frame.maxY + 2, width2: width/3*2 - 10, height2: 50, size: 18, text: "Initial Volume of Stock Solution Vi")
            
             addSingleSubscriptsInLabel(label: volLabel!, text: "Initial Volume of Stock Solution Vi", num1: 34)
        
        }
        
        userInputVolume = UIButton(frame: CGRect (x: volLabel.frame.minX, y: volLabel.frame.maxY , width: width/3*2 - 10, height : 45*scale))
        userInputVolume.backgroundColor = GlobalConstants.textBackground
        userInputVolume.layer.cornerRadius = 10
        userInputVolume.layer.borderWidth = 2
        userInputVolume.setTitleColor(GlobalConstants.text, for: .normal)
        userInputVolume.setTitle("Initial Volume", for: .normal)
        userInputVolume.titleLabel?.font = UIFont.init(name: "HelveticaNeue-Light", size :width*0.05)
        // userInputVolume.center.x = self.view.center.x
        userInputVolume.addTarget(self, action: #selector(volumeTap), for: .touchUpInside)
        userInputVolume.layer.borderColor = GlobalConstants.border.cgColor
        
        if scale > 1{
        conLabel = createLabelWithoutCentering(x:5, y : userInputVolume.frame.maxY + 2, width2: width/3*2 - 10, height2: 50, size: 14*scale, text: "Initial Molarity of Stock Solution Ci")
            addSingleSubscriptsInLabel(label: conLabel!, text: "Initial Molarity of Stock Solution Ci", num1: 36)
            
            
        }else{
          conLabel = createLabelWithoutCentering(x:5, y : userInputVolume.frame.maxY + 2, width2: width/3*2 - 10, height2: 50, size: 18, text: "Initial Molarity of Stock Solution Ci")
            addSingleSubscriptsInLabel(label: conLabel!, text: "Initial Molarity of Stock Solution Ci", num1: 36)
        }
        userInputMolarity = UIButton(frame: CGRect (x: conLabel.frame.minX, y: conLabel.frame.maxY , width: width/3*2 - 10, height : 45*scale ))
        userInputMolarity.backgroundColor = GlobalConstants.textBackground
        userInputMolarity.layer.cornerRadius = 10
        userInputMolarity.layer.borderWidth = 2
        userInputMolarity.setTitleColor(GlobalConstants.text, for: .normal)
        userInputMolarity.setTitle("Initial Molarity", for: .normal)
        userInputMolarity.titleLabel?.font = UIFont.init(name: "HelveticaNeue-Light", size :width*0.05)
        //userInputMolarity.center.x = self.view.center.x
        userInputMolarity.addTarget(self, action: #selector(molarityTap), for: .touchUpInside)
        userInputMolarity.layer.borderColor = GlobalConstants.border.cgColor
        
        if scale > 1 {
            volLabelFinal = createLabelWithoutCentering(x:5, y : userInputMolarity.frame.maxY + 2, width2: width/3*2 - 10, height2: 50, size: 14*scale, text: "Final Volume of Diluted Solution Vf")
            addSingleSubscriptsInLabel(label: volLabelFinal!, text: "Final Volume of Diluted Solution Vf", num1: 34)}
        else{
            volLabelFinal = createLabelWithoutCentering(x:5, y : userInputMolarity.frame.maxY + 2, width2: width/3*2 - 10, height2: 50, size: 18, text: "Final Volume of Diluted Solution Vf")
            addSingleSubscriptsInLabel(label: volLabelFinal!, text: "Final Volume of Diluted Solution Vf", num1: 34)
        }
        userInputVolumeFinal = UIButton(frame: CGRect (x: volLabelFinal.frame.minX, y: volLabelFinal.frame.maxY , width: width/3*2 - 10, height : 45*scale))
        userInputVolumeFinal.backgroundColor = GlobalConstants.textBackground
        userInputVolumeFinal.layer.cornerRadius = 10
        userInputVolumeFinal.layer.borderWidth = 2
        userInputVolumeFinal.setTitleColor(GlobalConstants.text, for: .normal)
        userInputVolumeFinal.setTitle("Final Volume", for: .normal)
        userInputVolumeFinal.titleLabel?.font = UIFont.init(name: "HelveticaNeue-Light", size :width*0.05)
        // userInputVolume.center.x = self.view.center.x
        userInputVolumeFinal.addTarget(self, action: #selector(volumeTapFinal), for: .touchUpInside)
        userInputVolumeFinal.layer.borderColor = GlobalConstants.border.cgColor
        
        if scale > 1 {
            conLabelFinal = createLabelWithoutCentering(x:5, y : userInputVolumeFinal.frame.maxY + 2, width2: width/3*2 - 10, height2: 50, size: 14 * scale, text: "Final Molarity of Diluted Solution Ci")
            addSingleSubscriptsInLabel(label: conLabelFinal!, text: "Final Molarity of Diluted Solution Ci", num1: 36)
            
        
        }
        else{
            conLabelFinal = createLabelWithoutCentering(x:5, y : userInputVolumeFinal.frame.maxY + 2, width2: width/3*2 - 10, height2: 50, size: 18, text: "Final Molarity of Diluted Solution Ci")
             addSingleSubscriptsInLabel(label: conLabelFinal!, text: "Final Molarity of Diluted Solution Ci", num1: 36)
        }
        userInputMolarityFinal = UIButton(frame: CGRect (x: conLabelFinal.frame.minX, y: conLabelFinal.frame.maxY , width: width/3*2 - 10, height : 45*scale ))
        userInputMolarityFinal.backgroundColor = GlobalConstants.textBackground
        userInputMolarityFinal.layer.cornerRadius = 10
        userInputMolarityFinal.layer.borderWidth = 2
        userInputMolarityFinal.setTitleColor(GlobalConstants.text, for: .normal)
        userInputMolarityFinal.setTitle("Final Molarity", for: .normal)
        userInputMolarityFinal.titleLabel?.font = UIFont.init(name: "HelveticaNeue-Light", size :width*0.05)
        //userInputMolarity.center.x = self.view.center.x
        userInputMolarityFinal.addTarget(self, action: #selector(molarityTapFinal), for: .touchUpInside)
        userInputMolarityFinal.layer.borderColor = GlobalConstants.border.cgColor
        // Initialize
        
        var items = ["mL", "L"]
        volSegment = UISegmentedControl(items: items)
        volSegment.selectedSegmentIndex = 0
        volSegment.frame = CGRect(x: userInputVolume.frame.maxX + 10 ,y: userInputVolume.frame.minY, width: width/3 - 10, height: 45*scale)
        volSegment.layer.cornerRadius = 5.0  // Don't let background bleed
        volSegment.backgroundColor = GlobalConstants.segUnselect
        volSegment.tintColor = GlobalConstants.segSelect
        volSegment.addTarget(self, action: #selector(changeVol), for: .valueChanged)
        let font = UIFont.systemFont(ofSize: 16*scale)
        volSegment.setTitleTextAttributes([NSFontAttributeName: font],
                                          for: .normal)
        
        items = ["mM", "M"]
        conSegment = UISegmentedControl(items: items)
        conSegment.selectedSegmentIndex = 0
        conSegment.frame = CGRect(x: userInputMolarity.frame.maxX + 10 ,y: userInputMolarity.frame.minY, width: width/3 - 10, height: 45*scale)
        conSegment.layer.cornerRadius = 5.0  // Don't let background bleed
        conSegment.backgroundColor = GlobalConstants.segUnselect
        conSegment.tintColor = GlobalConstants.segSelect
        conSegment.addTarget(self, action: #selector(changeCon), for: .valueChanged)
        conSegment.setTitleTextAttributes([NSFontAttributeName: font],
                                          for: .normal)
        
        items = ["mM", "M"]
        conSegmentFinal = UISegmentedControl(items: items)
        conSegmentFinal.selectedSegmentIndex = 0
        conSegmentFinal.frame = CGRect(x: userInputMolarityFinal.frame.maxX + 10 ,y: userInputMolarityFinal.frame.minY, width: width/3 - 10, height: 45*scale)
        conSegmentFinal.layer.cornerRadius = 5.0  // Don't let background bleed
        conSegmentFinal.backgroundColor = GlobalConstants.segUnselect
        conSegmentFinal.tintColor = GlobalConstants.segSelect
        conSegmentFinal.addTarget(self, action: #selector(changeConFinal), for: .valueChanged)
        conSegmentFinal.setTitleTextAttributes([NSFontAttributeName: font],
                                          for: .normal)
        
        items = ["mL", "L"]
        volSegmentFinal = UISegmentedControl(items: items)
       volSegmentFinal.selectedSegmentIndex = 0
        volSegmentFinal.frame = CGRect(x: userInputVolumeFinal.frame.maxX + 10 ,y: userInputVolumeFinal.frame.minY, width: width/3 - 10, height: 45*scale)
        volSegmentFinal.layer.cornerRadius = 5.0  // Don't let background bleed
        volSegmentFinal.backgroundColor = GlobalConstants.segUnselect
        volSegmentFinal.tintColor = GlobalConstants.segSelect
        volSegmentFinal.addTarget(self, action: #selector(changeVolFinal), for: .valueChanged)
        volSegmentFinal.setTitleTextAttributes([NSFontAttributeName: font],
                                          for: .normal)
        /* Initializing keypad */
        
        button1 = UIButton()
        button1.setTitle("1", for: .normal)
        button1.addTarget(self, action: #selector(button1Pressed), for: .touchUpInside)
        button2 = UIButton()
        button2.setTitle("2", for: .normal)
        button2.addTarget(self, action: #selector(button2Pressed), for: .touchUpInside)
        button3 = UIButton()
        button3.setTitle("3", for: .normal)
        button3.addTarget(self, action: #selector(button3Pressed), for: .touchUpInside)
        button4 = UIButton()
        button4.setTitle("4", for: .normal)
        button4.addTarget(self, action: #selector(button4Pressed), for: .touchUpInside)
        button5 = UIButton()
        button5.setTitle("5", for: .normal)
        button5.addTarget(self, action: #selector(button5Pressed), for: .touchUpInside)
        button6 = UIButton()
        button6.setTitle("6", for: .normal)
        button6.addTarget(self, action: #selector(button6Pressed), for: .touchUpInside)
        button7 = UIButton()
        button7.setTitle("7", for: .normal)
        button7.addTarget(self, action: #selector(button7Pressed), for: .touchUpInside)
        button8 = UIButton()
        button8.setTitle("8", for: .normal)
        button8.addTarget(self, action: #selector(button8Pressed), for: .touchUpInside)
        button9 = UIButton()
        button9.setTitle("9", for: .normal)
        button9.addTarget(self, action: #selector(button9Pressed), for: .touchUpInside)
        button0 = UIButton()
        button0.setTitle("0", for: .normal)
        button0.addTarget(self, action: #selector(button0Pressed), for: .touchUpInside)
        buttonDot = UIButton()
        buttonDot.setTitle(".", for: .normal)
        buttonDot.addTarget(self, action: #selector(buttonDotPressed), for: .touchUpInside)
        buttonE = UIButton()
        buttonE.setTitle("E", for: .normal)
        buttonE.addTarget(self, action: #selector(buttonEPressed), for: .touchUpInside)
        buttonNeg = UIButton()
        buttonNeg.setTitle("-", for: .normal)
        buttonNeg.addTarget(self, action: #selector(buttonNegPressed), for: .touchUpInside)
        
        buttonBack = UIButton()
        buttonBack.setTitle("⌫", for: .normal)
        buttonBack.addTarget(self, action: #selector(buttonBackPressed), for: .touchUpInside)
        
        buttonClr = UIButton()
        buttonClr.setTitle("C", for: .normal)
        buttonClr.addTarget(self, action: #selector(buttonClrPressed), for: .touchUpInside)
        
        calcButton = UIButton()
        calcButton.setTitle(" = ", for: .normal)
        calcButton.addTarget(self, action: #selector(calcButtonAction), for: .touchUpInside)
        
        clearButton = UIButton()
        clearButton.setTitle("AC", for: .normal)
        clearButton.addTarget(self, action: #selector(clearButtonAction), for: .touchUpInside)
        
        keyPad = [button1, button2, button3, buttonBack, button4, button5, button6, buttonClr, button7, button8, button9, clearButton, buttonDot, button0, buttonNeg, buttonE, calcButton]
        
        
        //positioning and sizing keypad buttons
        var x = CGFloat()
        var y = CGFloat()
        var buttonW = CGFloat()
        let buttonH: CGFloat = 0.1*height // height of each row
        
        for button in keyPad{
            
            x = 0
            y = 0.60*height // sets hight of first row
            buttonW = screenWidth/4
            
            if keyPad[4...7].contains(button){
                y = 0.70*height
            }else if keyPad[8...11].contains(button){
                y = 0.80*height
            }else if keyPad[12...16].contains(button){
                y = 0.90*height
            }
            
            if button == button2 || button == button5 || button == button8{
                x = 0.25*width
            }else if button == button3 || button == button6 || button == button9{
                x = 0.5*width
            }else if button == buttonBack || button == buttonClr || button == clearButton{
                x = 0.75*width
            }else if button == buttonDot || button == buttonE || button == buttonNeg  || button == button0 || button == calcButton{
                buttonW = width/5
                if button == button0{
                    x = width/5
                }else if button == buttonNeg{
                    x = 2*(width/5)
                }else if button == buttonE{
                    x = 3*(width/5)
                }else if button == calcButton{
                    x = 4*(width/5)
                }
            }
            
            button.frame = CGRect(x: x, y: y, width: buttonW, height: buttonH)
            button.titleLabel?.font = UIFont.init(name:"HelveticaNeue-Light", size: 40*(height/iphone7plusH))
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.backgroundColor = GlobalConstants.calcButtonBackground
            button.setTitleColor(GlobalConstants.calcButtonText, for: .normal)
            self.view.addSubview(button)
            
        }
        
        if scale > 1 {
            errorMessage = createLabelAnswer(x: 0, y: button1.frame.minY - 50 * scale, width2: width, height2: 50*scale, size: 12 * scale, text: " ")
        }else{
            errorMessage = createLabelAnswer(x: 0, y: button1.frame.minY - 65 , width2: width, height2: 90*scale, size: 22*scale , text: " ")
        }
        
        errorMessage.center.x = self.view.center.x
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(instructions)
        
        self.view.addSubview(userInputVolume)
        self.view.addSubview(userInputMolarity)
        self.view.addSubview(userInputVolumeFinal)
        self.view.addSubview(userInputMolarityFinal)
       
        self.view.addSubview(volLabel)
        self.view.addSubview(conLabel)
        self.view.addSubview(volLabelFinal)
        self.view.addSubview(conLabelFinal)
      
        self.view.addSubview(volSegment)
        self.view.addSubview(conSegment)
        self.view.addSubview(volSegmentFinal)
        self.view.addSubview(conSegmentFinal)
        
        self.view.addSubview(errorMessage)
        disableCalc()
        
        self.view.backgroundColor = GlobalConstants.background
        
        
        let posSoundPath =  Bundle.main.path(forResource: "buttonClick", ofType: "wav")
        do{
            posSound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: posSoundPath!))
        } catch{
            print(error)
        }
        
        let negSoundPath =  Bundle.main.path(forResource: "buttonDelete", ofType: "wav")
        do{
            negSound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: negSoundPath!))
        } catch{
            print(error)
        }
        
        let segSoundPath =  Bundle.main.path(forResource: "switchSeg", ofType: "wav")
        do{
            switchSeg = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: segSoundPath!))
        } catch{
            print(error)
        }
        
    }
    
    /* Pulsating calculation buttons */
    
    func pulsate(button: UIButton){
        let pulse = CABasicAnimation(keyPath: "transform.scale")
        pulse.duration = 0.1
        pulse.fromValue = 1.0
        pulse.toValue = 1.1
        pulse.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        pulse.repeatCount = 1.0
        pulse.autoreverses = true
        button.titleLabel?.layer.add(pulse, forKey: "animateTransform")
        //button.layer.add(pulse, forKey: "animateTransform")
    }
    func pulsateLabel(label: UILabel){
        let pulse = CABasicAnimation(keyPath: "transform.scale")
        pulse.duration = 0.1
        pulse.fromValue = 1.0
        pulse.toValue = 1.1
        pulse.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        pulse.repeatCount = 1.0
        pulse.autoreverses = true
        label.layer.add(pulse, forKey: "animateTransform")
        //button.layer.add(pulse, forKey: "animateTransform")
    }
    
    func numButtonHandling(button: UIButton, numStr: String){
        
   
        if editVolume == true {
            enableCalc()
            pulsate(button: userInputVolume)
            if userInputVolume.titleLabel?.text == "Initial Volume"
            {   userInputVolume.setTitle("", for: .normal)
                userInputVolume.titleLabel?.text = ""
            }
            if userInputVolume.titleLabel?.text?.characters.count == 11{
                
                errorMessage.text = "Max Size Exceeded"
                pulsateLabel(label: errorMessage)
            }
            else{
                let newStr: String = (userInputVolume.titleLabel?.text)! + String(numStr)!
                userInputVolume.setTitle(newStr, for: .normal)
            }
        }
        if editMolarity == true {
            enableCalc()
            pulsate(button: userInputMolarity)
            if userInputMolarity.titleLabel?.text == "Initial Molarity"
            {   userInputMolarity.setTitle("", for: .normal)
                userInputMolarity.titleLabel?.text = ""
            }
            //add error handling for max digits
            if userInputMolarity.titleLabel?.text?.characters.count == 11{
                
                errorMessage.text = "Max Size Exceeded"
                pulsateLabel(label: errorMessage)
            }
            else{
                let newStr: String = (userInputMolarity.titleLabel?.text)! + String(numStr)!
                userInputMolarity.setTitle(newStr, for: .normal)
            }
        }
        if editMolarityFinal == true {
            enableCalc()
            pulsate(button: userInputMolarityFinal)
            if userInputMolarityFinal.titleLabel?.text == "Final Molarity"
            {   userInputMolarityFinal.setTitle("", for: .normal)
                userInputMolarityFinal.titleLabel?.text = ""
            }
            //add error handling for max digits
            if userInputMolarityFinal.titleLabel?.text?.characters.count == 11{
                
                errorMessage.text = "Max Size Exceeded"
                pulsateLabel(label: errorMessage)
            }
            else{
                let newStr: String = (userInputMolarityFinal.titleLabel?.text)! + String(numStr)!
                userInputMolarityFinal.setTitle(newStr, for: .normal)
            }
        }
        if editVolumeFinal == true {
            enableCalc()
            pulsate(button: userInputVolumeFinal)
            if userInputVolumeFinal.titleLabel?.text == "Final Volume"
            {   userInputVolumeFinal.setTitle("", for: .normal)
                userInputVolumeFinal.titleLabel?.text = ""
            }
            if userInputVolumeFinal.titleLabel?.text?.characters.count == 11{
                
                errorMessage.text = "Max Size Exceeded"
                pulsateLabel(label: errorMessage)
            }
            else{
                let newStr: String = (userInputVolumeFinal.titleLabel?.text)! + String(numStr)!
                userInputVolumeFinal.setTitle(newStr, for: .normal)
            }
        }
        
    }
    
    func clearButtonAction(_ sender: UIButton) {
        
        negSound.play()
        userInputVolume.setTitle("Initial Volume", for: .normal)
        userInputMolarity.setTitle("Initial Molarity", for: .normal)
        userInputVolumeFinal.setTitle("Final Volume", for: .normal)
        userInputMolarityFinal.setTitle("Final Molarity", for: .normal)
        pulsate(button: userInputMolarity)
        pulsate(button: userInputVolume)
        pulsate(button: userInputMolarityFinal)
        pulsate(button: userInputVolumeFinal)
        pulsate(button: clearButton)
        errorMessage.text = " "
    }
    
    func calcButtonAction(_ sender: UIButton) {
        posSound.play()
        print ("Calculate")
        
        pulsate(button: calcButton)
        
        let volume = (userInputVolume.titleLabel?.text)!
        let molarity = (userInputMolarity.titleLabel?.text)!
        let volumeFinal = (userInputVolumeFinal.titleLabel?.text)!
        let molarityFinal = (userInputMolarityFinal.titleLabel?.text)!

        errorMessage.textColor = UIColor.red
        
        if (molarity == "Initial Molarity" && volume == "Initial Volume" && molarityFinal == "Final Molarity" && volumeFinal == "Final Volume" ||
            molarity != "Initial Molarity" && volume == "Initial Volume" && molarityFinal == "Final Molarity" && volumeFinal == "Final Volume" ||
            molarity == "Initial Molarity" && volume != "Initial Volume" && molarityFinal == "Final Molarity" && volumeFinal == "Final Volume" ||
            molarity == "Initial Molarity" && volume == "Initial Volume" && molarityFinal != "Final Molarity" && volumeFinal == "Final Volume" ||
            molarity == "Initial Molarity" && volume == "Initial Volume" && molarityFinal == "Final Molarity" && volumeFinal != "Final Volume" ){
            validCalculation = false
            errorMessage.text = "Not enough information to calculate answer"
            pulsateLabel(label: errorMessage)
        }
        if (molarity != "Initial Molarity" && volume != "Initial Volume" && molarityFinal == "Final Molarity" && volumeFinal == "Final Volume" ||
            molarity != "Initial Molarity" && volume == "Initial Volume" && molarityFinal != "Final Molarity" && volumeFinal == "Final Volume" ||
            molarity != "Initial Molarity" && volume == "Initial Volume" && molarityFinal == "Final Molarity" && volumeFinal != "Final Volume" ||
            molarity == "Initial Molarity" && volume != "Initial Volume" && molarityFinal != "Final Molarity" && volumeFinal == "Final Volume" ||
            molarity == "Initial Molarity" && volume != "Initial Volume" && molarityFinal == "Final Molarity" && volumeFinal != "Final Volume" ||
            molarity == "Initial Molarity" && volume == "Initial Volume" && molarityFinal != "Final Molarity" && volumeFinal != "Final Volume"){
            validCalculation = false
            errorMessage.text = "Not enough information to calculate answer"
            pulsateLabel(label: errorMessage)
        }
        if (molarity != "Initial Molarity" && volume != "Initial Volume" && molarityFinal != "Final Molarity" && volumeFinal != "Final Volume" ){
            validCalculation = false
            errorMessage.text = "Too much information to calculate answer"
            pulsateLabel(label: errorMessage)
        }
        
        if (molarity == "Initial Molarity" && volume == "Initial Volume" && molarityFinal == "Final Molarity" && volumeFinal == "Final Volume" ||
            molarity != "Initial Molarity" && volume == "Initial Volume" && molarityFinal == "Final Molarity" && volumeFinal == "Final Volume" ||
            molarity == "Initial Molarity" && volume != "Initial Volume" && molarityFinal == "Final Molarity" && volumeFinal == "Final Volume" ||
            molarity == "Initial Molarity" && volume == "Initial Volume" && molarityFinal != "Final Molarity" && volumeFinal == "Final Volume" ||
            molarity == "Initial Molarity" && volume == "Initial Volume" && molarityFinal == "Final Molarity" && volumeFinal != "Final Volume" ){
            validCalculation = false
            errorMessage.text = "Not enough information to calculate answer"
            pulsateLabel(label: errorMessage)
        }
        
        if (molarity != "Initial Molarity" && volume != "Initial Volume" && molarityFinal != "Final Molarity" && volumeFinal == "Final Volume" ){
            
            var iM  = Double(molarity)
            var iV  = Double(volume)
            var fM  = Double(molarityFinal)
            
            if (iM == nil || iV == nil || fM == nil){
                validCalculation = false
                errorMessage.text = "Invalid Format"
                
            }
            else{
                validCalculation = true
                print ("Calculate Final Volume")
                if (volSegmentFinal.selectedSegmentIndex == 0){
                    unitString = "mL"
                }
                else{
                    unitString = "L"
                }
                print ("Calculate Final Volume \(unitString)")
                
                if (conSegmentFinal.selectedSegmentIndex == 1){
                fM = fM! * 1000
                }
                if (conSegment.selectedSegmentIndex == 1){
                    iM = iM! * 1000
                }
                if (iM! < fM!){
                validCalculation = false
                errorMessage.text = "Final Concentration Cannot be Greater than Initial Concentration"
                }
            }
            
        }
        
        if (molarity != "Initial Molarity" && volume != "Initial Volume" && molarityFinal == "Final Molarity" && volumeFinal != "Final Volume" ){
            
            var iM  = Double(molarity)
            var iV  = Double(volume)
            var fV  = Double(volumeFinal)
            
            if (iM == nil || iV == nil || fV == nil){
                validCalculation = false
                errorMessage.text = "Invalid Format"
                
            }
            else{
                validCalculation = true
                print ("Calculate Final Molarity")
                if (conSegmentFinal.selectedSegmentIndex == 0){
                    unitString = "mM"
                }
                else{
                    unitString = "M"
                }
                print ("Calculate Final Molarity \(unitString)")
                
                if (volSegment.selectedSegmentIndex == 1){
                    iV = iV! * 1000
                }
                if (volSegmentFinal.selectedSegmentIndex == 1){
                    fV = fV! * 1000
                }
                if (fV! < iV!){
                    validCalculation = false
                    errorMessage.text = "Final Volume Cannot be Less than Initial Volume"
                }
                
                
            }
        }
        
        if (molarity != "Initial Molarity" && volume == "Initial Volume" && molarityFinal != "Final Molarity" && volumeFinal != "Final Volume" ){
            
            var iM  = Double(molarity)
            var fV  = Double(volumeFinal)
            var fM  = Double(molarityFinal)
            
            if (iM == nil || fM == nil || fV == nil){
                validCalculation = false
                errorMessage.text = "Invalid Format"
                
            }
            else{
                validCalculation = true
                print ("Calculate Initial Volume")
                if (volSegment.selectedSegmentIndex == 0){
                    unitString = "mL"
                }
                else{
                    unitString = "L"
                }
                print ("Calculate Initial Volume \(unitString)")
                
                if (conSegmentFinal.selectedSegmentIndex == 1){
                    fM = fM! * 1000
                }
                if (conSegment.selectedSegmentIndex == 1){
                    iM = iM! * 1000
                }
                if (iM! < fM!){
                    validCalculation = false
                    errorMessage.text = "Final Concentration Cannot be Greater than Initial Concentration"
                }
                
            }
        }

        if (molarity == "Initial Molarity" && volume != "Initial Volume" && molarityFinal != "Final Molarity" && volumeFinal != "Final Volume" ){
            
            var fM  = Double(molarityFinal)
            var iV  = Double(volume)
            var fV  = Double(volumeFinal)
            
            if (fM == nil || iV == nil || fV == nil){
                validCalculation = false
                errorMessage.text = "Invalid Format"
                
            }
            else{
                validCalculation = true
                print ("Calculate Initial Molarity")
                if (conSegment.selectedSegmentIndex == 0){
                    unitString = "mM"
                }
                else{
                    unitString = "M"
                }
                print ("Calculate Final Molarity \(unitString)")
                
                if (volSegment.selectedSegmentIndex == 1){
                    iV = iV! * 1000
                }
                if (volSegmentFinal.selectedSegmentIndex == 1){
                    fV = fV! * 1000
                }
                if (fV! < iV!){
                    validCalculation = false
                    errorMessage.text = "Final Volume Cannot be Less than Initial Volume"
                }
                
            }
        }
        
       
        
        if validCalculation {
            if volume == "Initial Volume" { // convert to mol and L
                var iMnum = Double(molarity)
                var fMnum = Double(molarityFinal)
                var fVnum = Double(volumeFinal)
                var iVvalue:Double = 0
                if conSegment.selectedSegmentIndex == 1 {
                        
                        iMnum = iMnum! * 1000
                    }
                    if conSegmentFinal.selectedSegmentIndex == 1 {
                        
                        fMnum = fMnum! * 1000
                    }
                if volSegmentFinal.selectedSegmentIndex == 1 {
                    
                    fVnum = fVnum! * 1000
                }
                errorMessage.textColor = GlobalConstants.titleText
                    if volSegment.selectedSegmentIndex == 1 {
                        //markup-fix needed
                        
                        iVvalue = fMnum! * fVnum! / iMnum! / 1000
                        unitString = "L"
                        errorMessage.text = "V₁ = C₂V₂/C₁ = \(iVvalue.description) \(unitString). You need \(iVvalue.description) \(unitString) of stock solution."
                        addSubscriptsInLabel(label: errorMessage!, text: "Vi = CfVf/Ci = \(iVvalue.description) \(unitString). You need \(iVvalue.description) \(unitString) of stock solution.", num1: 1, num2: 6, num3: 8, num4: 11)
                        pulsateLabel(label: errorMessage)
                    }
                    else{
                        iVvalue = fMnum! * fVnum! / iMnum!
                        unitString = "mL"
                        errorMessage.text = "V₁ = C₂V₂/C₁ = \(iVvalue.description) \(unitString). You need \(iVvalue.description) \(unitString) of stock solution."
                        addSubscriptsInLabel(label: errorMessage!, text: "Vi = CfVf/Ci = \(iVvalue.description) \(unitString). You need \(iVvalue.description) \(unitString) of stock solution.", num1: 1, num2: 6, num3: 8, num4: 11)
                        pulsateLabel(label: errorMessage)
                        
                    }
                    userInputVolume.setTitle(iVvalue.description, for: .normal)
                    
                
            }
            if molarity == "Initial Molarity" {
               
                var iVnum = Double(volume)
                var fMnum = Double(molarityFinal)
                var fVnum = Double(volumeFinal)
                var iMvalue:Double = 0
                if volSegment.selectedSegmentIndex == 1 {
                    
                    iVnum = iVnum! * 1000
                }
                if conSegmentFinal.selectedSegmentIndex == 1 {
                    
                    fMnum = fMnum! * 1000
                }
                if volSegmentFinal.selectedSegmentIndex == 1 {
                    
                    fVnum = fVnum! * 1000
                }
                 errorMessage.textColor = GlobalConstants.titleText
                if conSegment.selectedSegmentIndex == 1 { //markup-fix needed
                    
                    iMvalue = fMnum! * fVnum! / iVnum! / 1000
                    unitString = "M"
                    errorMessage.text = "C₁ = C₂V₂/V₁ = \(iMvalue.description) \(unitString)"
                    addSubscriptsInLabel(label: errorMessage!, text: "Ci = CfVf/Vi = \(iMvalue.description) \(unitString)", num1: 1, num2: 6, num3: 8, num4: 11)
                    pulsateLabel(label: errorMessage)
                }
                else{
                    iMvalue = fMnum! * fVnum! / iVnum!
                    unitString = "mM"
                    errorMessage.text = "C₁ = C₂V₂/V₁ = \(iMvalue.description) \(unitString)"
                    addSubscriptsInLabel(label: errorMessage!, text: "Ci = CfVf/Vi = \(iMvalue.description) \(unitString)", num1: 1, num2: 6, num3: 8, num4: 11)
                    pulsateLabel(label: errorMessage)
                }
                userInputMolarity.setTitle(iMvalue.description, for: .normal)
            }
            
            if volumeFinal == "Final Volume" { // convert to mol and L
                var iMnum = Double(molarity)
                var fMnum = Double(molarityFinal)
                var iVnum = Double(volume)
                var fVvalue:Double = 0
                if conSegment.selectedSegmentIndex == 1 {
                    
                    iMnum = iMnum! * 1000
                }
                if conSegmentFinal.selectedSegmentIndex == 1 {
                    
                    fMnum = fMnum! * 1000
                }
                if volSegment.selectedSegmentIndex == 1 {
                    
                    iVnum = iVnum! * 1000
                }
                 errorMessage.textColor = GlobalConstants.titleText
                if volSegmentFinal.selectedSegmentIndex == 1 { //markup-fix needed
                    
                    fVvalue = iMnum! * iVnum! / fMnum! / 1000
                    unitString = "L"
                    errorMessage.text = "V₂ = C₁V₁/C₂ = \(fVvalue.description) \(unitString). You need \((fVvalue*1000 - iVnum!)/1000) \(unitString) of solvent "
                    
                    addSubscriptsInLabel(label: errorMessage!, text: "Vf = CiVi/Cf = \(fVvalue.description) \(unitString) \n You need \((fVvalue*1000 - iVnum!)/1000) \(unitString) of solvent", num1: 1, num2: 6, num3: 8, num4: 11)
                    pulsateLabel(label: errorMessage)
                }
                else{
                    fVvalue = iMnum! * iVnum! / fMnum!
                    unitString = "mL"
                    errorMessage.text = "V₂ = C₁V₁/C₂ = \(fVvalue.description) \(unitString) \n You need \(fVvalue - iVnum!) \(unitString) of solvent "
                    
                    addSubscriptsInLabel(label: errorMessage!, text: "Vf = CiVi/Cf = \(fVvalue.description) \(unitString). You need \((fVvalue - iVnum!)) \(unitString) of solvent", num1: 1, num2: 6, num3: 8, num4: 11)
                    pulsateLabel(label: errorMessage)
                    
                }
                userInputVolumeFinal.setTitle(fVvalue.description, for: .normal)
                
                
            }
            
            if molarityFinal == "Final Molarity" { // convert to mol and L
                var iMnum = Double(molarity)
                var fVnum = Double(volumeFinal)
                var iVnum = Double(volume)
                var fMvalue:Double = 0
                if conSegment.selectedSegmentIndex == 1 {
                    
                    iMnum = iMnum! * 1000
                }
                if volSegmentFinal.selectedSegmentIndex == 1 {
                    
                    fVnum = fVnum! * 1000
                }
                if volSegment.selectedSegmentIndex == 1 {
                    
                    iVnum = iVnum! * 1000
                }
                 errorMessage.textColor = GlobalConstants.titleText
                if conSegmentFinal.selectedSegmentIndex == 1 { //markup-fix needed
                    
                    fMvalue = iMnum! * iVnum! / fVnum! / 1000
                    unitString = "M"
                    errorMessage.text = "C₂ = C₁V₁/V₂ = \(fMvalue.description) \(unitString)"
                    addSubscriptsInLabel(label: errorMessage!, text: "Cf = CiVi/Vf = \(fMvalue.description) \(unitString)", num1: 1, num2: 6, num3: 8, num4: 11)
                    pulsateLabel(label: errorMessage)
                }
                else{
                    fMvalue = iMnum! * iVnum! / fVnum!
                    unitString = "mM"
                    errorMessage.text = "C₂ = C₁V₁/V₂ = \(fMvalue.description) \(unitString)"
                     addSubscriptsInLabel(label: errorMessage!, text: "Cf = CiVi/Vf = \(fMvalue.description) \(unitString)", num1: 1, num2: 6, num3: 8, num4: 11)
                    pulsateLabel(label: errorMessage)
                    
                }
                userInputMolarityFinal.setTitle(fMvalue.description, for: .normal)
                
                
            }
            
        }
        
    }
    
    func button1Pressed(_ sender: UIButton) {
        posSound.play()
        numButtonHandling(button: button1, numStr:"1")
    }
    
    func button2Pressed(_ sender: UIButton) {
         posSound.play()
        numButtonHandling(button: button2, numStr:"2")
    }
    
    func button3Pressed(_ sender: UIButton) {
        posSound.play()
        numButtonHandling(button: button3, numStr:"3")
    }
    
    func button4Pressed(_ sender: UIButton) {
         posSound.play()
        numButtonHandling(button: button4, numStr:"4")
    }
    
    func button5Pressed(_ sender: UIButton) {
         posSound.play()
        numButtonHandling(button: button5, numStr:"5")
    }
    
    func button6Pressed(_ sender: UIButton) {
        posSound.play()
        numButtonHandling(button: button6, numStr:"6")
    }
    
    func button7Pressed(_ sender: UIButton) {
        posSound.play()
        numButtonHandling(button: button7, numStr:"7")
    }
    
    func button8Pressed(_ sender: UIButton) {
        posSound.play()
        numButtonHandling(button: button8, numStr:"8")
    }
    
    func button9Pressed(_ sender: UIButton) {
        posSound.play()
        numButtonHandling(button: button9, numStr:"9")
    }
    
    func button0Pressed(_ sender: UIButton) {
       posSound.play()
        numButtonHandling(button: button0, numStr:"0")
    }
    
    func buttonDotPressed(_ sender: UIButton) {
       posSound.play()
        numButtonHandling(button: buttonDot, numStr:".")
    }
    
    func  buttonEPressed(_ sender: UIButton) {
        posSound.play()
        numButtonHandling(button: buttonE, numStr:"E")
    }
    
    func buttonNegPressed(_ sender: UIButton) {
        posSound.play()
        numButtonHandling(button: buttonNeg, numStr:"-")
    }
    
    func buttonClrPressed(_ sender: UIButton) {
        negSound.play()
        
        if editVolume == true {
             enableCalc()
            userInputVolume.setTitle("Initial Volume", for: .normal)
            pulsate(button: userInputVolume)
        }
        if editMolarity == true {
            enableCalc()
            userInputMolarity.setTitle("Initial Molarity", for: .normal)
            pulsate(button: userInputMolarity)
        }
        if editVolumeFinal == true {
             enableCalc()
            userInputVolumeFinal.setTitle("Final Volume", for: .normal)
            pulsate(button: userInputVolumeFinal)
        }
        if editMolarityFinal == true {
            enableCalc()
            userInputMolarityFinal.setTitle("Final Molarity", for: .normal)
            pulsate(button: userInputMolarityFinal)
        }
    }
    
    func buttonBackPressed(_ sender: UIButton) {
        negSound.play()
        
        errorMessage.text = " "
        
        if editVolume == true {
            enableCalc()
            let currentString = userInputVolume.titleLabel?.text
            if currentString == "Initial Volume"{
                print ("Nothing")
            }
            else {
                var title = userInputVolume.titleLabel?.text
                if !(title?.characters.count == 1) {
                    title = title?[(title?.startIndex)! ..< (title?.index((title?.endIndex)!, offsetBy: -1))!]
                    userInputVolume.setTitle(title, for: .normal)
                }
                else{
                    userInputVolume.setTitle("Initial Volume", for: .normal)
                    
                }
            }
            pulsate(button: userInputVolume)
        }
        if editMolarity == true {
            enableCalc()
           
            let currentString = userInputMolarity.titleLabel?.text
            if currentString == "Initial Molarity"{
                print ("Nothing")
            }
            else {
                var title = userInputMolarity.titleLabel?.text
                if !(title?.characters.count == 1) {
                    title = title?[(title?.startIndex)! ..< (title?.index((title?.endIndex)!, offsetBy: -1))!]
                    userInputMolarity.setTitle(title, for: .normal)
                }
                else{
                    userInputMolarity.setTitle("Initial Molarity", for: .normal)
                    
                }
            }
            pulsate(button: userInputMolarity)
        }
        if editVolumeFinal == true {
            enableCalc()
            let currentString = userInputVolumeFinal.titleLabel?.text
            if currentString == "Final Volume"{
                print ("Nothing")
            }
            else {
                var title = userInputVolumeFinal.titleLabel?.text
                if !(title?.characters.count == 1) {
                    title = title?[(title?.startIndex)! ..< (title?.index((title?.endIndex)!, offsetBy: -1))!]
                    userInputVolumeFinal.setTitle(title, for: .normal)
                }
                else{
                    userInputVolumeFinal.setTitle("Final Volume", for: .normal)
                    
                }
            }
            pulsate(button: userInputVolumeFinal)
        }
        if editMolarityFinal == true {
            enableCalc()
            
            let currentString = userInputMolarityFinal.titleLabel?.text
            if currentString == "Final Molarity"{
                print ("Nothing")
            }
            else {
                var title = userInputMolarityFinal.titleLabel?.text
                if !(title?.characters.count == 1) {
                    title = title?[(title?.startIndex)! ..< (title?.index((title?.endIndex)!, offsetBy: -1))!]
                    userInputMolarityFinal.setTitle(title, for: .normal)
                }
                else{
                    userInputMolarityFinal.setTitle("Final Molarity", for: .normal)
                    
                }
            }
            pulsate(button: userInputMolarityFinal)
        }

    }
    

    
    func volumeTap(sender: UIButton!) {
        print("Pressed vol")
        enableCalc()
       
        editVolume = true
        editMolarity = false
        editVolumeFinal = false
        editMolarityFinal = false
       
        userInputVolume.backgroundColor = GlobalConstants.textEnabled
        userInputMolarity.backgroundColor = GlobalConstants.textBackground
        userInputVolumeFinal.backgroundColor = GlobalConstants.textBackground
        userInputMolarityFinal.backgroundColor = GlobalConstants.textBackground
    }
    
    
    func molarityTap(sender: UIButton!) {
        print("Pressed M")
        enableCalc()
        
        editVolume = false
        editMolarity = true
        editVolumeFinal = false
        editMolarityFinal = false
        
        userInputVolume.backgroundColor = GlobalConstants.textBackground
        userInputMolarity.backgroundColor = GlobalConstants.textEnabled
        userInputVolumeFinal.backgroundColor = GlobalConstants.textBackground
        userInputMolarityFinal.backgroundColor = GlobalConstants.textBackground
        
    }
    
    func volumeTapFinal(sender: UIButton!) {
        print("Pressed vol final")
        enableCalc()
        
        editVolume = false
        editMolarity = false
        editVolumeFinal = true
        editMolarityFinal = false
        
        userInputVolume.backgroundColor = GlobalConstants.textBackground
        userInputMolarity.backgroundColor = GlobalConstants.textBackground
        userInputVolumeFinal.backgroundColor = GlobalConstants.textEnabled
        userInputMolarityFinal.backgroundColor = GlobalConstants.textBackground
    }
    
    
    func molarityTapFinal(sender: UIButton!) {
        print("Pressed M Final")
        enableCalc()
        
        editVolume = false
        editMolarity = false
        editVolumeFinal = false
        editMolarityFinal = true
        
        userInputVolume.backgroundColor = GlobalConstants.textBackground
        userInputMolarity.backgroundColor = GlobalConstants.textBackground
        userInputVolumeFinal.backgroundColor = GlobalConstants.textBackground
        userInputMolarityFinal.backgroundColor = GlobalConstants.textEnabled
        
    }
    
    func changeVol(sender: UISegmentedControl) {
        switchSeg.play()
        switch sender.selectedSegmentIndex {
        case 1:
            print ("L")
            let text = userInputVolume.titleLabel?.text
            if (isValid(text: text!)){
                
                var num = Double(text!)!
                num = num / 1000
                userInputVolume.setTitle(num.description, for: .normal)
                
                if (validCalculation == true){
                    if  unitString == "mL"{
                        //markup-fix needed
                        unitString = "L"
                        errorMessage.text = "V₁ = C₂V₂/C₁ = \(num.description) \(unitString)"
                         addSubscriptsInLabel(label: errorMessage!, text: "Vi = CfVf/Ci = \(num.description) \(unitString)", num1: 1, num2: 6, num3: 8, num4: 11)
                        pulsateLabel(label: errorMessage)
                    }
                }
            }
            
        default:
            print ("mL")
            let text = userInputVolume.titleLabel?.text
            if (isValid(text: text!)){
                
                var num = Double(text!)!
                num = num * 1000
                userInputVolume.setTitle(num.description, for: .normal)
                
                
                if (validCalculation == true){
                    if  unitString == "L"{
                        
                        //markup-fix needed
                        unitString = "mL"
                        errorMessage.text = "V₁ = C₂V₂/C₁ = \(num.description) \(unitString)"
                         addSubscriptsInLabel(label: errorMessage!, text: "Vi = CfVf/Ci = \(num.description) \(unitString)", num1: 1, num2: 6, num3: 8, num4: 11)
                        pulsateLabel(label: errorMessage)
                        
                    }
                }
                
                
            }
            
        }
    }
    
    func changeCon(sender: UISegmentedControl) {
        switchSeg.play()
        switch sender.selectedSegmentIndex {
        case 1:
            print ("M")
            
            let text = userInputMolarity.titleLabel?.text
            if (isValid(text: text!)){
                
                var num = Double(text!)!
                num = num / 1000
                userInputMolarity.setTitle(num.description, for: .normal)
                
                
                if (validCalculation == true){
                    if unitString == "mM" {
                        
                        //markup-fix needed
                        unitString = "M"
                        errorMessage.text = "C₁ = C₂V₂/V₁ = \(num.description) \(unitString)"
                         addSubscriptsInLabel(label: errorMessage!, text: "Ci = CfVf/Vi = \(num.description) \(unitString)", num1: 1, num2: 6, num3: 8, num4: 11)
                        pulsateLabel(label: errorMessage)
                        
                    }
                }
                
                
            }
            
        default:
            print ("mM")
            let text = userInputMolarity.titleLabel?.text
            if (isValid(text: text!)){
                
                var num = Double(text!)!
                num = num * 1000
                userInputMolarity.setTitle(num.description, for: .normal)
                
                if (validCalculation == true){
                    if  unitString == "M"{
                        
                        //markup-fix needed
                        unitString = "mM"
                        errorMessage.text = "C₁ = C₂V₂/V₁ = \(num.description) \(unitString)"
                        addSubscriptsInLabel(label: errorMessage!, text: "Ci = CfVf/Vi = \(num.description) \(unitString)", num1: 1, num2: 6, num3: 8, num4: 11)
                        pulsateLabel(label: errorMessage)
                    }
                }
                
            }
            
        }
    }
    
 
    func changeVolFinal(sender: UISegmentedControl) {
        switchSeg.play()
        switch sender.selectedSegmentIndex {
        case 1:
            print ("L")
            let text = userInputVolumeFinal.titleLabel?.text
            if (isValid(text: text!)){
                
                var num = Double(text!)!
                num = num / 1000
                userInputVolumeFinal.setTitle(num.description, for: .normal)
                
                if (validCalculation == true){
                    if  unitString == "mL"{
                        //markup-fix needed
                        unitString = "L"
                        errorMessage.text = "V₂ = C₁V₁/C₂ = \(num.description) \(unitString)"
                        addSubscriptsInLabel(label: errorMessage!, text: "Vf = CiVi/Cf = \(num.description) \(unitString)", num1: 1, num2: 6, num3: 8, num4: 11)
                        pulsateLabel(label: errorMessage)
                    }
                }
            }
            
        default:
            print ("mL")
            let text = userInputVolumeFinal.titleLabel?.text
            if (isValid(text: text!)){
                
                var num = Double(text!)!
                num = num * 1000
                userInputVolumeFinal.setTitle(num.description, for: .normal)
                
                //markup-fix needed
                if (validCalculation == true){
                    if  unitString == "L"{
                        unitString = "mL"
                        errorMessage.text = "V₂ = C₁V₁/C₂ = \(num.description) \(unitString)"
                        addSubscriptsInLabel(label: errorMessage!, text: "Vf = CiVi/Cf = \(num.description) \(unitString)", num1: 1, num2: 6, num3: 8, num4: 11)
                        pulsateLabel(label: errorMessage)
                        
                    }
                }
                
                
            }
            
        }
    }
    
    func changeConFinal(sender: UISegmentedControl) {
        switchSeg.play()
        switch sender.selectedSegmentIndex {
        case 1:
            print ("M")
            
            let text = userInputMolarityFinal.titleLabel?.text
            if (isValid(text: text!)){
                
                var num = Double(text!)!
                num = num / 1000
                userInputMolarityFinal.setTitle(num.description, for: .normal)
                
                
                if (validCalculation == true){
                    if unitString == "mM" {
                        //markup-fix needed
                        
                        unitString = "M"
                        errorMessage.text = "C₂ = C₁V₁/V₂ = \(num.description) \(unitString)"
                        addSubscriptsInLabel(label: errorMessage!, text: "Cf = CiVi/Vf = \(num.description) \(unitString)", num1: 1, num2: 6, num3: 8, num4: 11)
                        pulsateLabel(label: errorMessage)
                        
                    }
                }
                
                
            }
            
        default:
            print ("mM")
            let text = userInputMolarityFinal.titleLabel?.text
            if (isValid(text: text!)){
                
                var num = Double(text!)!
                num = num * 1000
                userInputMolarityFinal.setTitle(num.description, for: .normal)
                
                if (validCalculation == true){
                    if  unitString == "M"{
                        
                        //markup-fix needed
                        unitString = "mM"
                        errorMessage.text = "C₂ = C₁V₁/V₂ = \(num.description) \(unitString)"
                         addSubscriptsInLabel(label: errorMessage!, text: "Cf = CiVi/Vf = \(num.description) \(unitString)", num1: 1, num2: 6, num3: 8, num4: 11)
                        pulsateLabel(label: errorMessage)
                    }
                }
                
            }
            
        }
    }

    
    func createLabel(x: CGFloat, y:CGFloat, width2:CGFloat, height2:CGFloat, size :CGFloat, text: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: x, y: y , width: width2, height: height2))
        label.textColor = GlobalConstants.titleText
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.init(name: "HelveticaNeue-Light", size: (size * scale))
        label.text = text
        label.sizeToFit()
        label.center.x = self.view.center.x
        return label
    }
    
    func createLabelWithoutCentering(x: CGFloat, y:CGFloat, width2:CGFloat, height2:CGFloat, size :CGFloat, text: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: x, y: y , width: width2, height: height2))
        label.textColor = GlobalConstants.titleText
        label.text = text
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.init(name: "HelveticaNeue-Light", size: (size * scale))
        label.sizeToFit()
        return label
    }
    
    func createLabelWithoutSizing(x: CGFloat, y:CGFloat, width2:CGFloat, height2:CGFloat, size :CGFloat, text: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: x, y: y , width: width2, height: height2))
        label.textColor = GlobalConstants.titleText
        label.text = text
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.init(name: "HelveticaNeue-Light", size: (size * scale))
        return label
    }
    
    /*Create Label title. The text doesnt change so it can be made sizeToFit() here*/
    func createLabelTitle(x: CGFloat, y:CGFloat, width2:CGFloat, height2:CGFloat, size :CGFloat, text: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: x, y: y , width: width2, height: height2))
        label.textColor = GlobalConstants.calcButtonText
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.init(name: "HelveticaNeue", size: (size * scale))
        label.text = text
        label.sizeToFit()
        label.center.x = self.view.center.x
        return label
    }
    
    /*Label is not resized */
    func createLabelAnswer(x: CGFloat, y:CGFloat, width2:CGFloat, height2:CGFloat, size :CGFloat, text: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: x, y: y , width: width2, height: height2))
        label.textColor = GlobalConstants.titleText
        label.text = text
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.init(name: "HelveticaNeue", size: (size * scale))
        return label
        
    }
    
    /*Does a quick check to see that user input is valid
     Negatives cant be in the front, and only one E is allowed*/
    func isValid(text: String) -> Bool {
        
        let s = String(text.characters.prefix(1))
        if (s == "-") {
            return false
        }
        
        let t =  text.components(separatedBy: "-")
        let tE =  text.components(separatedBy: "E")
        if (t.count > 2 || tE.count > 2){
            return false
        }
        
        if (text == "Initial Volume" || text == "Final Volume" || text == "Initial Molarity" || text == "Final Molarity")
        {
            return false
        }
        return true
    }
    
    //https://stackoverflow.com/questions/17908593/how-to-find-the-unicode-of-the-subscript-alphabet
    /*Adding subscripts to a string for displaying in a label*/
    func addSubscriptsInLabel(label: UILabel, text: String, num1: Int, num2: Int, num3: Int, num4:Int){
        
        let font:UIFont? = label.font
        let fontSuper:UIFont? =  UIFont(name: label.font.fontName, size: label.font.pointSize * 0.75
        )
        let attString:NSMutableAttributedString = NSMutableAttributedString(string: text, attributes: [NSFontAttributeName:font!])
        attString.setAttributes([NSFontAttributeName:fontSuper!,NSBaselineOffsetAttributeName:-5], range: NSRange(location:num1,length:1))
        attString.setAttributes([NSFontAttributeName:fontSuper!,NSBaselineOffsetAttributeName:-5], range: NSRange(location:num2,length:1))
        attString.setAttributes([NSFontAttributeName:fontSuper!,NSBaselineOffsetAttributeName:-5], range: NSRange(location:num3,length:1))
        attString.setAttributes([NSFontAttributeName:fontSuper!,NSBaselineOffsetAttributeName:-5], range: NSRange(location:num4,length:1))
        
        label.attributedText = attString
    }
    
    func addSingleSubscriptsInLabel(label: UILabel, text: String, num1: Int){
        
        let font:UIFont? = label.font
        let fontSuper:UIFont? =  UIFont(name: label.font.fontName, size: label.font.pointSize * 0.75
        )
        
        let attString:NSMutableAttributedString = NSMutableAttributedString(string: text, attributes: [NSFontAttributeName:font!])
        attString.setAttributes([NSFontAttributeName:fontSuper!,NSBaselineOffsetAttributeName:-5], range: NSRange(location:num1,length:1))
        
        label.attributedText = attString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /* Disabling the calculator */
    func disableCalc(){
        for key in keyPad{
            key.isEnabled = false
        }
    }
    
    /* Enabling the calculator */
    func enableCalc(){
        for key in keyPad{
            key.isEnabled = true
        }
    }
    
}






