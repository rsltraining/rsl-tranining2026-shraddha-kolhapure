package com.example.kotlin_assignment_2

import android.view.View
import kotlin.properties.ReadOnlyProperty
import kotlin.reflect.KProperty

class ClickListenerDelegate(private val view: View) : ReadOnlyProperty<Any?, (View.OnClickListener) -> Unit> {
    override fun getValue(thisRef: Any?, property: KProperty<*>): (View.OnClickListener) -> Unit {
        return { listener -> view.setOnClickListener(listener) }
    }
}

fun View.onDelegateClick() = ClickListenerDelegate(this)