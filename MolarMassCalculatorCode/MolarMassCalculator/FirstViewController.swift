//
//  FirstViewController.swift
//  MolarMassCalculator
//
//  Created by SETSI on 2017-07-25.
//  Copyright © 2017 SETSI. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController, UITextFieldDelegate {

    var titleLabel:UILabel!
    var instructions:UILabel!
    var errorMessage: UILabel!
 
    var infoTitle: UILabel!
    var infoTitleEle: UILabel!
    var infoTitleNum: UILabel!
    var infoTitlePer: UILabel!
    
    var infoMessage: UILabel!
    var infoMessageNum: UILabel!
    var infoMessagePer: UILabel!
    
    var userInputField : UITextField!
    
    var calcButton : UIButton!
    var clearButton : UIButton!
    
    var width:CGFloat!
    var height:CGFloat!
    var scale:CGFloat!
    
    var scrollV:UIScrollView!
    
    var elements: [Element] = []
    
    var posSound = AVAudioPlayer()
    var negSound = AVAudioPlayer()
    
    let iphone7plusW: CGFloat = 414
    let iphone7plusH: CGFloat = 736
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //constants to be used throughout the code
        width = UIScreen.main.bounds.width
        height = UIScreen.main.bounds.height
        scale = height / 736 // designed for Iphone 7 plus
        
        self.hideKeyboardWhenTappedAround() // will hide the keyboard if clicked anywhere outside of the keyboard
        
        if scale > 1 {
        titleLabel = createLabelTitle(x: 10, y: 20 , width2: width - 20, height2: 200, size: 24*scale, text: "Molar Mass Calculator")
        
        instructions = createLabelTitle(x: 10, y: titleLabel.frame.maxY + 20, width2: width - 20, height2: 200 , size: 16*scale, text: "Enter in the chemical formula. Press Calculate to see the molar mass of it")
        }
        else {
            titleLabel = createLabelTitle(x: 10, y: 20 , width2: width - 20, height2: 200, size: 24, text: "Molar Mass Calculator")
            
            instructions = createLabelTitle(x: 10, y: titleLabel.frame.maxY + 20, width2: width - 20, height2: 200 , size: 16, text: "Enter in the chemical formula. Press Calculate to see the molar mass of it")
        }
        
       
        
        userInputField = UITextField(frame: CGRect (x: 10, y: instructions.frame.maxY + 20, width: width - 20, height : 40 * scale ))
        userInputField.backgroundColor = GlobalConstants.textEnabled
        userInputField.center.x=self.view.center.x
        userInputField.delegate = self
        userInputField.layer.cornerRadius = 3
        userInputField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        userInputField.textAlignment = .center
        
        calcButton = UIButton(frame: CGRect(x: 30, y: userInputField.frame.maxY + 15 * scale, width: width/2 - 45 , height: 70))
        calcButton.backgroundColor = GlobalConstants.textBackground
        calcButton.layer.cornerRadius = 10
        calcButton.layer.borderWidth = 2
        calcButton.setTitleColor(GlobalConstants.text, for: .normal)
        calcButton.setTitle("  Calculate  ", for: .normal)
        calcButton.titleLabel?.font = UIFont.init(name: "HelveticaNeue-Light", size :width*0.05)
        calcButton.sizeToFit()
        calcButton.center.x = self.view.center.x * 0.5
        calcButton.addTarget(self, action: #selector(calcButtonAction), for: .touchUpInside)
        calcButton.layer.borderColor = GlobalConstants.border.cgColor
        
        clearButton = UIButton(frame: CGRect(x: 110, y: userInputField.frame.maxY + 15 * scale, width: width/2 - 45 , height: 70))
        clearButton.backgroundColor =  GlobalConstants.textBackground
        clearButton.layer.cornerRadius = 10
        clearButton.layer.borderWidth = 2
        clearButton.setTitleColor(GlobalConstants.text, for: .normal)
        clearButton.setTitle("  Clear  ", for: .normal)
        clearButton.titleLabel?.font = UIFont.init(name: "HelveticaNeue-Light", size :width*0.05)
        clearButton.sizeToFit()
        clearButton.center.x = self.view.center.x * 1.5
        clearButton.addTarget(self, action: #selector(clearButtonAction), for: .touchUpInside)
        clearButton.layer.borderColor = GlobalConstants.border.cgColor
        
        if scale > 1 {
        errorMessage = createLabel(x: 10, y: clearButton.frame.maxY + 10, width2: width - 20, height2: 200 , size: 20 * scale, text: " ")
        }else{
        
         errorMessage = createLabel(x: 10, y: clearButton.frame.maxY + 10, width2: width - 20, height2: 200 , size: 20 , text: " ")
        }
        errorMessage.frame = CGRect (x:10,y:clearButton.frame.maxY+10, width: width-20, height: 30)
   
        
        infoTitle = createLabel(x: 20, y: errorMessage.frame.maxY + 15, width2: width - 40, height2: 45 , size: 22, text: "Breakdown of Formula")
        
        infoTitleEle = createLabel(x: 20, y: infoTitle.frame.maxY + 10, width2: width - 40, height2: 45 , size: 20, text: "Element")
        infoTitleEle.center.x = self.view.center.x * 2 / 6
        
        infoTitleNum = createLabel(x: 20, y: infoTitle.frame.maxY + 10, width2: width - 40, height2: 45 , size: 20, text: "Occurences")
        infoTitleNum.center.x = self.view.center.x * 2 / 6 * 3
        
        infoTitlePer = createLabel(x: 20, y: infoTitle.frame.maxY + 10, width2: width - 40, height2: 45 , size: 20, text: "% Composition")
        infoTitlePer.center.x = self.view.center.x * 2 / 6 * 5
        
        
        
        infoMessage = createLabelAnswer(x: 20, y: infoTitleNum.frame.maxY + 10, width2: width - 40, height2: 20 , size: 20, text: " ")
        infoMessage.frame = CGRect (x:20,y:infoTitleNum.frame.maxY + 10, width: infoTitleEle.frame.width, height: 300*scale)
        
        
        infoMessageNum = createLabelAnswer(x: 20, y: infoTitleNum.frame.maxY + 10, width2: width - 40, height2: 20 , size: 20, text: " ")
        infoMessageNum.frame = CGRect (x:width/3 + 10 ,y:infoTitleNum.frame.maxY + 10, width: infoTitleNum.frame.width, height: 300*scale)
        
        infoMessagePer = createLabelAnswer(x: 20, y: infoTitleNum.frame.maxY + 10, width2: width - 40, height2: 20 , size: 20, text: " ")
        infoMessagePer.frame = CGRect (x:width/3*2 + 10 ,y:infoTitleNum.frame.maxY + 10, width: infoTitlePer.frame.width, height: 300*scale)
    
        
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(instructions)
        self.view.addSubview(userInputField)
        self.view.addSubview(calcButton)
        self.view.addSubview(clearButton)
        self.view.addSubview(errorMessage)
    
        self.view.addSubview(infoMessage)
        self.view.addSubview(infoMessageNum)
        self.view.addSubview(infoMessagePer)
      
        self.view.backgroundColor = GlobalConstants.background
        
        
        //http://www.lenntech.com/periodic/mass/atomic-mass.htm
        //1 to 10
        elements.append(Element(name: "H", weight : 1.0079))
        elements.append(Element(name: "He", weight : 4.0026))
        elements.append(Element(name: "Li", weight : 6.941))
        elements.append(Element(name: "Be", weight : 9.0122))
        elements.append(Element(name: "B", weight : 10.811))
        elements.append(Element(name: "C", weight : 12.0107))
        elements.append(Element(name: "N", weight : 14.0067))
        elements.append(Element(name: "O", weight : 15.9994))
        elements.append(Element(name: "F", weight : 18.9984))
        elements.append(Element(name: "Ne", weight : 20.1797))
        
        //11 to 20
        elements.append(Element(name: "Na", weight : 22.9897))
        elements.append(Element(name: "Mg", weight : 24.305))
        elements.append(Element(name: "Al", weight : 26.9815))
        elements.append(Element(name: "Si", weight : 28.0855))
        elements.append(Element(name: "P", weight : 30.9738))
        elements.append(Element(name: "S", weight : 32.065))
        elements.append(Element(name: "Cl", weight : 35.453))
        elements.append(Element(name: "K", weight : 39.0983))
        elements.append(Element(name: "Ar", weight : 39.948))
        elements.append(Element(name: "Ca", weight : 40.078))
        
        //21 to 30
        elements.append(Element(name: "Sc", weight : 44.9559))
        elements.append(Element(name: "Ti", weight : 47.867))
        elements.append(Element(name: "V", weight : 50.9415))
        elements.append(Element(name: "Cr", weight : 51.9961))
        elements.append(Element(name: "Mn", weight : 54.938))
        elements.append(Element(name: "Fe", weight : 55.845))
        elements.append(Element(name: "Ni", weight : 58.6934))
        elements.append(Element(name: "Co", weight : 58.9332))
        elements.append(Element(name: "Cu", weight : 63.546))
        elements.append(Element(name: "Zn", weight : 65.39))
        
        //31 to 40
        elements.append(Element(name: "Ga", weight : 69.723))
        elements.append(Element(name: "Ge", weight : 72.64))
        elements.append(Element(name: "As", weight : 74.9216))
        elements.append(Element(name: "Se", weight : 78.96))
        elements.append(Element(name: "Br", weight : 79.904))
        elements.append(Element(name: "Kr", weight : 83.8))
        elements.append(Element(name: "Rb", weight : 85.4678))
        elements.append(Element(name: "Sr", weight : 87.62))
        elements.append(Element(name: "Y", weight : 88.9059))
        elements.append(Element(name: "Zr", weight : 91.224))
        
        //41 to 50
        elements.append(Element(name: "Nb", weight : 92.9064))
        elements.append(Element(name: "Mo", weight : 95.94))
        elements.append(Element(name: "Tc", weight : 98))
        elements.append(Element(name: "Ru", weight : 101.07))
        elements.append(Element(name: "Rh", weight : 102.9055))
        elements.append(Element(name: "Pd", weight : 106.42))
        elements.append(Element(name: "Ag", weight : 107.8682))
        elements.append(Element(name: "Cd", weight : 112.411))
        elements.append(Element(name: "In", weight : 114.818))
        elements.append(Element(name: "Sn", weight : 118.71))
        
        //51 to 60
        elements.append(Element(name: "Sb", weight : 121.76))
        elements.append(Element(name: "I", weight : 126.9045))
        elements.append(Element(name: "Te", weight : 127.6))
        elements.append(Element(name: "Xe", weight : 131.293))
        elements.append(Element(name: "Cs", weight : 132.9055))
        elements.append(Element(name: "Ba", weight : 137.327))
        elements.append(Element(name: "La", weight : 138.9055))
        elements.append(Element(name: "Ce", weight : 140.116))
        elements.append(Element(name: "Pr", weight : 140.9077))
        elements.append(Element(name: "Nd", weight : 144.24))
        
        //61 to 70
        elements.append(Element(name: "Pm", weight : 145.00))
        elements.append(Element(name: "Sm", weight : 150.36))
        elements.append(Element(name: "Eu", weight : 151.964))
        elements.append(Element(name: "Gd", weight : 157.25))
        elements.append(Element(name: "Tb", weight : 158.9253))
        elements.append(Element(name: "Dy", weight : 162.5))
        elements.append(Element(name: "Ho", weight : 164.9303))
        elements.append(Element(name: "Er", weight : 167.259))
        elements.append(Element(name: "Tm", weight : 168.9342))
        elements.append(Element(name: "Yb", weight : 173.04))
        
        //71 to 80
        elements.append(Element(name: "Lu", weight : 174.967))
        elements.append(Element(name: "Hf", weight : 178.49))
        elements.append(Element(name: "Ta", weight : 180.9479))
        elements.append(Element(name: "W", weight : 183.84))
        elements.append(Element(name: "Re", weight : 186.207))
        elements.append(Element(name: "Os", weight : 190.23))
        elements.append(Element(name: "Ir", weight : 192.217))
        elements.append(Element(name: "Pt", weight : 195.078))
        elements.append(Element(name: "Au", weight : 196.9665))
        elements.append(Element(name: "Hg", weight : 200.59))
        
        //81 to 90
        elements.append(Element(name: "Tl", weight : 204.3833))
        elements.append(Element(name: "Pb", weight : 207.2))//
        elements.append(Element(name: "Bi", weight : 208.9804))
        elements.append(Element(name: "Po", weight : 209))
        elements.append(Element(name: "At", weight : 210))
        elements.append(Element(name: "Rn", weight : 222))
        elements.append(Element(name: "Fr", weight : 223))
        elements.append(Element(name: "Ra", weight : 226))
        elements.append(Element(name: "Ac", weight : 227))
        elements.append(Element(name: "Th", weight : 232.0381))
        
        //91 to 100
        elements.append(Element(name: "Pa", weight : 231.0359))
        elements.append(Element(name: "U", weight : 238.0289))
        elements.append(Element(name: "Np", weight : 237))
        elements.append(Element(name: "Pu", weight : 244))
        elements.append(Element(name: "Am", weight : 243))
        elements.append(Element(name: "Cm", weight : 247))
        elements.append(Element(name: "Bk", weight : 247))
        elements.append(Element(name: "Cf", weight : 251))
        elements.append(Element(name: "Es", weight : 252))
        elements.append(Element(name: "Fm", weight : 257))
        
        //101 to 110
        elements.append(Element(name: "Md", weight : 258))
        elements.append(Element(name: "No", weight : 259))
        elements.append(Element(name: "Lr", weight : 262))
        elements.append(Element(name: "Rf", weight : 261))
        elements.append(Element(name: "Db", weight : 262))
        elements.append(Element(name: "Sg", weight : 266))
        elements.append(Element(name: "Bh", weight : 264))
        
        elements.append(Element(name: "Hs", weight : 277))
        elements.append(Element(name: "Mt", weight : 266))
        elements.append(Element(name: "Ds", weight : 281))
        
        //111 to 118
        elements.append(Element(name: "Rg", weight : 282))
        elements.append(Element(name: "Cn", weight : 285))
        elements.append(Element(name: "Nh", weight : 286))
        elements.append(Element(name: "Fl", weight : 289))
        elements.append(Element(name: "Mc", weight : 290))
        elements.append(Element(name: "Lv", weight : 293))
        elements.append(Element(name: "Ts", weight : 294))
        
        elements.append(Element(name: "Og", weight : 294))
        
        
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
    }

    
    func textFieldDidChange(textField: UITextField){
        
        print("Text changed")
        
        var string = textField.text
        string = string?.replacingOccurrences(of: "1", with: "\u{2081}")
        string = string?.replacingOccurrences(of: "2", with: "\u{2082}")
        string = string?.replacingOccurrences(of: "3", with: "\u{2083}")
        string = string?.replacingOccurrences(of: "4", with: "\u{2084}")
        string = string?.replacingOccurrences(of: "5", with: "\u{2085}")
        string = string?.replacingOccurrences(of: "6", with: "\u{2086}")
        string = string?.replacingOccurrences(of: "7", with: "\u{2087}")
        string = string?.replacingOccurrences(of: "8", with: "\u{2088}")
        string = string?.replacingOccurrences(of: "9", with: "\u{2089}")
 
        var leftBracket =  string!.components(separatedBy: "(")
        var rightBracket =  string!.components(separatedBy: ")")
        
        print ("\(leftBracket.count + 1) and \(rightBracket.count) ")
        
        if (leftBracket.count   == rightBracket.count + 2){
            
            string = string?.replacingLastOccurrenceOfString("(",
                                                             with: "").trimmingCharacters(in: .whitespaces)
            print(string ?? "nil")
        }
        
        leftBracket =  string!.components(separatedBy: "(")
        rightBracket =  string!.components(separatedBy: ")")
        
        if (rightBracket.count-1 > leftBracket.count-1){
            
            string = string?.replacingLastOccurrenceOfString(")",
                                                             with: "").trimmingCharacters(in: .whitespaces)
            print(string ?? "nil")
        }
        textField.text = string
       
    }
    
    
    func calcButtonAction (sender: UIButton!){
        
        posSound.play()
        
        var userInput = userInputField.text
        let size = errorMessage.font?.pointSize
        
        infoTitle.removeFromSuperview()
        infoTitleEle.removeFromSuperview()
        infoTitleNum.removeFromSuperview()
        infoTitlePer.removeFromSuperview()
        
        var string = userInput
        string = string?.replacingOccurrences(of: "\u{2081}", with: "1")
        string = string?.replacingOccurrences(of: "\u{2082}", with: "2")
        string = string?.replacingOccurrences(of: "\u{2083}", with: "3")
        string = string?.replacingOccurrences(of: "\u{2084}", with: "4")
        string = string?.replacingOccurrences(of: "\u{2085}", with: "5")
        string = string?.replacingOccurrences(of: "\u{2086}", with: "6")
        string = string?.replacingOccurrences(of: "\u{2087}", with: "7")
        string = string?.replacingOccurrences(of: "\u{2088}", with: "8")
        string = string?.replacingOccurrences(of: "\u{2089}", with: "9")
        
        var leftBracket =  string!.components(separatedBy: "(")
        var rightBracket =  string!.components(separatedBy: ")")
        
        if (leftBracket.count != rightBracket.count){
           string = "Invalid"
        }
        
        if (string?.contains("()"))!{
            string = "Invalid"
        }
   
        //checks for if there are any lowercase lettters after a number, definetly not a formula
        let matched = matches(for: "[0-9][(]?[a-z]", in: string!)
        if (matched.isEmpty != true ){
        string = "Invalid"
        }
        
        //check for any lower case letters after the brackets. Not a formula
        let matched2 = matches(for: "[(][a-z]", in: string!)
        if (matched2.isEmpty != true ){
            string = "Invalid"
        }
        
        let matched3 = matches(for: "\\A[a-z]+", in: string!)
        
        if (matched3.isEmpty != true ){
            string = "Invalid"
        }
        
        var (ele, num) = parse(formula: string!)
        print (userInput!)
        print (ele)
        print (num)
        
        //if either of these are empty, then the user probably entered nothing in the userfield
        if (ele.isEmpty || num.isEmpty){
        
        ele.append("Invalid")
            num.append(1)
        }
        
        let (ele2, num2) = condense(elements: ele, numbers: num)
        print (ele2)
        print (num2)
        
        let (m,n) = findMolarMassPTable(pTable: elements, test: ele2, testNum: num2)
        print (m)
        print (n)
        
        // assuming the string is valid, then it breaks down its composition
        let (eleString, per) = findComposition(pTable: elements, test: ele2, testNum: num2, mass: n)
        
        infoMessage.text = ""
        infoMessageNum.text = ""
        infoMessagePer.text = ""
        
        if m == false {
            errorMessage.textColor = UIColor.red
            errorMessage.text = "Invalid formula. Input must be case sensitive (NaOH, not naoh)."
            errorMessage.sizeToFit()
        }
        else{
            self.view.addSubview(infoTitle)
            self.view.addSubview(infoTitleEle)
            self.view.addSubview(infoTitleNum)
            self.view.addSubview(infoTitlePer)
            
            let targetString = "Molar Mass = \(n) g/mol"
            let range = NSMakeRange(0, 12)
            errorMessage.textColor = GlobalConstants.titleText
            errorMessage.attributedText = attributedString(from: targetString, nonBoldRange: range, size: size!)
            
            for i in 0...ele2.count - 1 {
            
            infoMessage.text = infoMessage.text! + "\(ele2[i]) \n"
            infoMessageNum.text = infoMessageNum.text! + "\(num2[i]) \n"
            infoMessagePer.text = infoMessagePer.text! + "\(per[i]) \n"
            
            }
            
            infoMessage.frame = CGRect(x:infoMessage.frame.minX, y:infoMessage.frame.minY, width: infoTitleEle.frame.width, height:infoMessage.frame.height)
            infoMessage.sizeToFit()
            infoMessage.center.x = infoTitleEle.center.x
            
            infoMessageNum.frame = CGRect(x:infoMessageNum.frame.minX, y:infoMessageNum.frame.minY, width: infoTitleNum.frame.width, height:infoMessageNum.frame.height)
            infoMessageNum.sizeToFit()
            infoMessageNum.center.x = infoTitleNum.center.x
            
            infoMessagePer.frame = CGRect(x:infoMessagePer.frame.minX, y:infoMessagePer.frame.minY, width: infoTitlePer.frame.width, height:infoMessagePer.frame.height)
            infoMessagePer.sizeToFit()
            infoMessagePer.center.x = infoTitlePer.center.x
            
        }
        
        //https://stackoverflow.com/questions/23602175/regex-for-parsing-chemical-formulas
    }
    
    func clearButtonAction (sender: UIButton!){
        negSound.play()
        userInputField.text = ""
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
    
    
    func createLabelAnswer(x: CGFloat, y:CGFloat, width2:CGFloat, height2:CGFloat, size :CGFloat, text: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: x, y: y , width: width2, height: height2))
        label.textColor = GlobalConstants.titleText
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.init(name: "HelveticaNeue-Bold", size: (size * scale))
        label.text = text
        label.sizeToFit()
        label.center.x = self.view.center.x
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,replacementString string: String) -> Bool {
        
        
        var filtered = string
        
        let ACCEPTABLE_CHARACTERS = " ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789()"
        // Create an `NSCharacterSet` set which includes everything *but* the digits
        let inverseSet = NSCharacterSet(charactersIn: ACCEPTABLE_CHARACTERS).inverted
        
        // At every character in this "inverseSet" contained in the string,
        // split the string up into components which exclude the characters
        // in this inverse set
        let components = string.components(separatedBy: inverseSet)
        
        // Rejoin these components
        filtered = components.joined(separator: "")  // use join("", components) if you are using Swift 1.2
        
        // If the original string is equal to the filtered string, i.e. if no
        // inverse characters were present to be eliminated, the input is valid
        // and the statement returns true; else it returns false
        return string == filtered
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func matches(for regex: String, in text: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let nsString = text as NSString
            let results = regex.matches(in: text, range: NSRange(location: 0, length: nsString.length))
            return results.map { nsString.substring(with: $0.range)}
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
  
    func parse(formula: String) -> ([String], [Int]) {
        
        //let string2 = "(Ca2NaCuOH2H45He2NaOH)2"
        
        
        let newString = formula.components(separatedBy: .whitespaces).joined()
        
        //let matched = matches(for: "[A-Z][a-z]", in: string)
        var matched = matches(for: "[(]?[A-Z][a-z]?[a-z]?[0-9]?[0-9]?[)]?[0-9]?[0-9]?", in: newString)
        
        for i in 0..<matched.count {
            
            if matched[i].contains("(") && matched[i].contains(")"){
                
                matched[i] = matched[i].replacingOccurrences(of: "(", with: "")
                
                matched[i] = matched[i].replacingOccurrences(of: ")", with: "")
            }
            
        }
        
        print(matched)
        
        var arrayElements = [String]() //where we will store the elements that contain and are between brackets
        var arrayNormalElements = [String]()// where everything else will go
        let brackets = CharacterSet(["(",")"]) // we need to look for brackets
        var count = 0 //needed to keep track of how many brackets we have
        
        for string in matched {
            
            let decimalRange = string.rangeOfCharacter(from: brackets) // check if index has bracket
            
            if decimalRange != nil {
                count = count + 1
                // if it does, it needs to be added in seperate array as it might have a subscript
                if (count % 2 == 0){
                    arrayElements.append(string)
                }
                //need for mod operator ensures that anything in between the brackets gets added in array.
            }
            if (count % 2 == 1){
                arrayElements.append(string)
            }
            
            if !(arrayElements.contains(string)){
                
                // if the index isnt in the brackets, it can be added to the normal elements
                arrayNormalElements.append(string)
            }
        }
        
        var arrayFinalElements = [String]() // where we will store our final answer
        var arrayFinalNum = [Int]()
        
        var subArrays = [[String]]() // need this as there might be multiple brackets, each needs its own array for the subscrips to be multiplied by appropriate number
        var temp = [String]()
        var finalArrays = [[String]]() // final array with the right indexes as subArrays migh have some empty entries
        if (!arrayElements.isEmpty){ // testing
            
            for string in arrayElements {
                
                let decimalRange = string.rangeOfCharacter(from: brackets) // check if index has bracket
                
                if decimalRange != nil {
                    count = count + 1
                    // if it does, it needs to be added in seperate array as it might have a subscript
                    if (count % 2 == 0){
                        temp.append(string)
                    }
                    //need for mod operator ensures that anything in between the brackets gets added in array.
                    subArrays.append(temp)
                    temp.removeAll()
                }
                if (count % 2 == 1){
                    temp.append(string)
                }
            }
            for arrays in subArrays{
                if !arrays.isEmpty{
                    finalArrays.append(arrays)
                }
            }
        }
        
        if (!finalArrays.isEmpty){
            for subarray in finalArrays {
                let last = subarray.last
                var lastVal = last?.components(separatedBy: brackets)
                if lastVal!.last == ""{
                    lastVal?.removeLast()
                    lastVal?.append("1")
                }
                let lastNum = (lastVal?.last)!
                
                var tempp = subarray
                
                var holder = [String]()
                
                tempp.removeLast()
                tempp.append((lastVal?.first)!)
                for string in tempp {
                    let finalString = string.replacingOccurrences(of: "(", with: "")
                    holder.append(finalString)
                }
                
                for string in holder{
                    let alpha = matches(for: "[A-Z][a-z]?[a-z]?", in: string)
                    var num = matches(for: "[0-9]+", in: string)
                    if num.isEmpty {
                        num.append("1")
                    }
                    
                    var val = Int(num.first!)
                    val = val! * Int (lastNum)!
                    arrayFinalElements.append(alpha.first!)
                    arrayFinalNum.append(val!)
                }
            }
        }
        
        
        if (!arrayNormalElements.isEmpty){
            
            for string in arrayNormalElements{
                let alpha = matches(for: "[A-Z][a-z]?[a-z]?", in: string)
                var num = matches(for: "[0-9]+", in: string)
                if num.isEmpty {
                    num.append("1")
                }
                arrayFinalElements.append(alpha.first!)
                arrayFinalNum.append(Int(num.first!)!)
            }
            
        }
        
        print (arrayFinalElements)
        print(arrayFinalNum)
        return (arrayFinalElements, arrayFinalNum)
    }
    
    
    func condense(elements: [String], numbers: [Int]) -> ([String], [Int]){
        
        var finalNum = [Int]()
        var finalElement = [String]()
        
        for i in 0...elements.count - 1 {
            if finalElement.contains(elements[i]){
                
                let int = finalElement.index(of: elements[i])
                finalNum[int!] = finalNum[int!] + numbers[i]
                
            }
            else{
                
                finalElement.append(elements[i])
                finalNum.append(numbers[i])
            }
        }
        
        return (finalElement, finalNum)
    }

    func findMolarMassPTable(pTable: [Element], test: [String], testNum: [Int]) -> (Bool, Double){
        
        var sum = 0.0
        
        var check = false
        var finall = true
        for  i in 0...test.count - 1 {
            
            check = false
            
            for j in 0...pTable.count - 1 {
                
                if test[i]==pTable[j].getName(){
                    
                    sum = sum + Double(testNum[i]) * pTable[j].getWeight()
                    check = true
                }
                
            }
            if (check == false){
                
                finall = false
            }
            
        }
        
        return (finall, sum)
        
    }
    
    func findComposition(pTable: [Element], test: [String], testNum: [Int], mass : Double) -> (([String], [String])){
        
        
        var finalNum = [String]()
        //var finalElement = [String]()
        
        for  i in 0...test.count - 1 {
            
            for j in 0...pTable.count - 1 {
                
                if test[i]==pTable[j].getName(){
                    
                    let comp = Double(testNum[i]) * pTable[j].getWeight() / mass * 100
                    finalNum.append(String(format: "%.2f", comp))
                    
                }
                
            }
            
            
        }
        
        return (test, finalNum)
        
    }
    
    func attributedString(from string: String, nonBoldRange: NSRange?, size : CGFloat) -> NSAttributedString {
        let fontSize = size
        let attrs = [
            NSFontAttributeName: UIFont.boldSystemFont(ofSize: fontSize),
            NSForegroundColorAttributeName: GlobalConstants.titleText
        ]
        let nonBoldAttribute = [
            NSFontAttributeName: UIFont.systemFont(ofSize: fontSize),
            ]
        let attrStr = NSMutableAttributedString(string: string, attributes: attrs)
        if let range = nonBoldRange {
            attrStr.setAttributes(nonBoldAttribute, range: range)
        }
        return attrStr
    }
    
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

//https://appventure.me/2015/10/17/advanced-practical-enum-examples/
//https://stackoverflow.com/questions/39592563/split-string-in-swift-by-their-capital-letters

