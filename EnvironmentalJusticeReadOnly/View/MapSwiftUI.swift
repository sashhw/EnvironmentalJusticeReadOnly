////
////  MapViewTwo.swift
////  EnvironmentalJusticeReadOnly
////
////  Created by Sasha on 6/11/21.
////
//
//import SwiftUI
//import MapKit
//
//struct MapViewTwo: View {
//    @State  var locations: [Location] = []
//    @State  var coordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.179473, longitude: -96.574201), span: MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 90))
//   @State var showingAlert = false
//    @State var presentingModal = false
//    let screenRect = UIScreen.main.bounds
//
//
//    // split screen
//    //    let windowRect = self.view.window?.frame
//    //    let windowWidth = windowRect?.size.width
//    //    let windowHeight = windowRect?.size.height
//
//    var body: some View {
//
//        ZStack {
//            
//        Image("nature")
//            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//            .frame(width: screenRect.width, height: 1500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//            .cornerRadius(5)
//            .shadow(color: .black, radius: 4)
//            .opacity(0.4)
//            }
//            .overlay(
//
//    VStack {
//
//                Text("Map of Cases")
//                        .fontWeight(.light)
//                        .padding()
//                        .font(.system(.title))
//                        .foregroundColor(.black)
//                        .multilineTextAlignment(.center)
//                        .scaleEffect(0.9)
//                        .background(Color.white)
//                        .cornerRadius(15)
//                        .opacity(0.7)
//                        .padding(.top, -140.0)
//                        .minimumScaleFactor(0.5)
//                        .frame(width: UIScreen.main.bounds.width-20, alignment: .center)
//
//        Map(coordinateRegion: $coordinateRegion, annotationItems: locations) {
//            location in
//            MapAnnotation(coordinate: location.coordinate) {
//                VStack {
////                    Button(action: { self.showingAlert = true }) {
//                        VStack {
//                            Image(location.image)
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 100, height: 30)
//                                .clipShape(Circle())
//                                .overlay(
//                                    Circle().stroke(Color.white, lineWidth: 25/10))
//                                .shadow(radius: 10)
//                                .padding()
//
//
//                        }
//                        .padding()
////                    .sheet(isPresented: $showingAlert) {
////                        SheetView(locations: location, presentedAsModal: $presentingModal )
////
////                    }
//
//                    }
//
//                    }
//                }
//        Button(action: {
//            withAnimation {
//                coordinateRegion.span = MKCoordinateSpan(latitudeDelta: 35, longitudeDelta: 60)
//            }
//        }, label: {
//            Text("Zoom In")
//                .frame(width: 200, height: 40, alignment: .center)
//                .background(Color.gray)
//                .cornerRadius(8)
//
//        }
//        )
////            }
//
//        .padding(.all, 30)
//        }
//        .onAppear(perform: readFile)
//        .statusBar(hidden: true)
//        .frame(width: 350, height: 400, alignment: .center)
//
//
// )
//
//    }
//
//   func readFile() {
//        if let url = Bundle.main.url(forResource: "locationsEJCase", withExtension: "json"),
//           let data = try? Data(contentsOf: url) {
//            let decoder = JSONDecoder()
//            if let jsonData = try? decoder.decode(JSONData.self, from: data) {
//                self.locations = jsonData.locations
//            }
//        }
//
//
//   }
////    func produceOverlay(mapView: MKMapView) {
////        var points = CLLocationCoordinate2D(latitude: 33.601685, longitude: -90.772131)
////        let circle = MKCircle(center: points, radius: 50)
////        mapView.addOverlay(circle)
////
////    }
//
//}
//
//
//
//struct MapViewTwo_Previews: PreviewProvider {
//    static var previews: some View {
//        MapViewTwo()
//    }
//}
//
//struct SheetView: View {
//
//    @State var locations: Location
//    @Binding var presentedAsModal: Bool
//    @Environment(\.presentationMode) var presentationMode
//
//    var body: some View {
//        VStack {
//      Spacer()
//
//            Text(locations.name)
//                .font(.title)
//                .fontWeight(.heavy)
//                .padding()
//                .foregroundColor(.primary)
//                .multilineTextAlignment(.center)
//
//            HStack {
//
//                Text(locations.year)
//                .font(.title3)
//                .fontWeight(.heavy)
//                .foregroundColor(.primary)
//                .multilineTextAlignment(.center)
//            }
//            .padding(.bottom)
//
//            Image(locations.image)
//                .resizable()
//                .scaledToFit()
//                .padding()
//                .frame(width: 300, height: 300, alignment: .center)
//
//                Spacer()
//
//                .overlay(
//                    HStack {
//                        Spacer()
//
//                    VStack {
//                        Button(action: {
//                            self.presentationMode.wrappedValue.dismiss()
//                        }, label: {
//                            Image(systemName: "chevron.down.circle.fill")
//                                .font(.largeTitle)
//                                .foregroundColor(.black)
//                        })
//                        .padding(.trailing, 20)
//                        .padding(.top, 40)
//                    Spacer() }
//            }
//
//) }
//    }
//}
//
//
//
//
