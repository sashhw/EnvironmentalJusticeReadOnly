//
//  CaseCellViewModel.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 6/11/21.
//

import Foundation
import Combine
import SwiftUI

class CaseCellViewModel: ObservableObject, Identifiable {
    @Published var ejCase: Case
    @Published var caseRepository = CaseRepository()
    
    var id = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(ejCase: Case) {
        self.ejCase = ejCase
        $ejCase
            .compactMap { ejCase in
                ejCase.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
        
        $ejCase
            .dropFirst()
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .sink { ejCase in
                self.caseRepository.updateCase(ejCase)
            }
            .store(in: &cancellables)
}
}

