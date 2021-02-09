package jp.yuoku.kmmsapmleapp.androidApp

import android.content.Context
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import jp.yuoku.kmmsapmleapp.shared.Repository

class RecyclerAdapter(context: Context, val data: List<Repository>) : RecyclerView.Adapter<ViewHolder>() {
    val inflater = LayoutInflater.from(context)

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        return ViewHolder(inflater.inflate(R.layout.github_repository_list_item, parent, false))
    }

    override fun getItemCount(): Int {
        return data.size
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        // ViewHolderを通してデータをViewに設定する
        holder.textView.text = data[position].name
    }
}