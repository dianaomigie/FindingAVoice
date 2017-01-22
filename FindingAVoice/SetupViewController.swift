//
//  SetupViewController.swift
//  ControlTask
//
//  Created by Charlie Williams on 06/01/2017.
//  Copyright © 2017 Charlie Williams. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController {

    @IBOutlet weak var vocabSizeLabel: UILabel!
    @IBOutlet weak var numPrecedentsLabel: UILabel!
    @IBOutlet weak var numConsequentsLabel: UILabel!
    @IBOutlet weak var stringLengthLabel: UILabel!
    @IBOutlet weak var strideLengthLabel: UILabel!
    @IBOutlet weak var densityLabel: UILabel!
    
    
    @IBAction func vocabSizeSliderChanged(_ sender: UISlider) {
        vocabSizeLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func precedentsSliderChanged(_ sender: UISlider) {
        numPrecedentsLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func consequentsSliderChanged(_ sender: UISlider) {
        numConsequentsLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func stringLengthSliderChanged(_ sender: UISlider) {
        stringLengthLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func strideLengthSliderChanged(_ sender: UISlider) {
        strideLengthLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func densitySliderChanged(_ sender: UISlider) {
        densityLabel.text = String(format: "%.3f", sender.value)
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination as! QuestionViewController
        let preceding = Int(numPrecedentsLabel.text!)!
        let following = Int(numConsequentsLabel.text!)!
        let stride = Int(strideLengthLabel.text!)!
        let length = Int(stringLengthLabel.text!)!
        let density = Float(densityLabel.text!)!
        
        assert(stride > 0)
        assert(density > 0 && density < 0.5)
        assert(preceding > 0 && following > 0)
        
        let rules = [Rule(precedingCount: preceding, followingCount: following, density: density, stride: stride)]        
        let ruleSet = RuleSet(rules: rules)

        destination.ruleSet = ruleSet
        destination.stringLength = length
    }
}
