package jp.yuoku.kmmsapmleapp.shared

import io.ktor.client.*
import kotlinx.coroutines.CoroutineDispatcher

expect class GithubAPIClient() {
    val client: HttpClient
    val dispatcher: CoroutineDispatcher
}