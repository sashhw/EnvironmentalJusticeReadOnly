//
//  USCases.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 6/11/21.
//
import SwiftUI
import SwiftData

@available(iOS 17, *)
struct CasesListView: View {
    @Query var event: [Event]
    @ObservedObject var caseListVM = CaseListViewModel()
    @Environment(\.modelContext) var modelContext 
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                List {
                    ForEach(event) { event in
                        HStack(alignment: .center) {
                            Image(event.photo)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .cornerRadius(8)
                                .padding(.trailing, 10)

                            CaseCellView(event: event, caseCellVM: CaseCellViewModel(ejCase: event))
                        }
                    }
                }
                .navigationTitle("U.S. Cases")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

@available(iOS 17, *)
struct USCases_Previews: PreviewProvider {
    static var previews: some View {
        CasesListView()
    }
}
