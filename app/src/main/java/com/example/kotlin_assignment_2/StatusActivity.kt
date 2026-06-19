package com.example.kotlin_assignment_2

import android.os.Bundle
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class StatusActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_status)

        val tvStatus = findViewById<TextView>(R.id.tvStatus)
        val status = intent.getStringExtra("STATUS")

        tvStatus.apply {
            text = status ?: "No Status Found"
        }
    }
}