package com.rajasoftwarelabs.intentsassignment;

import android.os.Bundle;
import android.view.MenuItem;
import android.widget.TextView;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

public class NameActivity extends AppCompatActivity {

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_name);

        // TODO (3): Add back navigation to the Toolbar.
        if (getSupportActionBar() != null) {
            getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        }
    }

    @Override
    protected void onStart() {
        super.onStart();

        // TODO (2): Get the name in the intent sent from MainActivity
        String name = "";
        if (getIntent() != null && getIntent().hasExtra(MainActivity.EXTRA_NAME)) {
            name = getIntent().getStringExtra(MainActivity.EXTRA_NAME);
        }

        TextView nameTextView = findViewById(R.id.name_text_view);
        nameTextView.setText(getString(R.string.name_activity_text, name));
    }

    // Tells the toolbar back arrow button to close this activity and go back
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == android.R.id.home) {
            finish();
            return true;
        }
        return super.onOptionsItemSelected(item);
    }
}