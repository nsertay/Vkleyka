//
//  Statement.swift
//  Vkleyka
//
//  Created by Nurmukhanbet Sertay on 22.05.2023.
//

import Foundation
import UIKit

struct Statement {
    let firstCountryName: String
    let firstCountryImage: String
    let secondCountryName: String
    let secondCountryImage: String
    let visaType: VisaType
    let dateOfIssue: String
    
    enum VisaType: String {
        case tourist = "Туристическая"
    }
}
