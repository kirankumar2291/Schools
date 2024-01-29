//
//  SchoolDetailsView.swift
//  Schools
//
//  Created by Kiran Kumar on 29/01/24.
//

import SwiftUI

struct SchoolDetailsView: View {
    let school: Schools
    var body: some View {
        VStack {
            Text(school.school_name)
                .font(.title)
                .fontWeight(.heavy)
            Text(school.overview_paragraph)
                .font(.body)
            Spacer()
        }
        .padding(20)
    }
}

