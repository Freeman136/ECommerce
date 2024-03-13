import Foundation

struct RocketDTO: Decodable {

    let name: String
    let country: String
    let firstFlight: String
    let firstStage: FirstStage
    let cost: Double //
    let flickrImages: [String]
    let stages: Int
    let company: String
    let height: Height
    let diameter: Height
    let mass: Mass

    enum CodingKeys: String, CodingKey {
        case name
        case stages
        case country
        case company
        case firstFlight = "first_flight"
        case firstStage = "first_stage"
        case cost = "cost_per_launch"
        case flickrImages = "flickr_images"
        case height
        case diameter
        case mass
    }
}

struct FirstStage: Decodable {

    let engines: Int
    let fuelAmountTons: Double

    enum CodingKeys: String, CodingKey {
        case engines
        case fuelAmountTons = "fuel_amount_tons"
    }
}

struct Height: Decodable {
    let meters: Int
    let feet: Int
}

struct Mass: Decodable {
    let kg: Int
    let lb: Int
}
