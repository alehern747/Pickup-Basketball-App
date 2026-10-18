import Foundation
import MapKit

// add court at a later date? for user submitted courts?
struct Court: Identifiable, Hashable {
    let id: MKMapItem.Identifier?
    let name: String
    let coordinate: CLLocationCoordinate2D
    
    static func == (lhs: Court, rhs: Court) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
