//
//  CaseRepositoryTwo.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 6/11/21.
//

import Foundation

import Firebase

class CaseRepository: ObservableObject {
    let db = Firestore.firestore()
    
    @Published var cases = [Case]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        var _ = Auth.auth().currentUser?.uid
        
        db.collection("cases")
            .order(by: "year")
            .addSnapshotListener { (querySnapshot, error) in
                if let querySnapshot = querySnapshot {
                    self.cases = querySnapshot.documents.compactMap {
                        document in
                        do {
                            let x = try document.data(as: Case.self)
                            return x
                        }  catch {
                            print(error)
                        }
                        return nil
                    }
                }
            }
    }
    
    func addCase(_ ejCase: Case) {
        do {
            var addedCase = ejCase
            
            addedCase.userId = Auth.auth().currentUser?.uid
            
            let _ = try db.collection("cases").addDocument(from: addedCase)
        }
        catch {
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }
    }
    func updateCase(_ ejCase: Case) {
        if let caseID = ejCase.id {
            do {
                try db.collection("cases").document(caseID).setData(from: ejCase)
            }
            catch {
                fatalError("Unable to encode task: \(error.localizedDescription)")
            }
        }
    }
}


