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

class WeatherViewController: UIViewController, ChangeCityDelegate {
    
    //Variables
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/forecast"
    let APP_ID = "981cdb18efb6358ee23e3c2586254993"
    let latitude = "33.653389"
    let longitude = "-84.449501" // Hardcoded lat long values for College Park
    var weatherDataModelArray = [WeatherDataModel]()
    var index: Int = 0
    
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
        Alamofire.request(WEATHER_URL, method: .get, parameters: parameters).responseJSON { (response) in
            switch response.result {
            case .success:
                self.updateDataModel(data: response.result.value as? [String : AnyObject])
                var _ = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.updateUI), userInfo: nil, repeats: true)
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
            let listData = data["list"] as! [AnyObject]
            for i in 0..<7 {
                let weatherDataModel = WeatherDataModel()
                weatherDataModel.temperature = Int(((listData[i] as! [String: AnyObject])["main"] as! [String: AnyObject])["temp"] as! Double - 273.15)
                weatherDataModel.city = "\(weatherDataModel.dayOfWeek(day: i))"
                weatherDataModel.condition = ((listData[i] as! [String: AnyObject])["weather"] as! [AnyObject])[0]["id"] as! Int
                weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition)
                weatherDataModelArray.append(weatherDataModel)
            }
        }
    }
    
    //MARK: - UI Updates
    /***************************************************************/
    @objc
    func updateUI() {
        cityLabel.text = weatherDataModelArray[index].city
        temperatureLabel.text = "\(weatherDataModelArray[index].temperature)°"
        weatherIcon.image = UIImage(named: weatherDataModelArray[index].weatherIconName)
        index = (index + 1) % 7
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
