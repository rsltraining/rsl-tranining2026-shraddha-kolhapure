package com.example.views_part1_assignmnt;

import android.content.Intent;
import android.os.Bundle;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class MainActivity extends AppCompatActivity {

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

        findViewById(R.id.btnTextView).setOnClickListener(v -> startActivity(new Intent(this, TextViewActivity.class)));

        findViewById(R.id.btnEditView).setOnClickListener(v -> startActivity(new Intent(this, EditTextActivity.class)));

        findViewById(R.id.btnButtonView).setOnClickListener(v -> startActivity(new Intent(this, ButtonActivity.class)));

        findViewById(R.id.btnImgView).setOnClickListener(v -> startActivity(new Intent(this, ImageViewActivity.class)));
        
    }
}
