//
//  jsoninfo.swift
//  Assets
//
//  Created by Muneera Y on 21/10/1443 AH.
//

import Foundation

struct Jsoninfo: Codable{
    let id:Int
    let first_name: String
    let last_name: String
    var contact : contacte?
    let gender: String
    let job: job?
    let avatar: String?
    let birth_day: String?
    let education: String?
    let bio: String?
    let country: String
    let pet_animal: String?
    let city: String?

}
struct contacte: Codable {
    let email: String?
    let phone_number: String?
    let address: String
}
struct job: Codable {
    let company: String
    let role:String
    
}



