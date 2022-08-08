//
//  HomeViewController.swift
//  Currency Converter_1
//
//  Created by gopinath.raveendran on 08/08/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var EuroLabel: UILabel!
     
    @IBOutlet weak var convertedCurrencyLabel: UILabel!
     
    @IBOutlet weak var currencySegmentControl: UISegmentedControl!
    
    @IBOutlet weak var CurrencySlider: UISlider! {
        didSet{
            CurrencySlider.minimumValue = 1
            CurrencySlider.maximumValue = 500
            CurrencySlider.value = 0
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        convertedCurrencyLabel.text = "81.05 RUP"
    }


    @IBAction func sliderValueChanged(_ sender: Any) {
        print("CurrencySlider.value", CurrencySlider.value)
        updateCurrencyLabelForSlider(value: CurrencySlider.value)
    }
    
    
    @IBAction func segmentValueChanged(_ sender: Any) {
        updateCurrencyLabelForSlider(value: CurrencySlider.value)
    }
    
    func updateCurrencyLabelForSlider(value: Float){
        let EuroCurrency = Int(value)
        EuroLabel.text = "\(EuroCurrency) EUR"
        
        var convertedCurrencyString = ""
        switch currencySegmentControl.selectedSegmentIndex{
        case 0:
            let InrCurrencyString = String(format: "%.2f", convertCurrencyFrom(Euro: EuroCurrency).Inr)
            convertedCurrencyString = InrCurrencyString + "RUP"
        default:
            let UsdCurrencyString = String(format: "%.2f" , convertCurrencyFrom(Euro: EuroCurrency).Usd)
            convertedCurrencyString = UsdCurrencyString + "USD"
     }
        convertedCurrencyLabel.text = convertedCurrencyString
    }
    
    
    func convertCurrencyFrom(Euro: Int) -> (Inr: Double, Usd: Double){
        let Inr = Double(Euro) * 81.05
        let Usd = Double(Euro) * 1.02
        return(Inr , Usd)
            
    
}

}
