//
//  ViewController.swift
//  WeatherApp
//
//  Created by Travis Ho on 10/19/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class WeatherViewController: UIViewController, ChangeCityDelegate {
    
    //Variables
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "981cdb18efb6358ee23e3c2586254993"
    let latitude = "33.653389"
    let longitude = "-84.449501" // Hardcoded lat long values for College Park
    let weatherDataModel = WeatherDataModel()
    
    //IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let params : [String : String] = ["lat" : latitude, "lon" : longitude, "appid" : APP_ID]
        getWeatherData(url: WEATHER_URL, parameters: params)
    }
    
    //MARK: - Networking
    /***************************************************************/
    
    func getWeatherData(url: String, parameters: [String: String]) {
        SVProgressHUD.show(withStatus: "Loading weather data")
        Alamofire.request(WEATHER_URL, method: .get, parameters: parameters).responseJSON { (response) in
            SVProgressHUD.dismiss()
            switch response.result {
            case .success:
                self.updateDataModelJSON(json: JSON(response.result.value!))
                self.updateUI()
            case .failure(let error):
                print(error)
                self.cityLabel.text = "Connection Issues"
            }
        }
    }
    
    //MARK: - JSON Parsing
    /***************************************************************/
    func updateDataModel(data: [String: AnyObject]?) {
        if let data = data {
            let mainData = data["main"] as! [String: AnyObject]
            weatherDataModel.temperature = Int(mainData["temp"] as! Double - 273.15)
            weatherDataModel.city = data["name"] as! String
            weatherDataModel.condition = ((data["weather"] as! [AnyObject])[0] as! [String: AnyObject])["id"] as! Int
            weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition)
        }
    }
    
    // a cleaner way to parse the weather data
    func updateDataModelJSON(json : JSON) {
        let tempResult = json["main"]["temp"].doubleValue
        weatherDataModel.temperature = Int(tempResult - 273.15)
        weatherDataModel.city = json["name"].stringValue
        weatherDataModel.condition = json["weather"][0]["id"].intValue
        weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition)
    }
    
    //MARK: - UI Updates
    /***************************************************************/
    
    func updateUI() {
        cityLabel.text = weatherDataModel.city
        temperatureLabel.text = "\(self.weatherDataModel.temperature)°"
        weatherIcon.image = UIImage(named: self.weatherDataModel.weatherIconName)
    }
    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    func userEnteredANewCityName(city: String) {
        // city is the city name passed from second VC
        let params : [String : String] = ["q" : city, "appid" : APP_ID]
        getWeatherData(url: WEATHER_URL, parameters: params)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeCityName" {
            let destinationVC = segue.destination as! ChangeCityViewController
            destinationVC.delegate = self
        }
    }
}
