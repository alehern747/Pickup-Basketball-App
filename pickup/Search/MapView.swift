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
    @State private var showSearch = true
    @State private var searchText = ""
    @State private var searchResults: [MKMapItem] = []
    
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

            .sheet(isPresented: $showSearch) {
                CourtSearchView()
                    .presentationDetents([.fraction(0.33), .large])
                    .presentationDragIndicator(.visible)
                    .interactiveDismissDisabled()
                    .presentationBackgroundInteraction(.enabled)
            }

    }
    
    func searchCourts(in region: MKCoordinateRegion) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = "basketball courts"
        searchRequest.region = region
        
        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, error) in
            guard let response = response else {
                print("Search failed")
                return
            }
            
            // either append or assign, but each has problems
            // append: layered pins
            // assign: disappearing pins, due to constant replacement
            for item in response.mapItems {
                markers.append(item)
            }
        }
    }
    
    func searchCourtByName() {
        guard !searchText.isEmpty else { return }
        
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchText
        let includedTypes: [MKPointOfInterestCategory] = [.basketball, .park]
        searchRequest.pointOfInterestFilter = MKPointOfInterestFilter(including: includedTypes)
        let search = MKLocalSearch(request: searchRequest)
        
        
        search.start { response, error in
            guard let response else { return }
            searchResults = Array(response.mapItems.prefix(10))
        }
    }
    
    @ViewBuilder
    func CourtSearchView() -> some View {
        NavigationStack {
            VStack {
                TextField("Find courts...", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        searchCourtByName()
                    }.padding()
                
                // LATER: Improve design, add Recents / Last Played court list that gets replaced
                ForEach(searchResults, id: \.self) { item in
                    // better tabs, not just buttons
                    Button(item.name ?? "NULL") {
                        
                        position = .region(
                            MKCoordinateRegion(
                                center: item.location.coordinate,
                                latitudinalMeters: 1000,
                                longitudinalMeters: 1000
                            )
                        )
                        selectedCourt = item
                    }
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}



#Preview {
    MapView()
}
