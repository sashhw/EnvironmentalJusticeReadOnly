//
//  CaseDetailView.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 7/9/24.
//

import SwiftUI

struct CaseDetailView: View {
    
    @ObservedObject var caseCellVM: CaseCellViewModel
    @State var ejCase: String = ""
    @State var presentActionSheet = false
    @ObservedObject var caseListVM = CaseListViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State private var selection = Date()
    @State var zoomed = false
    
    var body: some View {
        
        ScrollView {
            VStack {
                Text(caseCellVM.ejCase.name)
                    .kerning(1.0)
                    .fontWeight(.semibold)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                
                Image(caseCellVM.ejCase.photo)
                    .resizable()
                    .frame(width: 450, height: 300, alignment: .center)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(6)
                    .shadow(radius: 10)
                    .scaleEffect(self.zoomed ? 0.9 : 0.8)
                    .onTapGesture {
                        self.zoomed.toggle()
                    }
                    .animation(.spring())

                HStack(spacing: 30) {
                    let value = String(caseCellVM.ejCase.year)
                    Text(value)
                        .kerning(0.5)
                        .foregroundColor(.white)
                        .font(.body)
                        .fontWeight(.semibold)
                        .background(
                            RoundedRectangle(cornerRadius: 3)
                                .foregroundColor(Color.black)
                                .opacity(0.6)
                                .frame(width: 55, height: 25))

                    Text(caseCellVM.ejCase.location)
                        .kerning(0.5)
                        .font(.body)
                        .fontWeight(.light)
                        .italic()
                }
                .padding(.horizontal, 30)

                    Text(caseCellVM.ejCase.info)
                        .kerning(0.2)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(30)
            }
            .frame(width: UIScreen.main.bounds.width)
            .navigationBarBackButtonHidden(true)
        }
    }
}
