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
  let caseRepository = CaseRepository()
  @State var presentAddNewItem = false
    
   @State private var showingSheet = false
   
    
    var body: some View {
        
        

            VStack(alignment: .leading) {
                
            
            List {
                
                ForEach(caseListVM.caseCellViewModels) { caseCellVM in
                    HStack {
                    
                        Image(caseCellVM.ejCase.photo)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 85)
                            .cornerRadius(20)
                    CaseCell(caseCellVM: caseCellVM)
                }
                    
              
                }
                
               
                    
                }

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
    var onCommit: (Case) -> (Void) = { _ in }
    @State var ejCase: String = ""
    
    var body: some View {

        HStack {
        
        
        HStack {
           Spacer()
            Text(caseCellVM.ejCase.name)
                .lineLimit(3)
                .minimumScaleFactor(0.7)
                .multilineTextAlignment(.center)
                
               
        Spacer()
            
                NavigationLink(destination: DetailView(caseCellVM: caseCellVM)) {
                    Text("")
                        
    }
        }
}
        }
}
                
                    
   




struct DetailView: View {
   
    @ObservedObject var caseCellVM = CaseCellViewModel(ejCase: Case(name: "", year: 0, info: "", photo: "", location: ""))
    var onCommit: (Case) -> (Void) = { _ in }
    @State var ejCase: String = ""
    @State var presentActionSheet = false
    @ObservedObject var caseListVM = CaseListViewModel()
    let caseRepository = CaseRepository()
    @Environment(\.presentationMode) var presentationMode
    @State private var selection = Date()
    let years = [1920...2021]
    
    
    
    var body: some View {
    
        ScrollView {
            VStack {
                Text(caseCellVM.ejCase.name)
                    .fontWeight(.semibold)
                    .padding()
                    .font(.title2)
                    .multilineTextAlignment(.center)
                
                Image(caseCellVM.ejCase.photo)
                    .resizable()
                    .frame(width: 450, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                VStack {
                HStack {
            
                    let value = String(caseCellVM.ejCase.year)
            Text(value)
                .font(.body)
                .fontWeight(.semibold)
                    
            
                    
                    
                }
            
            HStack {
           
            Text(caseCellVM.ejCase.location)
                .font(.body)
                .fontWeight(.light)
                .italic()
                
            }
                }
            HStack {
           
                
            Text(caseCellVM.ejCase.info)
                .multilineTextAlignment(.center)

            }
            .padding()
            .font(.callout)
            }
         
}
}
}
        
