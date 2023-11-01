//
//  LocationCheck.swift
//  skipTracker
//
//  Created by Anson Goo on 10/15/23.
//

import Foundation
import SwiftUI
import MapKit

struct LocationCheck: View{
    
    @StateObject private var viewModel = ContentViewModel()
    
    var locations = [
        "Allen Sustainable": [33.77669597732302, -84.39888917830665],
        "Boggs Building": [33.7765097826111, -84.39995712433213],
        "Bunger Henry Building": [33.7761624804365, -84.39844490899044],
        "Cherry Emerson Building": [33.77853778003763, -84.39691190159705],
        "Clough Commons": [33.77534794029859, -84.39658650899086],
        "College of Computing": [33.77798426970779, -84.39741127830611],
        "College of Design East": [33.77660157787395, -84.39553897830673],
        "College of Design West": [33.776490062636576, -84.39547194762328],
        "Engineering Science & Mechanics Building": [33.772071449846926, -84.39583405582282],
        "Ford Environmental Science & Technology Building": [33.778865364662046, -84.39649373967241],
        "Guggenheim Aerospace Building": [33.77224319844033, -84.39591429365097],
        "Howey Physics": [33.77764057641632, -84.3986032030626],
        "Instructional Center": [33.77605379763765, -84.40146442433232],
        "Kendeda Building for Innovative Sustainable Design": [33.78036773604583, -84.39957833501694],
        "Klaus Advanced Computing Building": [33.777234311180244, -84.39585801534173],
        "Love Manufacturing Building": [33.77727324562031, -84.40192469364817],
        "Manufacturing Related Disciplines Complex": [33.777723957327154, -84.40073267830618],
        "Mason Building": [33.77731803207942, -84.39926058569858],
        "Molecular Sciences Engineering Building": [33.78033375609184, -84.39659953227948],
        "Paper Tricentennial Building Renewable Bioproducts Institute": [33.78136864025833, -84.40455386296229],
        "Scheller College of Business": [33.77688430441054, -84.38786949364831],
        "Skiles Classroom Building": [34.01002792968827, -84.46639536948686],
        "Smith Building": [33.77384410986821, -84.39512394232914],
        "Swann Building": [33.772219798615865, -84.39520581694234],
        "Van Leer Building": [33.77660569372734, -84.39743355501545],
        "Weber Space Science & Technology Building III": [33.773328750400346, -84.39651131694157],
        "Whitaker Building": [33.77863150139569, -84.39662361349369]
    ]
    
    var body: some View{
        
        Text("")
        
    }
}


final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{

var locationManager: CLLocationManager?

func checkIfLocationServiceIsEnabled(){
    if CLLocationManager.locationServicesEnabled(){
        locationManager = CLLocationManager()
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager!.delegate = self
    }
}

private func checkLocationAuthorization(){
    guard let locationManager = locationManager else {return}
    
    switch locationManager.authorizationStatus{
        
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
        case .restricted:
            print("Your location is restricted likely due to parental controls")
        case .denied:
            print("You have denied location access. Go to settings to change this.")
        case .authorizedAlways, .authorizedWhenInUse:
            break
        @unknown default:
            break
        }
}

func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    checkLocationAuthorization()
}

//    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
//        //incomplete for now
//        //was thinking to return the user location information
//    }
}
