package com.example.fragmentassignment;

import android.os.Bundle;
import android.widget.Button;
import android.widget.Toast;

import androidx.activity.OnBackPressedCallback;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;

public class MainActivity extends AppCompatActivity {
    Button btnTime, btnDate, btnBattery;
    String currentTag = "HOME";
    long backPressedTime;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btnTime = findViewById(R.id.btnTime);
        btnDate = findViewById(R.id.btnDate);
        btnBattery = findViewById(R.id.btnBattery);

        if (savedInstanceState == null) {
            loadFragment(new HomeFragment(), "HOME", false);
        }

        btnTime.setOnClickListener(v -> {
            if (!currentTag.equals("TIME")) {
                loadFragment(new TimeFragment(), "TIME", true);
            }
        });

        btnDate.setOnClickListener(v -> {
            if (!currentTag.equals("DATE")) {
                loadFragment(new DateFragment(), "DATE", true);
            }
        });

        btnBattery.setOnClickListener(v -> {
            if (!currentTag.equals("BATTERY")) {
                loadFragment(new BatteryFragment(), "BATTERY", true);
            }
        });

        getOnBackPressedDispatcher().addCallback(this, new OnBackPressedCallback(true) {
            @Override
            public void handleOnBackPressed() {
                if (getSupportFragmentManager().getBackStackEntryCount() > 0) {
                    setEnabled(false);
                    getOnBackPressedDispatcher().onBackPressed();
                    setEnabled(true);
                    int index = getSupportFragmentManager().getBackStackEntryCount() - 1;
                    if (index >= 0) {
                        currentTag = getSupportFragmentManager().getBackStackEntryAt(index).getName();
                    } else {
                        currentTag = "HOME";
                    }

                } else {
                    if (backPressedTime + 2000 > System.currentTimeMillis()) {
                        finish();
                    } else {
                        Toast.makeText(MainActivity.this, "Press back again to exit", Toast.LENGTH_SHORT).show();
                        backPressedTime = System.currentTimeMillis();
                    }
                }
            }
        });
    }

    private void loadFragment(Fragment fragment, String tag, boolean addToBackStack) {
        Toast.makeText(this, "Hiding " + currentTag + " screen", Toast.LENGTH_SHORT).show();

        FragmentTransaction transaction = getSupportFragmentManager().beginTransaction();
        transaction.replace(R.id.fragmentContainer, fragment, tag);

        if (addToBackStack) {
            transaction.addToBackStack(tag);
        }
        transaction.commit();
        currentTag = tag;
    }
}