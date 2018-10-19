Creating a CurrentWeather app, that will get the current weather and display it.
Creating a Forecast app, that will display in a slideshow, the weather for this week.

We will be pulling weather data from https://openweathermap.org

My API keys (there is a max 60 requests per hour):
981cdb18efb6358ee23e3c2586254993
44a32e15a9808544fd0d1c9c1c6df3d2

Apple Transport Security Bypass:
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>

Alamofire usage here:
https://github.com/Alamofire/Alamofire/blob/master/Documentation/Usage.md
