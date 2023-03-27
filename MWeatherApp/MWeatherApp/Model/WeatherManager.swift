import Foundation

struct WeatherManager{
    
   
    
    // Specific URL type provided by the API
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=09af2b44fa23824fb63a8e516d4ad990&units=metric"
    // Fetching weather by forming the custom URL and make a request thru the performRequest() method
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        self.performRequest(urlString: urlString)
    }
    // This method creates a request to the API and has 4 steps
    func performRequest(urlString:  String){
        // Create the URL
        if let url = URL(string: urlString) {
            // Create an URLSession
            let session = URLSession(configuration: .default)
            // Create a task for the URLSession
            // Completion handle is function used for speeding up the procces and see what to do if
            // the task fails
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    parseJSON(weatherData: safeData)
                }
            }
            // Start the task
            task.resume()
        }
    }
    
}

    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id //taken from JSON
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
        } catch{
            print(error)
        }
    
        
       
        }

