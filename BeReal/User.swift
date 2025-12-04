//
//  User.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 04/12/25.
//

import Foundation
import Firebase
import FirebaseFirestore


struct User: Decodable, Identifiable{
    @DocumentID var id: String?
    var username: String?
    var profileImageUrl: String?
    var name: String
    var date: String
    var bio: String?
    var location: String?
}


