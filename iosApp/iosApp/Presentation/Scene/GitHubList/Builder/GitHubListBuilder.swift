//
//  GitHubListBuilder.swift
//  iosApp
//
//  Created by okudera on 2021/01/24.
//  Copyright © 2021 orgName. All rights reserved.
//

enum GitHubListBuilder {

    static func build() -> GitHubListView {
        let viewModel = GitHubListViewModelProvider.provide()
        let view = GitHubListView(viewModel: viewModel)
        return view
    }
}
