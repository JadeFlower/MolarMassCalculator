//
//  FourthViewController.swift
//  MolarMassCalculator
//
//  Created by SETSI on 2017-08-02.
//  Copyright © 2017 SETSI. All rights reserved.
//

import UIKit
import Foundation

extension String {
    var html2AttStr: NSAttributedString? {
        return try? NSAttributedString(data: Data(utf8), options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue], documentAttributes: nil)
    }
}

class FourthViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth = self.view.frame.size.width
        let screenHeight = self.view.frame.size.height
        
        let title = UILabel(frame: CGRect(x: 20, y: 15, width: screenWidth - 40, height: 150 ))
        
        title.textColor = GlobalConstants.titleText
        title.textAlignment = .center
        title.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth * 0.07))
        title.text = "About This App"
        
        self.view.addSubview(title)
        title.numberOfLines = 0
        title.sizeToFit()
        title.center.x = self.view.center.x
        
        let assumptions = UILabel(frame: CGRect(x: 10, y: title.frame.maxY + 10 , width: screenWidth - 20, height: 150))
        assumptions.textAlignment = .left
        assumptions.text = "This app is designed to help students calculate the molar mass of a compound as well as its percent composition. Students can also understand and explore the relationship between various quantities in creating and diluting solutions. It contains a calculator to solve for C = n/V and C₁V₁ = C₂V₂."
         addSubscriptsInLabel(label: assumptions, text: "This app is designed to help students calculate the molar mass of a compound as well as its percent composition. Students can also understand and explore the relationship between various quantities in creating and diluting solutions. It contains a calculator to solve for C = n/V and CiVi = CfVf.", num1: 285, num2: 287, num3: 292, num4: 294)
        self.view.addSubview(assumptions)
        
        assumptions.center.x = self.view.center.x
        assumptions.textColor = GlobalConstants.titleText
        assumptions.numberOfLines = 0
        assumptions.lineBreakMode = .byWordWrapping
        assumptions.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth * 0.035))
        assumptions.sizeToFit()
        
        let instructionsTitle = UILabel(frame: CGRect(x: 10, y: assumptions.frame.maxY + 10 , width: screenWidth - 20, height: 150))
        instructionsTitle.text = "How to use the App"
        instructionsTitle.textAlignment = .center
        
        self.view.addSubview(instructionsTitle)
        instructionsTitle.textColor = GlobalConstants.titleText
        instructionsTitle.numberOfLines = 0
        instructionsTitle.lineBreakMode = .byWordWrapping
        instructionsTitle.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth * 0.055))
        instructionsTitle.sizeToFit()
        instructionsTitle.center.x = self.view.center.x
        
        let instructionsSubtitle1 = UILabel(frame: CGRect(x: 10, y: instructionsTitle.frame.maxY + 1 , width: screenWidth - 20, height: 150))
        instructionsSubtitle1.textAlignment = .left
        instructionsSubtitle1.text = "Molar Mass Calculator"
        self.view.addSubview(instructionsSubtitle1)
        
        instructionsSubtitle1.textColor = GlobalConstants.titleText
        instructionsSubtitle1.numberOfLines = 0
        instructionsSubtitle1.lineBreakMode = .byWordWrapping
        instructionsSubtitle1.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth * 0.045))
        instructionsSubtitle1.sizeToFit()
        // instructionsSubtitle1.center.x = self.view.center.x
        
        let instructionsDescription1 = UILabel(frame: CGRect(x: 10, y: instructionsSubtitle1.frame.maxY + 1 , width: screenWidth - 20, height: 150))
        instructionsDescription1.textAlignment = .left
        instructionsDescription1.text = "Enter in a chemical formula to get the molar mass as well as its percent composition. "
        self.view.addSubview(instructionsDescription1)
        
        instructionsDescription1.textColor = GlobalConstants.titleText
        instructionsDescription1.numberOfLines = 0
        instructionsDescription1.lineBreakMode = .byWordWrapping
        instructionsDescription1.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth * 0.035))
        instructionsDescription1.sizeToFit()
        //instructionsDescription1.center.x = self.view.center.x
        
        
        let instructionsSubtitle2 = UILabel(frame: CGRect(x: 10, y: instructionsDescription1.frame.maxY + 1 , width: screenWidth - 20, height: 150))
        instructionsSubtitle2.textAlignment = .left
        instructionsSubtitle2.text = "Calculating C = n/V"
        self.view.addSubview(instructionsSubtitle2)
        
        instructionsSubtitle2.textColor = GlobalConstants.titleText
        instructionsSubtitle2.numberOfLines = 0
        instructionsSubtitle2.lineBreakMode = .byWordWrapping
        instructionsSubtitle2.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth * 0.045))
        instructionsSubtitle2.sizeToFit()
        //instructionsSubtitle2.center.x = self.view.center.x
        
        let instructionsDescription2 = UILabel(frame: CGRect(x: 10, y: instructionsSubtitle2.frame.maxY + 1 , width: screenWidth - 20, height: 150))
        instructionsDescription2.textAlignment = .left
        instructionsDescription2.text = "Click on the textbox to select a quantity to enter. Enter any two and the third one will be automatically calculated. "
        self.view.addSubview(instructionsDescription2)
        
        instructionsDescription2.textColor = GlobalConstants.titleText
        instructionsDescription2.numberOfLines = 0
        instructionsDescription2.lineBreakMode = .byWordWrapping
        instructionsDescription2.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth * 0.035))
        instructionsDescription2.sizeToFit()
        //instructionsDescription2.center.x = self.view.center.x
        
        let instructionsSubtitle3 = UILabel(frame: CGRect(x: 10, y: instructionsDescription2.frame.maxY + 1 , width: screenWidth - 20, height: 150))
        instructionsSubtitle3.textAlignment = .left
        instructionsSubtitle3.text = "Calculating C₁V₁ = C₂V₂"
         addSubscriptsInLabel(label: instructionsSubtitle3, text: "Calculating CiVi = CfVf", num1: 13, num2: 15, num3: 20, num4: 22)
        self.view.addSubview(instructionsSubtitle3)
        
        instructionsSubtitle3.textColor = GlobalConstants.titleText
        instructionsSubtitle3.numberOfLines = 0
        instructionsSubtitle3.lineBreakMode = .byWordWrapping
        instructionsSubtitle3.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth * 0.045))
        instructionsSubtitle3.sizeToFit()
        //instructionsSubtitle3.center.x = self.view.center.x
        
        let instructionsDescription3 = UILabel(frame: CGRect(x: 10, y: instructionsSubtitle3.frame.maxY + 1 , width: screenWidth - 20, height: 150))
        instructionsDescription3.textAlignment = .left
        instructionsDescription3.text = "Click on the textbox to select a quantity to enter. Enter any three and the fourth one will be automatically calculated.  "
        self.view.addSubview(instructionsDescription3)
        
        instructionsDescription3.textColor = GlobalConstants.titleText
        instructionsDescription3.numberOfLines = 0
        instructionsDescription3.lineBreakMode = .byWordWrapping
        instructionsDescription3.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth * 0.035))
        instructionsDescription3.sizeToFit()
        //instructionsDescription3.center.x = self.view.center.x
        
        
        let authors = UILabel(frame: CGRect(x: 10, y: instructionsDescription3.frame.maxY + 10 , width: screenWidth - 20, height: 150))
        authors.textAlignment = .left
        authors.text = "Ideal Gas, version 1.0. Copyright©2017 Chrysalis Innovations Corp. All rights reserved. App developed by Sabahat Hussain , Impact Centre, University of Toronto."
        self.view.addSubview(authors)
        
        //authors.center.x = self.view.center.x
        authors.textColor = GlobalConstants.titleText
        authors.numberOfLines = 0
        authors.lineBreakMode = .byWordWrapping
        authors.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth * 0.035))
        authors.sizeToFit()
        
        let attribution = UILabel(frame: CGRect(x: 10, y: authors.frame.maxY + 10 , width: screenWidth - 20, height: 75))
        attribution.textAlignment = .left
        attribution.text = "Attribution to Entypo Pictograms by Daniel Bruce — CC BY-SA 4.0. and Freepik"
        self.view.addSubview(attribution)
        
        //attribution.center.x = self.view.center.x
        attribution.textColor = GlobalConstants.titleText
        attribution.numberOfLines = 0
        attribution.lineBreakMode = .byWordWrapping
        attribution.font = UIFont.init(name: "HelveticaNeue-Light", size: (screenWidth * 0.035))
        attribution.sizeToFit()
        
        
        let button = UIButton(frame: CGRect(x: 100, y: screenHeight - 110, width: 200, height: 70))
        button.backgroundColor = GlobalConstants.textBackground
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = GlobalConstants.border.cgColor
        button.setTitleColor(GlobalConstants.text, for: .normal)
        button.setTitle("  More Apps  ", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "HelveticaNeue-Light", size :screenWidth*0.05)
        
        button.sizeToFit()
       
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.center.x = self.view.center.x
        
        self.view.addSubview(button)
        
        self.view.backgroundColor = GlobalConstants.background
    
 
    }
    
    func buttonAction(sender: UIButton!) {
        print("Button tapped")
        
        // [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewArtist?id=885902457"]];
        
        let url = URL(string: "https://itunes.apple.com/us/developer/chrysalis-innovations/id885902457")!
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //creates gradient between two specified colours
    func addGradient(){
        
        let gradient:CAGradientLayer = CAGradientLayer()
        gradient.frame.size = self.view.frame.size
        gradient.colors = [UIColor.black.withAlphaComponent(0.85).cgColor,UIColor.black.withAlphaComponent(0.65).cgColor] //Or any colors
        self.view.layer.insertSublayer(gradient, at: 0)
        
    }
    
    
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

}
