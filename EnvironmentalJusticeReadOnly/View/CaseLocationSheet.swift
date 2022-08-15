//
//  CaseLocationSheet.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha Walkowski on 6/27/22.
//

import SwiftUI

struct CaseLocationSheet: View {
    var location: Location

    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text(location.name)
                        .kerning(2.0)
                        .fontWeight(.light)
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .opacity(0.7)

                    Spacer()
                        Text(location.year)
                            .kerning(2.0)
                            .fontWeight(.light)
                            .font(.system(.callout))
                            .foregroundColor(.white)
                            .cornerRadius(2)
                            .background(RoundedRectangle(cornerRadius: 3)
                                .foregroundColor(Color.black)
                                .opacity(0.8)
                                .frame(width: 60, height: 30))
                }
                .padding(.horizontal, 15)
                .padding(.bottom, 40)

                Text("What came next")
                    .kerning(2.0)
                    .font(.title3)
                    .padding()
                Text(location.whatCameNext)
                    .kerning(0.5)
                    .fontWeight(.light)
                    .padding()
                    .font(.system(.callout))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 5)
                    .overlay(Color.gray.opacity(0.1))
                    .cornerRadius(5)
                    .padding(.horizontal, 15)
            }
        }
    }
}
