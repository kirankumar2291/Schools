//
//  ContentView.swift
//  Schools
//
//  Created by Kiran Kumar on 29/01/24.
//

import SwiftUI

struct SchoolsList: View {
    
    @ObservedObject var viewModel = SchoolsListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.schools) { school in
                NavigationLink(destination: SchoolDetailsView(school: school)) {
                    Text(school.school_name)
                }
            }
            .navigationTitle("NYC Schools")
        }
        .onAppear {
            Task {
                await viewModel.fetchData()
            }
        }
        .alert(viewModel.errorMessage, isPresented: $viewModel.showError) {
            Button("Retry", role: .cancel) {
                Task {
                    await viewModel.fetchData()
                }
            }
        }
    }
}

struct SchoolsList_Previews: PreviewProvider {
    static var previews: some View {
        SchoolsList()
    }
}
