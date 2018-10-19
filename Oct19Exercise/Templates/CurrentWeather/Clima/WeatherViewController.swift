//
//  ViewController.swift
//  WeatherApp
//
//  Created by Travis Ho on 10/19/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit


class WeatherViewController: UIViewController, ChangeCityDelegate {
    
    //Variables
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "981cdb18efb6358ee23e3c2586254993"
    let lat = "33.653389"
    let long = "-84.449501" // Hardcoded lat long values for College Park
    let weatherDataModel = WeatherDataModel()
    
    //IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: call getWeatherData to load the weather data into the UI
    }
    
    //MARK: - Networking
    /***************************************************************/
    
    func getWeatherData(url: String, parameters: [String: String]) {
        // TODO: insert network call here, and update data model, and call update UI
    }
    
    //MARK: - JSON Parsing
    /***************************************************************/
    func updateDataModel(data: [String: AnyObject]?) {
        
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


