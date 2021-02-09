//
//  SearchView.swift
//  iosApp
//
//  Created by okudera on 2021/01/24.
//  Copyright © 2021 orgName. All rights reserved.
//

import SwiftUI

struct SearchView: View {

    @State private(set) var searchText = ""
    @State private var showCancelButton: Bool = false

    private let placeholder: String
    private let searchAction: (String) -> Void
    private let cancelAction: () -> Void

    init(placeholder: String, searchAction: @escaping (String) -> Void, cancelAction: @escaping () -> Void) {
        self.placeholder = placeholder
        self.searchAction = searchAction
        self.cancelAction = cancelAction
    }

    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")

                TextField(self.placeholder, text: $searchText, onEditingChanged: { isEditing in
                    self.showCancelButton = true
                }, onCommit: {
                    self.searchAction(self.searchText)
                })
                .foregroundColor(.primary)

                Button(action: {
                    self.searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .opacity(self.searchText == "" ? 0 : 1)
                }
            }
            .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)

            if self.showCancelButton  {
                Button("キャンセル") {
                    UIApplication.shared.endEditing(true)
                    self.searchText = ""
                    self.showCancelButton = false
                }
                .foregroundColor(Color(.systemBlue))
            }
        }
        .padding(.horizontal)
        .navigationBarHidden(self.showCancelButton)
        .animation(.easeInOut)
    }
}
