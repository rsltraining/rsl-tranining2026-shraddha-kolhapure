package com.example.kotlin_assignment_2

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class SummaryActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_summary)

        val tvSummary = findViewById<TextView>(R.id.tvSummary)
        val btnComplete = findViewById<Button>(R.id.btnComplete)
        val btnCancel = findViewById<Button>(R.id.btnCancel)

        val paymentInfo = intent.getSerializableExtra("PAYMENT_DATA") as? PaymentInfo

        paymentInfo?.let { info ->
            val taxCalc = { amt: Double -> amt * 0.18 }
            val totalAmount = calculateTotal(info.amount, taxCalc)

            tvSummary.apply {
                text = "Name: ${info.userName}\nAmount: ${info.amount}\nType: ${info.type}\nDetails: ${info.details}\nTotal with Tax: $totalAmount"
            }
        }

        val completeClick by btnComplete.onDelegateClick()
        completeClick {
            navigateToStatus(TransactionStatus.Completed)
        }

        val cancelClick by btnCancel.onDelegateClick()
        cancelClick {
            navigateToStatus(TransactionStatus.Cancelled)
        }
    }

    private fun calculateTotal(amount: Double, taxCalculation: (Double) -> Double): Double {
        return amount + taxCalculation(amount)
    }

    private fun navigateToStatus(status: TransactionStatus) {
        val statusString = when (status) {
            is TransactionStatus.Completed -> "Transaction Completed Successfully"
            is TransactionStatus.Cancelled -> "Transaction Cancelled"
        }
        val intent = Intent(this, StatusActivity::class.java).apply {
            putExtra("STATUS", statusString)
        }
        startActivity(intent)
    }
}