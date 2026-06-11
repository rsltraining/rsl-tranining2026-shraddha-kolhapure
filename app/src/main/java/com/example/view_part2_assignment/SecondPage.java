package com.example.view_part2_assignment;

import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

public class SecondPage extends AppCompatActivity {
    private boolean isHidden = false;
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.secondpage);
        ImageView imgInstitute = findViewById(R.id.imgInstitute);
        ImageView img2 = findViewById(R.id.img2);
        TextView name2 = findViewById(R.id.name2);
        imgInstitute.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (!isHidden) {
                    img2.setVisibility(View.GONE);
                    name2.setVisibility(View.GONE);
                    isHidden = true;
                } else {
                    img2.setVisibility(View.VISIBLE);
                    name2.setVisibility(View.VISIBLE);
                    isHidden = false;
                }
            }
        });
    }
}
