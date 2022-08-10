//
//  USCases.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 6/11/21.
//
import SwiftUI
import Firebase

struct USCases: View {
    
    @ObservedObject var caseListVM = CaseListViewModel()
    @State var presentAddNewItem = false
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            List {
                ForEach(caseListVM.caseCellViewModels) { caseCellVM in
                    HStack {
                        Image(caseCellVM.ejCase.photo)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 70)
                            .cornerRadius(4)
                        CaseCell(caseCellVM: caseCellVM)
                    }
                }
            }
            .padding(.horizontal, -20)
        }
    }
}

struct USCases_Previews: PreviewProvider {
    static var previews: some View {
        USCases()
    }
}

struct CaseCell: View {
    @ObservedObject var caseCellVM: CaseCellViewModel
    @State var ejCase: String = ""
    
    var body: some View {
        HStack {
            Text(caseCellVM.ejCase.name)
                .kerning(1.0)
                .font(.caption)

            NavigationLink(destination: DetailView(caseCellVM: caseCellVM)) {
                Text("")
            }
        }
    }
}

struct DetailView: View {
    
    @ObservedObject var caseCellVM = CaseCellViewModel(ejCase: Case(name: "", year: 0, info: "", photo: "", location: ""))
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
                    .kerning(2.0)
                    .fontWeight(.semibold)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Image(caseCellVM.ejCase.photo)
                    .resizable()
                    .frame(width: 450, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(6)
                    .shadow(radius: 10)
                    .scaleEffect(self.zoomed ? 0.9 : 0.8)
                    .onTapGesture {
                        self.zoomed.toggle()
                    }
                    .animation(.spring())

                HStack(alignment: .center) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 3)
                            .foregroundColor(Color.black)
                            .opacity(0.6)
                            .frame(width: 55, height: 25)

                        let value = String(caseCellVM.ejCase.year)
                        Text(value)
                            .kerning(1.0)
                            .foregroundColor(.white)
                            .font(.body)
                            .fontWeight(.semibold)
                    }

                    Text(caseCellVM.ejCase.location)
                            .kerning(1.0)
                            .font(.body)
                            .fontWeight(.light)
                            .italic()
                            .padding(.horizontal, 10)
                }

                HStack {
                    Text(caseCellVM.ejCase.info)
                        .kerning(1.0)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .padding(30)
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
    }
}

