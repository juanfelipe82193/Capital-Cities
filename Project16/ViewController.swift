//
//  ViewController.swift
//  Project16
//
//  Created by Juan Felipe Zorrilla Ocampo on 16/11/21.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    var websites = [String]()

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        websites = [
            "en.wikipedia.org/wiki/London",
            "en.wikipedia.org/wiki/Oslo",
            "en.wikipedia.org/wiki/Paris",
            "en.wikipedia.org/wiki/Rome",
            "es.wikipedia.org/wiki/Washington_D._C.",
            "en.wikipedia.org/wiki/Lisbon",
            "en.wikipedia.org/wiki/Prague",
            "en.wikipedia.org/wiki/Barcelona",
            "en.wikipedia.org/wiki/Amsterdam",
            "en.wikipedia.org/wiki/Florence",
            "en.wikipedia.org/wiki/Vienna",
            "en.wikipedia.org/wiki/Berlin",
            "en.wikipedia.org/wiki/Budapest",
            "en.wikipedia.org/wiki/Venice",
            "en.wikipedia.org/wiki/Madrid",
            "en.wikipedia.org/wiki/Seville",
            "en.wikipedia.org/wiki/Munich",
            "en.wikipedia.org/wiki/Porto"
        ]
        
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275))
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75))
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508))
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5))
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667))
        let lisbon = Capital(title: "Lisbon", coordinate: CLLocationCoordinate2D(latitude: 38.72927824720325, longitude: -9.13840439855716))
        let prague = Capital(title: "Prague", coordinate: CLLocationCoordinate2D(latitude: 50.103834847908175, longitude:  14.415471335268476))
        let barcelona = Capital(title: "Barcelona", coordinate: CLLocationCoordinate2D(latitude: 41.383333, longitude: 2.183333))
        let amsterdam = Capital(title: "Amsterdam", coordinate: CLLocationCoordinate2D(latitude: 52.366667, longitude: 4.9))
        let florence = Capital(title: "Florence", coordinate: CLLocationCoordinate2D(latitude: 43.771389, longitude: 11.254167))
        let vienna = Capital(title: "Vienna", coordinate: CLLocationCoordinate2D(latitude: 48.2, longitude: 16.366667))
        let berlin = Capital(title: "Berlin", coordinate: CLLocationCoordinate2D(latitude: 52.52, longitude: 13.405))
        let budapest = Capital (title: "Budapest", coordinate: CLLocationCoordinate2D(latitude: 47.4925, longitude: 19.051389))
        let venice = Capital(title: "Venice", coordinate: CLLocationCoordinate2D(latitude: 45.4375, longitude: 12.335833))
        let madrid = Capital(title: "Madrid", coordinate: CLLocationCoordinate2D(latitude: 40.416667, longitude: -3.716667))
        let seville = Capital(title: "Seville", coordinate: CLLocationCoordinate2D(latitude: 37.39, longitude: -5.99))
        let munich = Capital(title: "Munich", coordinate: CLLocationCoordinate2D(latitude: 48.1375, longitude: 11.575))
        let porto = Capital(title: "Porto", coordinate: CLLocationCoordinate2D(latitude: 41.162142, longitude: -8.621953))
        
        mapView.addAnnotations([
            london, oslo, paris, rome, washington, lisbon, prague, barcelona, amsterdam, florence, vienna, berlin, budapest, venice, madrid, seville, munich, porto
        ])
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editMapView))
        navigationItem.title = "Popular cities"
        
        let initialLocation = CLLocation(latitude: 48.8567, longitude: 2.3508)
        mapView.centerToLocation(initialLocation)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 1. If the annotation isn't from a capital city, it must return nil so iOS uses a default view
        guard annotation is Capital else { return nil }
        
        // 2. Define a reuse identifier. This is a string that will be used to ensure we reuse annotation views as much as possible
        let identifier = "capital"
        
        // 3. Try to dequeue an annotation view from the map view's pool of unused views
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView ?? MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        
        annotationView.canShowCallout = true
        let btn = UIButton(type: .detailDisclosure)
        annotationView.rightCalloutAccessoryView = btn
        annotationView.annotation = annotation
        
        annotationView.animatesDrop = true
        annotationView.pinTintColor = UIColor.systemRed
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        let placeName = capital.title
        
        switch placeName {
        case "London":
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
                vc.selectedWebsite = websites[0]
                navigationController?.pushViewController(vc, animated: true)
            }
        case "Oslo":
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
                vc.selectedWebsite = websites[1]
                navigationController?.pushViewController(vc, animated: true)
            }
        case "Paris":
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
                vc.selectedWebsite = websites[2]
                navigationController?.pushViewController(vc, animated: true)
            }
        case "Rome":
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
                vc.selectedWebsite = websites[3]
                navigationController?.pushViewController(vc, animated: true)
            }
        case "Washington":
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
                vc.selectedWebsite = websites[4]
                navigationController?.pushViewController(vc, animated: true)
            }
        case "Lisbon":
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
                vc.selectedWebsite = websites[5]
                navigationController?.pushViewController(vc, animated: true)
            }
        case "Prague":
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
                vc.selectedWebsite = websites[6]
                navigationController?.pushViewController(vc, animated: true)
            }
        case "Barcelona":
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
                vc.selectedWebsite = websites[7]
                navigationController?.pushViewController(vc, animated: true)
            }
        case "Amsterdam":
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
                vc.selectedWebsite = websites[8]
                navigationController?.pushViewController(vc, animated: true)
            }
        case "Florence":
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
                vc.selectedWebsite = websites[9]
                navigationController?.pushViewController(vc, animated: true)
            }
        case "Vienna":
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
                vc.selectedWebsite = websites[10]
                navigationController?.pushViewController(vc, animated: true)
            }
        case "Berlin":
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
                vc.selectedWebsite = websites[11]
                navigationController?.pushViewController(vc, animated: true)
            }
        case "Budapest":
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
                vc.selectedWebsite = websites[12]
                navigationController?.pushViewController(vc, animated: true)
            }
        case "Venice":
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
                vc.selectedWebsite = websites[13]
                navigationController?.pushViewController(vc, animated: true)
            }
        case "Madrid":
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
                vc.selectedWebsite = websites[14]
                navigationController?.pushViewController(vc, animated: true)
            }
        case "Seville":
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
                vc.selectedWebsite = websites[15]
                navigationController?.pushViewController(vc, animated: true)
            }
        case "Munich":
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
                vc.selectedWebsite = websites[16]
                navigationController?.pushViewController(vc, animated: true)
            }
        case "Porto":
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
                vc.selectedWebsite = websites[17]
                navigationController?.pushViewController(vc, animated: true)
            }
        default:
            let ac = UIAlertController(title: placeName, message: "404 Not found", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(ac, animated: true)
        }
    }
    
    @objc func editMapView() {
        let ac = UIAlertController(title: "Edit Map", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Hybrid", style: .default, handler: { [weak self] _ in
            self?.mapView.mapType = .hybrid
        }))
        ac.addAction(UIAlertAction(title: "Hybrid Flyover", style: .default, handler: { [weak self] _ in
            self?.mapView.mapType = .hybridFlyover
        }))
        ac.addAction(UIAlertAction(title: "Muted Standard", style: .default, handler: { [weak self] _ in
            self?.mapView.mapType = .mutedStandard
        }))
        ac.addAction(UIAlertAction(title: "Standard", style: .default, handler: { [weak self] _ in
            self?.mapView.mapType = .standard
        }))
        ac.addAction(UIAlertAction(title: "Satelite", style: .default, handler: { [weak self] _ in
            self?.mapView.mapType = .satellite
        }))
        ac.addAction(UIAlertAction(title: "Satelite Flyover", style: .default, handler: { [weak self] _ in
            self?.mapView.mapType = .satelliteFlyover
        }))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(ac, animated: true)
    }
    
}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 2000500
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}

