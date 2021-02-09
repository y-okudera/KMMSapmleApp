//
//  GitHubListView.swift
//  iosApp
//
//  Created by okudera on 2021/01/24.
//  Copyright © 2021 orgName. All rights reserved.
//

import SwiftUI

struct GitHubListView: View {

    @ObservedObject var viewModel: GitHubListViewModel

    var body: some View {
        NavigationView {
            VStack {
                self.searchView
                self.repositoriesList
            }
            .navigationBarTitle(Text("GitHub リポジトリ検索"))
            .resignKeyboardOnDragGesture()
        }
    }
}

// MARK: - Components
extension GitHubListView {

    private var searchView: some View {
        SearchView(placeholder: "ユーザー名で検索", searchAction: { searchWords in
            self.viewModel.input.searchButtonTapped.send(searchWords)
        }, cancelAction: {
            self.viewModel.input.cancelButtonTapped.send(())
        })
    }

    private var repositoriesList: some View {
        List {
            ForEach(self.viewModel.output.repositories, id: \.self) {
                Text($0.name)
            }
        }
    }
}

struct GitHubListView_Previews: PreviewProvider {
    static var previews: some View {
        GitHubListBuilder.build()
    }
}
