//
//  NetworkManager.swift
//  TaskManager
//
//  Created by CMSC389Q on 10/11/18.
//  Copyright © 2018 CMSC389Q. All rights reserved.
//

import Foundation

class NetworkManager {
    
    // Single Instance of Network Manager
    static var sharedInstance: NetworkManager = NetworkManager()
    
    // Private Initializer So That No One Can Make Another Network Manager
    private init() {
        
    }
    
    // Method To Get Latest Tasks
    func getTasks(completionHandler: @escaping (RequestStatus, [Task]?) -> ()) {
        // Create the HTTP Request
        let request: URLRequest = createRequest(url: API.BASE_URL.rawValue, httpMethod: .GET, parameters: nil)
        
        // Execute the Request
        executeRequest(request: request) { (requestStatus, jsonData) in
            
            // Switch through the result value. Either execution Failed or Succeeded.
            switch(requestStatus) {
            case .SUCCESS:
                /* Execution Was Success */
                
                // Empty Array Of New Tasks
                var tasks: [Task] = []
                
                // Loop Through Each Task JSON And Create New Task From Data
                for taskJSON in jsonData! {
                    
                    // Extracts Task Data From JSON
                    guard let taskTitle: String = taskJSON["title"] as? String else {
                        continue
                    }
                    guard let taskCategoryString: String = taskJSON["category"] as? String else {
                        continue
                    }
                    
                    guard let taskCategory: Category = Category(rawValue: taskCategoryString) else {
                        continue
                    }
                    
                    // Creates A New Task From Data in JSON
                    let newTask: Task = Task(withTitle: taskTitle, withCategory: taskCategory)
                    
                    // Add the Task To The Array of Tasks
                    tasks.append(newTask)
                    
                }
                
                // Call Completion Handler And Pass In Array of New Tasks
                completionHandler(.SUCCESS, tasks)
            case .FAIL:
                // Execution Failed. Call Completion Handler With Failure
                print("BOO!")
                completionHandler(.FAIL, nil)
                
            }
        }
    }
    
    func addTask(taskTitle: String, taskCategory: String) {
        // Creates a POST Request
        let postRequest = createRequest(url: API.BASE_URL.rawValue, httpMethod: .POST, parameters: ["title": taskTitle, "category": taskCategory])
        
        // Executes the POST Request
        executeRequest(request: postRequest) { (result, _) in
            if (result == .SUCCESS) {
                print("SUCCESSFULLY ADDED TASK!")
            } else {
                print("WE MESSED UP! DIDNT ADD TASK :(")
            }
        }
    }
    
    // Method To Create A HTTP Request
    private func createRequest(url: String, httpMethod: HTTPMethod, parameters: [String: Any]?) -> URLRequest {
        
        // Make The URL
        let requestURL: URL = URL(string: url)!
        
        // HTTP Request Headers
        let headers: [String: String] = [
            "content-type": "application/json",
            "x-apikey": API.AUTH_KEY.rawValue,
            "cache-control": "no-cache"
        ]
        
        // Creates The HTTP Request From URL
        var networkRequest: URLRequest = URLRequest(url: requestURL)
        
        // If Request Parameters Were Included Then Add Them
        if let postParameters: [String: Any] = parameters {
            do {
                let postData = try JSONSerialization.data(withJSONObject: postParameters, options: [])
                networkRequest.httpBody = postData as Data
            } catch {
                
            }
        }
        
        // Adds Headers
        networkRequest.allHTTPHeaderFields = headers
        
        // Specifies The HTTP Request Method
        networkRequest.httpMethod = httpMethod.rawValue
        
        return networkRequest
    }
    
    // Method Executes The HTTP Request
    private func executeRequest(request: URLRequest, completion: @escaping (RequestStatus, [[String: Any]]?) -> ()) {
        // Grabs a reference to the shared URLSession
        let session: URLSession = URLSession.shared
        
        // Creates a data task with the request details
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            // Checking if the request response had an error
            if (error != nil) {
                print("Request Had An Error")
                completion(.FAIL, nil)
            }
            
            // Making Sure We Have Data Returned Back
            guard let myData = data else {
                completion(.FAIL, nil)
                return
            }
            
            // Prints the Response Status Code
            if let response = response {
                print((response as! HTTPURLResponse).statusCode)
            }
           
            // Tries to extract JSON from the data in the HTTP Response
            do {
                if let json = try JSONSerialization.jsonObject(with: myData, options: .mutableContainers) as? [[String: Any]] {
                    print(json)
                    completion(.SUCCESS, json)
                }
            } catch {
                // JSON Failed To Parse
                completion(.SUCCESS, nil)
            }
        })

        // Executes the Data Task
        dataTask.resume()
    }
}

enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
}

enum RequestStatus {
    case SUCCESS
    case FAIL
}

enum API: String {
    case BASE_URL = "https://tasks-59e6.restdb.io/rest/tasks"
    case AUTH_KEY = "7d3bd3e96a90e2a8698001aacd729196f2931"
}

