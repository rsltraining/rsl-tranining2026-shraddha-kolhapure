package com.example.kotlin_assignment_2

import java.io.Serializable

enum class TransactionType {
    CASH, CARD, NETBANKING, UPI
}

sealed class TransactionStatus {
    object Completed : TransactionStatus()
    object Cancelled : TransactionStatus()
}

data class PaymentInfo(
    val userName: String,
    val amount: Double,
    val type: TransactionType,
    val details: String
) : Serializable