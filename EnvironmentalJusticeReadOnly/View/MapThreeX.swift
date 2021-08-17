//
//  MapThreeX.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 8/3/21.
//


import SwiftUI
import MapKit

struct MapViewThree: UIViewRepresentable {
    @State private var annotation = MKPointAnnotation()
    func makeUIView(context: Context) -> MKMapView {
        let mapView = WrappedMap()
        mapView.delegate = context.coordinator
        mapView.onLongPress = addAnnotation(for:)
        return mapView
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotation(annotation)
    }
    func addAnnotation(for coordinate: CLLocationCoordinate2D) {
        let newAnnotation = MKPointAnnotation()
        newAnnotation.coordinate = coordinate
        annotation = newAnnotation
    }
}
extension MapViewThree {
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapViewThree
        init(_ parent: MapViewThree) {
            self.parent = parent
        }
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapViewThree()
        .edgesIgnoringSafeArea(.all)
    }
}
