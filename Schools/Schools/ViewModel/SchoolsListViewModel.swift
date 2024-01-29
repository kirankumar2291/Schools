//
//  SchoolsListViewModel.swift
//  Schools
//
//  Created by Kiran Kumar on 29/01/24.
//

import Foundation

let schoolsList = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
@MainActor class SchoolsListViewModel: ObservableObject {
    
    @Published var schools = [Schools]()
    @Published var errorMessage = ""
    @Published var showError = false
    
    func fetchData() async {
        guard let schoolsList: [Schools] = await APIHelper.sharedInstance.donwloadData(from: schoolsList) else {
            errorMessage = String(describing: APIHelper.sharedInstance.apiError)
            showError = true
            return
        }
        schools = schoolsList
    }
}
