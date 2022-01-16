//
//  Service.swift
//  UberClone
//
//  Created by benji on 11/12/2021.
//

import Firebase
import CoreLocation
import GeoFire

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")
let REF_DRIVER_LOCATIONS = DB_REF.child("driver-locations")

struct Service {
    
    static let shared = Service()
    
    func fetchUserData(completion: @escaping(User) -> Void) {
        guard let currentuid = Auth.auth().currentUser?.uid else {return}
        REF_USERS.child(currentuid).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary = snapshot.value as? [String: Any] else {return}
            let user = User(dictionary: dictionary)
            completion(user)
        }
    }
    
//    func fetchDrivers(location: CLLocation) {
//        let geofire = GeoFire(firebaseRef: REF_DRIVER_LOCATIONS)
//
//        REF_DRIVER_LOCATIONS.observe(.value) { snapshot in
//
//             ISSUE HERE WITH ""
//            geofire.query(at: location, withRadius: 50).observe(.keyEntered) { uid, location in
//                print("DEBUG: Uid is \(uid)")
//                print("DEBUG: Location coordinates \(location.coordinate)")
//            }
//
//
//
//            }
//        }
}

