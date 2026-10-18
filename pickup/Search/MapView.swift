import SwiftUI
import MapKit

struct MapView: View {
    @State private var position = MapCameraPosition.userLocation(
        followsHeading: false,
        fallback: .region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: 34.0522,
                    longitude: -118.2437
                ),
                span: MKCoordinateSpan(
                    latitudeDelta: 0.1,
                    longitudeDelta: 0.1
                )
            )
        )
    )
    @State private var locationManager = CLLocationManager()
    @State private var markers: [MKMapItem] = []
    @State private var selectedCourt: MKMapItem?
    
    var body: some View {
        Map(position: $position, selection: $selectedCourt) {
            UserAnnotation()
            ForEach(markers, id: \.self) { court in
                Marker(item: court)
            }
        }
            .mapControls {
                MapCompass()
                MapUserLocationButton()
                MapScaleView()
            }
            .onMapCameraChange(frequency: .onEnd) { context in
                searchCourts(in: context.region) // multiple search problem?
            }
            .onAppear {
                if locationManager.authorizationStatus == .notDetermined {
                    locationManager.requestWhenInUseAuthorization()
                }
                // add more status checks
            }
            .mapItemDetailSheet(item: $selectedCourt)
            // buttons in map item sheet dont work

    }
    
    func searchCourts(in region: MKCoordinateRegion) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = "basketball courts"
        searchRequest.region = region
        // searchRequest.regionPriority = .required
        
        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, error) in
            guard let response = response else {
                print("Search failed")
                return
            }
            
            markers = response.mapItems // append instead?
            
        }
    }
}



#Preview {
    MapView()
}
