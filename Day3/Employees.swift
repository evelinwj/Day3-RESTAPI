//
//  Movie.swift
//  Day3
//
//  Created by ITBCA on 18/10/23.
//

import Foundation

struct Employees: Codable {
    var id: Int
    var employee_name: String
    var employee_salary, employee_age: Int
    var profile_image: String
    
    
    // Kalo namanya udah sama, ga perlu mapping
//    let nama, umur, gaji: String
    
//    enum CodingKeys: String, CodingKey {
//        case nama = "employee_name"
//        case umur = "employee_age"
//        case gaji = "employee_salary"
//    }
}

struct EmployeesDetails: Codable {
    var status: String
    var data: [Employees]
    var message: String
}

