import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    var weatherManager = WeatherManager()
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        
        
        
        
        
    }
    @IBOutlet weak var searchTextField: UITextField!
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        
        
        
        
        
    }
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var degreeLabel: UILabel!
    
    @IBOutlet weak var degreeSignLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextField.text != "" {
            return true
        }else{
            searchTextField.placeholder = "Type a city name!"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text{
            weatherManager.fetchWeather(cityName: city)
            
        }
    }
    
    
}

