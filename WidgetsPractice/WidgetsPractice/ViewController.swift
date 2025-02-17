//
//  ViewController.swift
//  WidgetsPractice
//
//  Created by ÖMER  on 15.02.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelSonuc: UILabel!
    @IBOutlet weak var textFieldData: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var switchLabel: UISwitch!
    @IBOutlet weak var segmentLabel: UISegmentedControl!
    
    @IBOutlet weak var labelSlider: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    let placeholerText = NSAttributedString(string: "Enter a data please",
                                            attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelSlider.text = "\(Int(slider.value))"
        textFieldData.placeholder = "Enter a Data"
        stepperLabel.text = "\(Int(stepper.value))"
    }

    @IBAction func doButton(_ sender: UIButton) {
        if textFieldData.text != ""{
            if let comingData = textFieldData.text {
                labelSonuc.text = comingData
            }
        }else{
            textFieldData.attributedPlaceholder = placeholerText
            
        }
        
    }
    
    
    @IBAction func onButton(_ sender: UIButton) {
        imageView.image = UIImage(named: "resim2")
    }
    
    @IBAction func offButton(_ sender: UIButton) {
        imageView.image = UIImage(named: "resim1")
    }
    
    
    @IBAction func switchAction(_ sender: UISwitch) {
        if sender.isOn{
            print("Switch On")
        }else{
            print("Switch Off")
        }
    }
    
    
    
    @IBAction func lookButton(_ sender: UIButton) {
        // Switch
        print("Switch Durum : \(switchLabel.isOn)")
        
        // Segment
        let secilenIndex = segmentLabel.selectedSegmentIndex
        if let secilenKategori = segmentLabel.titleForSegment(at: secilenIndex){
            print("Segment Durum : \(secilenKategori)")
        }
        print(Int(slider.value))
        
        print(Int(stepper.value))
        
    }
    
    @IBAction func segmentButton(_ sender: UISegmentedControl) {
        let secilenIndex = sender.selectedSegmentIndex
        if let secilenKategori = sender.titleForSegment(at: secilenIndex){
            print("Seçilen Kategori : \(secilenKategori)")
        }
    }
    
    
    @IBAction func sliderDegisim(_ sender: UISlider) {
        labelSlider.text = String(Int(sender.value))
    }
    
    
    @IBAction func stepperDegisim(_ sender: UIStepper) {
        stepperLabel.text = String(Int(sender.value))
    }
    
    
    
}

