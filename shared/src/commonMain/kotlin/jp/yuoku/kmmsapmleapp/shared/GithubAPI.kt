package jp.yuoku.kmmsapmleapp.shared

import io.ktor.client.request.*
import kotlinx.coroutines.*
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class Repository(
    val name: String,
    @SerialName("html_url") val url: String,
)

class GithubAPI {
    private val apiClient: GithubAPIClient = GithubAPIClient()
    fun fetchRepos(userName: String, callback: (List<Repository>) -> Unit) {
        GlobalScope.apply {
            launch(apiClient.dispatcher) {
                val result = apiClient.client.get<List<Repository>>("https://api.github.com/users/$userName/repos")
                callback(result)
            }
        }
    }
}