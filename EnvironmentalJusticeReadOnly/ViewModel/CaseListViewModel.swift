//
//  CaseListViewModel.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 6/11/21.
//

import Foundation
import Combine
import SwiftUI

class CaseListViewModel: ObservableObject {
    @Published var caseRepository = CaseRepository()
    @Published var caseCellViewModels = [CaseCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        caseRepository.$cases
            .map { ejCase in
                ejCase.map { ejCase in
                    CaseCellViewModel(ejCase: ejCase)
                }
            }
            .assign(to: \.caseCellViewModels, on: self)
            .store(in: &cancellables)
    }
    func addCase(ejCase: Case) {
        caseRepository.addCase(ejCase)
    }
}

