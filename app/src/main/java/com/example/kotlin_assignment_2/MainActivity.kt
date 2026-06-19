package com.example.kotlin_assignment_2

import android.content.Intent
import android.os.Bundle
import android.widget.ArrayAdapter
import android.widget.Button
import android.widget.EditText
import android.widget.Spinner
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val etName = findViewById<EditText>(R.id.etName)
        val etAmount = findViewById<EditText>(R.id.etAmount)
        val spType = findViewById<Spinner>(R.id.spType)
        val etDetails = findViewById<EditText>(R.id.etDetails)
        val btnSubmit = findViewById<Button>(R.id.btnSubmit)

        spType.adapter = ArrayAdapter(
            this,
            android.R.layout.simple_spinner_dropdown_item,
            TransactionType.entries.map { it.name }
        )

        btnSubmit.run {
            text = "Submit Payment"
        }

        val clickHandler by btnSubmit.onDelegateClick()
        clickHandler {
            val name = etName.text.toString()
            val amount = etAmount.text.toString().toDoubleOrNull() ?: 0.0
            val type = TransactionType.valueOf(spType.selectedItem.toString())
            val details = etDetails.text.toString()

            val paymentInfo = PaymentInfo(name, amount, type, details)

            val intent = Intent(this, SummaryActivity::class.java).apply {
                putExtra("PAYMENT_DATA", paymentInfo)
            }
            startActivity(intent)
        }
    }
}