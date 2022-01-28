//
//  Capital.swift
//  Project16
//
//  Created by Juan Felipe Zorrilla Ocampo on 16/11/21.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
