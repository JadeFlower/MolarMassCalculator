//
//  SecondViewController.swift
//  MolarMassCalculator
//
//  Created by SETSI on 2017-07-25.
//  Copyright © 2017 SETSI. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    
    var titleLabel:UILabel!
    var instructions:UILabel!
    var errorMessage: UILabel!
    
    var molLabel:UILabel!
    var volLabel:UILabel!
    var conLabel: UILabel!
    
    var userInputMoles : UIButton!
    var userInputVolume : UIButton!
    var userInputMolarity : UIButton!
    
    var calcButton : UIButton!
    var clearButton : UIButton!
    
    var width:CGFloat!
    var height:CGFloat!
    var scale:CGFloat!
    
    var volSegment : UISegmentedControl!
    var conSegment : UISegmentedControl!
    var molSegment : UISegmentedControl!
    
    let iphone7plusW: CGFloat = 414
    let iphone7plusH: CGFloat = 736
    
    var editMole:Bool = false
    var editVolume:Bool = false
    var editMolarity:Bool = false
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
        
        
        
        
    
        if scale > 1{
        
        titleLabel = createLabelTitle(x: 10, y: 20 , width2: width - 20, height2: 200, size: 24 * scale , text: "Calculating C = n/V")
        instructions = createLabelTitle(x: 10, y: titleLabel.frame.maxY + 10, width2: width - 20, height2: 200 , size: 20 * scale, text: "Enter any two values")
        molLabel = createLabelWithoutCentering(x:5, y : instructions.frame.maxY + 2, width2: width/3 - 10, height2: 50, size: 14*scale, text: "Moles n")
        }
        else{
        
            titleLabel = createLabelTitle(x: 10, y: 20 , width2: width - 20, height2: 200, size: 24  , text: "Calculating C = n/V")
            
            instructions = createLabelTitle(x: 10, y: titleLabel.frame.maxY + 10, width2: width - 20, height2: 200 , size: 20 , text: "Enter any two values")
            molLabel = createLabelWithoutCentering(x:5, y : instructions.frame.maxY + 2, width2: width/3 - 10, height2: 50, size: 18, text: "Moles n")
        
        }
        
        userInputMoles = UIButton(frame: CGRect (x: molLabel.frame.minX , y: molLabel.frame.maxY + 10,  width: width/3*2 - 10, height : 45 * scale ))
        userInputMoles.backgroundColor = GlobalConstants.textBackground
        userInputMoles.layer.cornerRadius = 10
        userInputMoles.layer.borderWidth = 2
        userInputMoles.setTitleColor(GlobalConstants.text, for: .normal)
        userInputMoles.setTitle("Moles", for: .normal)
        userInputMoles.titleLabel?.font = UIFont.init(name: "HelveticaNeue-Light", size :width*0.05)
       // userInputMoles.center.x = self.view.center.x
        userInputMoles.addTarget(self, action: #selector(molTap(sender:)), for: .touchUpInside)
        userInputMoles.layer.borderColor = GlobalConstants.border.cgColor
        
        
        if scale > 1{
        volLabel = createLabelWithoutCentering(x:5, y : userInputMoles.frame.maxY + 15, width2: width/3 - 10, height2: 50, size: 14 * scale, text: "Volume V")
        }else{
        
         volLabel = createLabelWithoutCentering(x:5, y : userInputMoles.frame.maxY + 15, width2: width/3 - 10, height2: 50, size: 18 , text: "Volume V")
        }
        
        
        userInputVolume = UIButton(frame: CGRect (x: volLabel.frame.minX , y: volLabel.frame.maxY + 10 , width: width/3*2 - 10, height : 45 * scale))
        userInputVolume.backgroundColor = GlobalConstants.textBackground
        userInputVolume.layer.cornerRadius = 10
        userInputVolume.layer.borderWidth = 2
        userInputVolume.setTitleColor(GlobalConstants.text, for: .normal)
        userInputVolume.setTitle("Volume", for: .normal)
        userInputVolume.titleLabel?.font = UIFont.init(name: "HelveticaNeue-Light", size :width*0.05)
       // userInputVolume.center.x = self.view.center.x
        userInputVolume.addTarget(self, action: #selector(volumeTap), for: .touchUpInside)
          userInputVolume.layer.borderColor = GlobalConstants.border.cgColor
        
        if scale > 1{
            conLabel = createLabelWithoutCentering(x:5, y : userInputVolume.frame.maxY + 15, width2: width/3 - 10, height2: 50, size: 14*scale, text: "Molarity C")}
        else{
         conLabel = createLabelWithoutCentering(x:5, y : userInputVolume.frame.maxY + 15, width2: width/3 - 10, height2: 50, size: 18, text: "Molarity C")
        
        }
        
        
        userInputMolarity = UIButton(frame: CGRect (x: conLabel.frame.minX , y: conLabel.frame.maxY + 10 , width: width/3*2 - 10, height : 45 * scale))
        userInputMolarity.backgroundColor = GlobalConstants.textBackground
        userInputMolarity.layer.cornerRadius = 10
        userInputMolarity.layer.borderWidth = 2
        userInputMolarity.setTitleColor(GlobalConstants.text, for: .normal)
        userInputMolarity.setTitle("Molarity", for: .normal)
        userInputMolarity.titleLabel?.font = UIFont.init(name: "HelveticaNeue-Light", size :width*0.05)
        //userInputMolarity.center.x = self.view.center.x
        userInputMolarity.addTarget(self, action: #selector(molarityTap), for: .touchUpInside)
        userInputMolarity.layer.borderColor = GlobalConstants.border.cgColor
        
        // Initialize
        
       
        
        var items = ["mmol", "mol"]
        molSegment = UISegmentedControl(items: items)
        molSegment.selectedSegmentIndex = 0
        molSegment.frame = CGRect(x: userInputMoles.frame.maxX + 10 ,y: userInputMoles.frame.minY, width: width/3 - 10, height: 45 * scale)
        molSegment.layer.cornerRadius = 5.0
        molSegment.backgroundColor = GlobalConstants.segUnselect
        molSegment.layer.borderColor = GlobalConstants.segSelect.cgColor
        molSegment.tintColor = GlobalConstants.segSelect
        molSegment.addTarget(self, action: #selector(changeMol), for: .valueChanged)
        let font = UIFont.systemFont(ofSize: 16*scale)
        molSegment.setTitleTextAttributes([NSFontAttributeName: font],
                                          for: .normal)
        
        items = ["mL", "L"]
        volSegment = UISegmentedControl(items: items)
        volSegment.selectedSegmentIndex = 0
        volSegment.frame = CGRect(x: userInputVolume.frame.maxX + 10 ,y: userInputVolume.frame.minY, width: width/3 - 10, height: 45 * scale)
        volSegment.layer.cornerRadius = 5.0  // Don't let background bleed
        volSegment.backgroundColor = GlobalConstants.segUnselect
        volSegment.tintColor = GlobalConstants.segSelect
        volSegment.addTarget(self, action: #selector(changeVol), for: .valueChanged)
        volSegment.layer.borderColor = GlobalConstants.segSelect.cgColor
        volSegment.setTitleTextAttributes([NSFontAttributeName: font],
                                          for: .normal)
      
        items = ["mM", "M"]
        conSegment = UISegmentedControl(items: items)
        conSegment.selectedSegmentIndex = 0
        conSegment.frame = CGRect(x: userInputMolarity.frame.maxX + 10 ,y: userInputMolarity.frame.minY, width: width/3 - 10, height: 45 * scale)
        conSegment.layer.cornerRadius = 5.0  // Don't let background bleed
        conSegment.backgroundColor = GlobalConstants.segSelect
        conSegment.tintColor = GlobalConstants.segUnselect
        conSegment.addTarget(self, action: #selector(changeCon), for: .valueChanged)
        conSegment.layer.borderColor = GlobalConstants.segSelect.cgColor
        conSegment.setTitleTextAttributes([NSFontAttributeName: font],
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
        errorMessage = createLabelAnswer(x: 0, y: button1.frame.minY - 52 * scale, width2: width, height2: 45, size: 20 * scale, text: " ")
        }else{
          errorMessage = createLabelAnswer(x: 0, y: button1.frame.minY - 50 , width2: width, height2: 45, size: 20 , text: " ")
        }
        
        
        
        errorMessage.center.x = self.view.center.x
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(instructions)
        self.view.addSubview(userInputMoles)
        self.view.addSubview(userInputVolume)
        self.view.addSubview(userInputMolarity)
        self.view.addSubview(molLabel)
        self.view.addSubview(volLabel)
        self.view.addSubview(conLabel)
        self.view.addSubview(molSegment)
        self.view.addSubview(volSegment)
        self.view.addSubview(conSegment)
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
    }
  
    func numButtonHandling(button: UIButton, numStr: String){
        
        if editMole == true {
            enableCalc()
            pulsate(button: userInputMoles)
            if userInputMoles.titleLabel?.text == "Moles"
            {   userInputMoles.setTitle("", for: .normal)
                userInputMoles.titleLabel?.text = ""
            }
            if userInputMoles.titleLabel?.text?.characters.count == 11{
                
                errorMessage.text = "Max Size Exceeded"
                pulsateLabel(label: errorMessage)
            }
            else{
            let newStr: String = (userInputMoles.titleLabel?.text)! + String(numStr)!
                userInputMoles.setTitle(newStr, for: .normal)}
        }
        if editVolume == true {
            enableCalc()
            pulsate(button: userInputVolume)
            if userInputVolume.titleLabel?.text == "Volume"
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
            if userInputMolarity.titleLabel?.text == "Molarity"
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
        
    }
    
    func clearButtonAction(_ sender: UIButton) {
    
        negSound.play()
        userInputMoles.setTitle("Moles", for: .normal)
        userInputVolume.setTitle("Volume", for: .normal)
        userInputMolarity.setTitle("Molarity", for: .normal)
        pulsate(button: userInputMolarity)
        pulsate(button: userInputVolume)
        pulsate(button: userInputMoles)
        pulsate(button: clearButton)
        errorMessage.text = " "
    }
    
    func calcButtonAction(_ sender: UIButton) {
        posSound.play()
        print ("Calculate")
        
        errorMessage.textColor = UIColor.red
        
        pulsate(button: calcButton)
        
        let mol = (userInputMoles.titleLabel?.text)!
        let volume = (userInputVolume.titleLabel?.text)!
        let molarity = (userInputMolarity.titleLabel?.text)!
        let molF =  String(mol.characters.prefix(1))
        let volumeF =  String(volume.characters.prefix(1))
        let molarityF =  String(molarity.characters.prefix(1))

        if (mol != "Moles" && volume != "Volume" && molarity == "Molarity"){
            print ("Calcuate Molarity")
            validCalculation = true
            if (conSegment.selectedSegmentIndex == 0){
            unitString = "mM"
            }
            else{
            unitString = "M"
            }
        }
        if (mol == "Moles" && volume != "Volume" && molarity != "Molarity"){
            print ("Calcuate Moles")
            validCalculation = true
            if (molSegment.selectedSegmentIndex == 0){
                unitString = "mmol"
            }
            else{
                unitString = "mol"
            }
        }
        if (mol != "Moles" && volume == "Volume" && molarity != "Molarity"){
            print ("Calcuate Volume")
            validCalculation = true
            if (volSegment.selectedSegmentIndex == 0){
                unitString = "mL"
            }
            else{
                unitString = "L"
            }
        }
        
        
        // check for invalidity of calculations
        if (mol != "Moles" && volume != "Volume" && molarity != "Molarity"){
            print ("Too much info to calcuate answer")
            validCalculation = false
            errorMessage.text = "Too much information to calculate answer"
            pulsateLabel(label: errorMessage)
            
        }
        if (mol == "Moles" && volume == "Volume" && molarity != "Molarity"){
            print ("Not enough Info")
            validCalculation = false
            errorMessage.text = "Too little information to calculate answer"
            pulsateLabel(label: errorMessage)
        }
        if (mol == "Moles" && volume != "Volume" && molarity == "Molarity"){
            print ("Not enough Info")
            validCalculation = false
            errorMessage.text = "Too little information to calculate answer"
            pulsateLabel(label: errorMessage)
        }
        if (mol != "Moles" && volume == "Volume" && molarity == "Molarity"){
            print ("Not enough Info")
            validCalculation = false
            errorMessage.text = "Too little information to calculate answer"
            pulsateLabel(label: errorMessage)
        }
        if (mol == "Moles" && volume == "Volume" && molarity == "Molarity"){
            print ("Not enough Info")
            validCalculation = false
            errorMessage.text = "Too little information to calculate answer"
            pulsateLabel(label: errorMessage)
        }
        
        if (molF == "-" || volumeF == "-" || molarityF == "-" ){
            print ("Not valid")
            validCalculation = false
            errorMessage.text = "Invalid Format"
            pulsateLabel(label: errorMessage)
        }
        
        let m =  mol.components(separatedBy: "-")
        let M =  molarity.components(separatedBy: "-")
        let v =  volume.components(separatedBy: "-")
        let mE =  mol.components(separatedBy: "E")
        let ME =  molarity.components(separatedBy: "E")
        let vE =  volume.components(separatedBy: "E")
        print (mol)
        if (m.count > 2 || M.count > 2 || v.count > 2 || mE.count > 2 || ME.count > 2 || vE.count > 2){
            print ("Invalid Syntax")
            validCalculation = false
            errorMessage.text = "Invalid Format"
            pulsateLabel(label: errorMessage)
        }
        
        if validCalculation {
        
            if mol == "Moles" {
            
                var volumeNum = Double(volume)
                var molarityNum = Double(molarity)
                if (volumeNum == nil || molarityNum == nil) {
                    print("There was an error!")
                    errorMessage.text = "Invalid Format"
                    pulsateLabel(label: errorMessage)
                } else {
                    
                    
                    if conSegment.selectedSegmentIndex == 1 {
                        
                        molarityNum = molarityNum! * 1000
                    }
                    if volSegment.selectedSegmentIndex == 1 {
                        
                        volumeNum = volumeNum! * 1000
                    }
                    var molValue:Double = 0
                    
                    errorMessage.textColor = GlobalConstants.titleText
                    
                    if molSegment.selectedSegmentIndex == 1 {
                        
                        molValue = molarityNum! * volumeNum! / 1000
                        unitString = "mol"
                        errorMessage.text = "n = CV = \(molValue.description) \(unitString)"
                        pulsateLabel(label: errorMessage)
                    }
                    else{
                        molValue = molarityNum! * volumeNum!
                        unitString = "mmol"
                        errorMessage.text = "n = CV = \(molValue.description) \(unitString)"
                        pulsateLabel(label: errorMessage)
                    
                    }
                  
                    
                
                userInputMoles.setTitle(molValue.description, for: .normal)
           
                }
            }
            if volume == "Volume" {
                var molNum = Double(mol)
                var molarityNum = Double(molarity)
                if (molNum == nil || molarityNum == nil) {
                    print("There was an error!")
                    errorMessage.text = "Invalid Format"
                    pulsateLabel(label: errorMessage)
                } else {
                    
                    
                    
                    if conSegment.selectedSegmentIndex == 1 {
                        
                        molarityNum = molarityNum! * 1000
                    }
                    if molSegment.selectedSegmentIndex == 1 {
                        
                        molNum = molNum! * 1000
                    }
                    var volValue:Double = 0
                    
                    errorMessage.textColor = GlobalConstants.titleText
                    
                    if volSegment.selectedSegmentIndex == 1 {
                        
                        volValue = molNum! / molarityNum! / 1000
                        unitString = "L"
                        errorMessage.text = "V = n/C = \(volValue.description) \(unitString)"
                        pulsateLabel(label: errorMessage)
                    }
                    else{
                        volValue = molNum! / molarityNum!
                        unitString = "mL"
                        errorMessage.text = "V = n/C = \(volValue.description) \(unitString)"
                        pulsateLabel(label: errorMessage)
                        
                    }
                userInputVolume.setTitle(volValue.description, for: .normal)
                
                }
            }
            if molarity == "Molarity" {
                var volumeNum = Double(volume)
                var molNum = Double(mol)
                if (molNum == nil || volumeNum == nil) {
                    print("There was an error!")
                    errorMessage.text = "Invalid Format"
                    pulsateLabel(label: errorMessage)
                } else {
                    
                    
                    if volSegment.selectedSegmentIndex == 1 {
                        
                        volumeNum = volumeNum! * 1000
                    }
                    if molSegment.selectedSegmentIndex == 1 {
                        
                        molNum = molNum! * 1000
                    }
                    var molarityValue:Double = 0
                    
                    errorMessage.textColor = GlobalConstants.titleText
                    
                    if conSegment.selectedSegmentIndex == 1 {
                        
                        molarityValue = molNum! / volumeNum! / 1000
                        unitString = "M"
                        errorMessage.text = "C = n/V = \(molarityValue.description) \(unitString)"
                        pulsateLabel(label: errorMessage)
                    }
                    else{
                        molarityValue = molNum! / volumeNum!
                        unitString = "mM"
                        errorMessage.text = "C = n/V = \(molarityValue.description) \(unitString)"
                        pulsateLabel(label: errorMessage)
                        
                    }
                    
                userInputMolarity.setTitle(molarityValue.description, for: .normal)
              
                }
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
        if editMole == true {
            enableCalc()
            userInputMoles.setTitle("Moles", for: .normal)
            pulsate(button: userInputMoles)
        }
        if editVolume == true {
            userInputVolume.setTitle("Volume", for: .normal)
            pulsate(button: userInputVolume)
        }
        if editMolarity == true {
            enableCalc()
            userInputMolarity.setTitle("Molarity", for: .normal)
            pulsate(button: userInputMolarity)
        }
    }
    
    func buttonBackPressed(_ sender: UIButton) {
        negSound.play()
        
        errorMessage.text = " "
      
        //posSound.play()
        if editMole == true {
            enableCalc()
            let currentString = userInputMoles.titleLabel?.text
            if currentString == "Moles"{
            print ("Nothing")
            }
            else {
             var title = userInputMoles.titleLabel?.text
                if !(title?.characters.count == 1) {
                    title = title?[(title?.startIndex)! ..< (title?.index((title?.endIndex)!, offsetBy: -1))!]
                userInputMoles.setTitle(title, for: .normal)
                }
                else{
                    userInputMoles.setTitle("Moles", for: .normal)

                }
            }
            pulsate(button: userInputMoles)
        }
        if editVolume == true {
            enableCalc()
            let currentString = userInputVolume.titleLabel?.text
            if currentString == "Volume"{
                print ("Nothing")
            }
            else {
                var title = userInputVolume.titleLabel?.text
                if !(title?.characters.count == 1) {
                    title = title?[(title?.startIndex)! ..< (title?.index((title?.endIndex)!, offsetBy: -1))!]
                    userInputVolume.setTitle(title, for: .normal)
                }
                else{
                    userInputVolume.setTitle("Volume", for: .normal)
                    
                }
            }
            pulsate(button: userInputVolume)
        }
        if editMolarity == true {
            enableCalc()
            enableCalc()
            let currentString = userInputMolarity.titleLabel?.text
            if currentString == "Molarity"{
                print ("Nothing")
            }
            else {
                var title = userInputMolarity.titleLabel?.text
                if !(title?.characters.count == 1) {
                    title = title?[(title?.startIndex)! ..< (title?.index((title?.endIndex)!, offsetBy: -1))!]
                    userInputMolarity.setTitle(title, for: .normal)
                }
                else{
                    userInputMolarity.setTitle("Molarity", for: .normal)
                    
                }
            }
            pulsate(button: userInputMolarity)
        }
    }
    
    func molTap(sender: UIButton!) {
        //pressing on the button enables the user to edit it.
        print("Pressed mol")
        enableCalc()
        editMole = true
        editVolume = false
        editMolarity = false
        
        userInputMoles.backgroundColor = GlobalConstants.textEnabled
        userInputVolume.backgroundColor = GlobalConstants.textBackground
        userInputMolarity.backgroundColor = GlobalConstants.textBackground
        
    }
    
    func volumeTap(sender: UIButton!) {
        print("Pressed mol")
        enableCalc()
        editMole = false
        editVolume = true
        editMolarity = false
        
        userInputMoles.backgroundColor = GlobalConstants.textBackground
        userInputVolume.backgroundColor = GlobalConstants.textEnabled
        userInputMolarity.backgroundColor = GlobalConstants.textBackground
    }
    
    
    func molarityTap(sender: UIButton!) {
        print("Pressed mol")
        enableCalc()
        editMole = false
        editVolume = false
        editMolarity = true
        
        userInputMoles.backgroundColor = GlobalConstants.textBackground
        userInputVolume.backgroundColor = GlobalConstants.textBackground
        userInputMolarity.backgroundColor = GlobalConstants.textEnabled
        
    }
    

    
    func changeVol(sender: UISegmentedControl) {
        
        switchSeg.play()
        
        switch sender.selectedSegmentIndex {
        case 1:
            print ("m^3")
            let text = userInputVolume.titleLabel?.text
            if (isValid(text: text!)){
                
                var num = Double(text!)!
                num = num / 1000
                userInputVolume.setTitle(num.description, for: .normal)
             
                if (validCalculation == true){
                    if  unitString == "mL"{
                        
                        unitString = "L"
                        errorMessage.text = "V = n/C = \(num.description) \(unitString)"
                        pulsateLabel(label: errorMessage)
                    }
                }
            }
            
        default:
             print ("L")
             let text = userInputVolume.titleLabel?.text
             if (isValid(text: text!)){
                
                var num = Double(text!)!
                num = num * 1000
                userInputVolume.setTitle(num.description, for: .normal)
                
                
                if (validCalculation == true){
                    if  unitString == "L"{
                        
                    
                        unitString = "mL"
                        errorMessage.text = "V = n/C = \(num.description) \(unitString)"
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
                        
                        
                        unitString = "M"
                        errorMessage.text = "C = n/V = \(num.description) \(unitString)"
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
                        
                
                        unitString = "mM"
                        errorMessage.text = "C = n/V = \(num.description) \(unitString)"
                        pulsateLabel(label: errorMessage)
                    }
                }
                
            }

        }
    }
    
    func changeMol(sender: UISegmentedControl) {
        
        switchSeg.play()
        
        switch sender.selectedSegmentIndex {
        case 1:
            print ("mol")
            
            let text = userInputMoles.titleLabel?.text
            if (isValid(text: text!)){
                
                var num = Double(text!)!
                num = num / 1000
                userInputMoles.setTitle(num.description, for: .normal)
                
                
                if (validCalculation == true){
                    if unitString == "mmol" {
                        
                        
                        unitString = "mol"
                        errorMessage.text = "n = CV = \(num.description) \(unitString)"
                        pulsateLabel(label: errorMessage)
                        
                    }
                }
                
                
            }
            
        default:
            print ("mmol")
            let text = userInputMoles.titleLabel?.text
            if (isValid(text: text!)){
                var num = Double(text!)!
                num = num * 1000
                userInputMoles.setTitle(num.description, for: .normal)
                
                if (validCalculation == true){
                    if  unitString == "mol"{
                        unitString = "mmol"
                        errorMessage.text = "n = CV = \(num.description) \(unitString)"
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
        
        if (text == "Moles" || text == "Volume" || text == "Molarity")
        {
        
        return false
        }
        return true
    }

    
    func createLabelAnswer(x: CGFloat, y:CGFloat, width2:CGFloat, height2:CGFloat, size :CGFloat, text: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: x, y: y , width: width2, height: height2))
        label.textColor = GlobalConstants.titleText
        label.text = text
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.init(name: "HelveticaNeue-CondensedBlack", size: (size * scale))
        return label
        
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






