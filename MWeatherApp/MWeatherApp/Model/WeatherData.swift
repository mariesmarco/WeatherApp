import Foundation
// Mapping the data from the API, Json -> Objects
struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    
    struct Main: Decodable{
        let temp: Double
        
    }
    
    struct Weather: Decodable {
        let id: Int
        let description: String
        
    }
}
