//
//  QRProvider.swift
//  QuizScanner
//
//  Created by Travis Ho on 11/23/18.
//  Copyright © 2018 Travis Ho. All rights reserved.
//

import Foundation
import UIKit

class QRPRovider {
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
}
