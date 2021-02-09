package jp.yuoku.kmmsapmleapp.androidApp

import android.content.Context
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.view.inputmethod.InputMethodManager
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import jp.yuoku.kmmsapmleapp.shared.GithubAPI
import jp.yuoku.kmmsapmleapp.shared.Repository

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        var data: List<Repository> = listOf<Repository>()
        val recyclerView: RecyclerView = findViewById(R.id.recycler_view)
        recyclerView.layoutManager = LinearLayoutManager(this)
        recyclerView.adapter = RecyclerAdapter(this, data)

        val searchText: EditText = findViewById(R.id.search_text)
        val searchButton: Button = findViewById(R.id.search_button)
        searchButton.setOnClickListener {

            val inputManager = getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager
            inputManager.hideSoftInputFromWindow(it.windowToken, InputMethodManager.HIDE_NOT_ALWAYS)

            GithubAPI().fetchRepos(searchText.text.toString()) {
                runOnUiThread {
                    recyclerView.adapter = RecyclerAdapter(this, it)
                }
            }
        }
    }
}