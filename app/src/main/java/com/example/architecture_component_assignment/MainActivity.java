package com.example.architecture_component_assignment;

import android.app.ProgressDialog;
import android.os.Bundle;
import android.os.Handler;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.lifecycle.Observer;
import androidx.lifecycle.ViewModelProvider;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

public class MainActivity extends AppCompatActivity {

    private MainViewModel viewModel;
    private LinearLayout mainLayout;
    private TextView tvTimer;
    private ProgressDialog progressDialog;
    private Handler networkHandler = new Handler();
    private Runnable networkCheckRunnable;
    private boolean wasNetworkAvailable = true;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_main);

        mainLayout = findViewById(R.id.mainLayout);
        tvTimer = findViewById(R.id.tvTimer);

        if (mainLayout != null) {
            ViewCompat.setOnApplyWindowInsetsListener(mainLayout, (v, insets) -> {
                Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
                v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
                return insets;
            });
        }

        progressDialog = new ProgressDialog(this);
        progressDialog.setMessage("Fetching Countries...");
        progressDialog.setCancelable(false);

        viewModel = new ViewModelProvider(this).get(MainViewModel.class);

        if (savedInstanceState == null) {
            getSupportFragmentManager().beginTransaction()
                    .replace(R.id.fragmentContainer, new CountryListFragment())
                    .commit();
        }

        startObservers();
        setupRealTimeNetworkCheck();

        viewModel.fetchCountriesFromNetwork();
    }

    private void startObservers() {
        viewModel.getTimerText().observe(this, new Observer<String>() {
            @Override
            public void onChanged(String text) {
                if (tvTimer != null) {
                    tvTimer.setText(text);
                }
            }
        });

        viewModel.getIsLoading().observe(this, new Observer<Boolean>() {
            @Override
            public void onChanged(Boolean loading) {
                if (progressDialog != null) {
                    if (loading) {
                        if (!progressDialog.isShowing()) progressDialog.show();
                    } else {
                        if (progressDialog.isShowing()) progressDialog.dismiss();
                    }
                }
            }
        });

        viewModel.getBackgroundColor().observe(this, new Observer<Integer>() {
            @Override
            public void onChanged(Integer color) {
                if (mainLayout != null) {
                    mainLayout.setBackgroundColor(color);
                }
            }
        });

        viewModel.getErrorMessage().observe(this, new Observer<String>() {
            @Override
            public void onChanged(String errorMsg) {
                if (errorMsg != null) {
                    Toast.makeText(MainActivity.this, errorMsg, Toast.LENGTH_SHORT).show();
                    viewModel.clearError();
                }
            }
        });
    }

    private void setupRealTimeNetworkCheck() {
        networkCheckRunnable = new Runnable() {
            @Override
            public void run() {
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        boolean isConnected = checkActualInternet();
                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                if (wasNetworkAvailable && !isConnected) {
                                    Toast.makeText(MainActivity.this, "Counties list is unavailable", Toast.LENGTH_SHORT).show();
                                }
                                wasNetworkAvailable = isConnected;
                            }
                        });
                    }
                }).start();
                networkHandler.postDelayed(this, 3000);
            }
        };
        networkHandler.post(networkCheckRunnable);
    }

    private boolean checkActualInternet() {
        try {
            HttpURLConnection urlc = (HttpURLConnection) (new URL("https://www.google.com").openConnection());
            urlc.setRequestProperty("User-Agent", "Test");
            urlc.setConnectTimeout(1500);
            urlc.connect();
            return (urlc.getResponseCode() == 200);
        } catch (IOException e) {
            return false;
        }
    }

    @Override
    protected void onDestroy() {
        if (progressDialog != null && progressDialog.isShowing()) {
            progressDialog.dismiss();
        }
        if (networkHandler != null && networkCheckRunnable != null) {
            networkHandler.removeCallbacks(networkCheckRunnable);
        }
        super.onDestroy();
    }
}