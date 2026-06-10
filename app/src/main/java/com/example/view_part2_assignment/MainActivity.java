package com.example.view_part2_assignment;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast; // Imported to show a message on click

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class MainActivity extends AppCompatActivity {

    Button buttonLayout1, buttonLayout2;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_main);

        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });

        buttonLayout1 = findViewById(R.id.Layout1);
        buttonLayout2 = findViewById(R.id.Layout2);
        buttonLayout1.setOnClickListener(v -> {
            Intent i = new Intent(MainActivity.this, FirstPage.class);
            startActivity(i);
        });

        buttonLayout2.setOnClickListener(v -> {
            Intent i = new Intent(MainActivity.this, SecondPage.class);
            startActivity(i);
        });
    }
}