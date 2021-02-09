//
//  GitHubListViewModel.swift
//  iosApp
//
//  Created by okudera on 2021/01/24.
//  Copyright © 2021 orgName. All rights reserved.
//

import Foundation
import shared
import Combine
import Ricemill

enum GitHubListViewModelProvider {

    static func provide() -> GitHubListViewModel {
        GitHubListViewModel(
            input: GitHubListViewModel.Resolver.Input(),
            store: GitHubListViewModel.Resolver.Store(),
            extra: GitHubListViewModel.Resolver.Extra(githubAPI: GithubAPI())
        )
    }
}

final class GitHubListViewModel: Machine<GitHubListViewModel.Resolver> {

    typealias Output = Store

    final class Input: BindableInputType {
        /// 検索ボタンのタップイベント
        let searchButtonTapped = PassthroughSubject<String, Never>()
        /// キャンセルボタンのタップイベント
        let cancelButtonTapped = PassthroughSubject<Void, Never>()
    }

    final class Store: StoredOutputType {
        /// GitHubのリポジトリのリスト
        @Published var repositories = [Repository]()
    }

    struct Extra: ExtraType {
        var githubAPI: GithubAPI
    }

    enum Resolver: ResolverType {

        static func polish(input: Publishing<Input>, store: Store, extra: Extra) -> Polished<Output> {

            var cancellables: [AnyCancellable] = []

            // 検索ボタンタップをトリガーにAPIリクエストをする
            input.searchButtonTapped
                .sink { [weak store] searchWords in
                    if searchWords.isEmpty {
                        return
                    }
                    extra.githubAPI.fetchRepos(userName: searchWords) { repositories in
                        store?.repositories = repositories
                    }
                }
                .store(in: &cancellables)

            // キャンセルボタンタップをトリガーにリポジトリのリストを空にする
            input.cancelButtonTapped
                .sink { [weak store] in
                    store?.repositories = []
                }
                .store(in: &cancellables)

            return Polished(cancellables: cancellables)
        }
    }
}
