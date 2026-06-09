package com.example.views_part1_assignmnt;

import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;

public class ImageViewActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_imgview);
        findViewById(R.id.btnBack).setOnClickListener(v -> {
            finish();
        });
    }
}