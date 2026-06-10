package com.example.views_part1_assignmnt;
import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;

public class TextViewActivity extends AppCompatActivity{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_textview);
        findViewById(R.id.btnBack).setOnClickListener(v -> {
            finish();
        });
    }
}
