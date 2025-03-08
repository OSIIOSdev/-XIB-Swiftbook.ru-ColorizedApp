//
//  ViewController.swift
//  ColorizedApp
//
//  Created by OSIIOSdev on 07.03.2025.
//

import UIKit

final class ColorizedViewController: UIViewController {
    
    // MARK: - @IBOutlets
    
    @IBOutlet var colorizedView: UIView!
    
    @IBOutlet var redColorLabel: UILabel!
    @IBOutlet var greenColorLabel: UILabel!
    @IBOutlet var blueColorLabel: UILabel!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        getSliderSettings()
        getLabelSettings()
        getViewSettings()
        
    }
    
    
    // MARK: - @IBActions
    
    @IBAction func colorSliderChanged(_ sender: UISlider) {
        
        if sender == redColorSlider {
            redValueLabel.text = String(format: "%.2f", sender.value)
            getViewColor(for: sender)
        } else if sender == greenColorSlider {
            greenValueLabel.text = String(format: "%.2f", sender.value)
            getViewColor(for: sender)
        } else {
            blueValueLabel.text = String(format: "%.2f", sender.value)
            getViewColor(for: sender)
            
        }
    }
    
    
    // MARK: - Private methods
    
    private func getViewSettings(with sliders: UISlider...) {
        
        getViewColor(for: redColorSlider)
        getViewColor(for: greenColorSlider)
        getViewColor(for: blueColorSlider)
        
        colorizedView.layer.cornerRadius = 20
        colorizedView.layer.borderColor = UIColor.white.cgColor
        colorizedView.layer.borderWidth = 2.5
        
    }
    
    private func getSliderSettings() {
        
        getSliderSettings(for: redColorSlider, with: .systemRed)
        getSliderSettings(for: greenColorSlider, with: .systemGreen)
        getSliderSettings(for: blueColorSlider, with: .systemBlue)
        
    }
    
    private func getLabelSettings() {
        
        setLabelSettings(for: redValueLabel, with: redColorSlider)
        setLabelSettings(for: greenValueLabel, with: greenColorSlider)
        setLabelSettings(for: blueValueLabel, with: blueColorSlider)
        
    }
    
    private func getViewColor(for slider: UISlider) {
        
        colorizedView.backgroundColor = UIColor(red: CGFloat(Float(redValueLabel.text ?? "0") ?? 0),
                                                green: CGFloat(Float(greenValueLabel.text ?? "0") ?? 0),
                                                blue: CGFloat(Float(blueValueLabel.text ?? "0") ?? 0),
                                                alpha: 1)
        
    }
    
    private func getSliderSettings(for slider: UISlider, with tumbleColor: UIColor) {
        
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = Float.random(in: 0...1)
        slider.maximumTrackTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        switch tumbleColor {
        case .systemRed:
            slider.thumbTintColor = .systemRed
            slider.minimumTrackTintColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        case .systemGreen:
            slider.thumbTintColor = .systemGreen
            slider.minimumTrackTintColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        default:
            slider.thumbTintColor = .systemBlue
            slider.minimumTrackTintColor = #colorLiteral(red: 0.5369998813, green: 0.5776420236, blue: 0.9568473697, alpha: 1)
        }
        
    }
    
    private func setLabelSettings(for label: UILabel, with slider: UISlider) {
    
        label.text = String(format: "%.2f", slider.value)
    
        getLabelSettings(for: redValueLabel,
                         greenValueLabel,
                         blueValueLabel,
                         redColorLabel,
                         greenColorLabel,
                         blueColorLabel)
    }
    
    private func getLabelSettings(for label: UILabel...) {
        
        label.forEach {
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 14, weight: .medium)
        }
        
    }
    
}

