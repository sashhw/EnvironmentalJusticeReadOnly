//
//  UIKitMap.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 8/2/21.
//

import UIKit
import MapKit
import CoreLocation
import SwiftUI

//class ViewController: UIViewController {
//    let location = Location(id: 0, name: "", latitude: 0.0, longitude: 0.0, year: "", image: "")
//    let map = MKMapView()
//    let coordinate = CLLocationCoordinate2D(latitude: 35.179473, longitude: -96.574201)
//    var mapView: MKMapView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.addSubview(map)
//        map.frame = view.bounds
//        map.setRegion(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 45, longitudeDelta: 65)), animated: false)
//        addCustomPin()
//    }
//
//    private func addCustomPin() {
//        let pin = MKPointAnnotation()
//        pin.title = location.name
//    }
//
//    private func addAnnotation() {
//        let firstCase = MKPointAnnotation()
//        firstCase.title = "Los Alamos (Manhattan Project)"
//        firstCase.coordinate = CLLocationCoordinate2D(latitude: 35.875556, longitude: -106.324167)
//        let secondCase = MKPointAnnotation()
//        secondCase.title = "Delano Grape Strike"
//        secondCase.coordinate = CLLocationCoordinate2D(latitude: 33.601685, longitude: -90.772131)
//
//        mapView.addAnnotation(firstCase)
//        mapView.addAnnotation(secondCase)
//    }
//}




//------------------------------------------------------------
//struct MapView: UIViewRepresentable {
//
//    let locations: [MKPointAnnotation]
//
//    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
//            let v = MKMapView()
//        v.showAnnotations(v.annotations, animated: true)
//            v.addAnnotations(locations)
//            return v
//        }
//        
//
//    func updateUIView(_ view: MKMapView, context: Context){
//            let coordinate = CLLocationCoordinate2D(
//                latitude: 35.179473, longitude: -96.574201)
//            let span = MKCoordinateSpan(latitudeDelta: 45, longitudeDelta: 65)
//            let region = MKCoordinateRegion(center: coordinate, span: span)
//            view.setRegion(region, animated: true)
//    }
//}

//class MapViewCoordinator: NSObject, MKMapViewDelegate {
//var mapViewController: MapView
//
//init(_ control: MapView) {
//    self.mapViewController = control
//}
//
//func mapView(_ mapView: MKMapView, viewFor
//     annotation: MKAnnotation) -> MKAnnotationView?{
//   //Custom View for Annotation
//    let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customView")
//    annotationView.canShowCallout = true
//    //Your custom image icon
//    annotationView.image = UIImage(named: "locationPin")
//    return annotationView
// }
//}

//import SwiftUI
//import MapKit
//
//struct City: Identifiable {
//    let id = UUID()
//    let coordinate: CLLocationCoordinate2D
//    let name: String
//    let image: String
//}
//
//struct MapExample: View {
//    @State private var cities: [City] = [
//        City(coordinate: .init(latitude: 35.875556, longitude: -106.324167), name: "Los Alamos (Manhattan Project)", image: "losal1-1"),
//        City(coordinate: .init(latitude: 35.770725, longitude: -119.466926), name: "Delano Grape Strike", image: "delano"),
//        City(coordinate: .init(latitude: 33.601685, longitude: -90.772131), name: "Hawkins V. Town of Shaw", image: "hawkinsshaw")
//    ]
//
//
//    @State private var region = MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude: 35.179473, longitude: -96.574201),
//        span: MKCoordinateSpan(latitudeDelta: 45, longitudeDelta: 65)
//    )
//
//    var body: some View {
//        Map(coordinateRegion: $region, annotationItems: cities) { city in
//            MapAnnotation(
//                coordinate: city.coordinate,
//                anchorPoint: CGPoint(x: 0.5, y: 0.5)
//            ) {
//                Image(city.image)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 100, height: 30)
//                    .clipShape(Circle())
//                    .overlay(
//                        Circle().stroke(Color.white, lineWidth: 25/10))
//                    .shadow(radius: 10)
//                    .padding()
//
//            }
//            }
//        }
//    }

