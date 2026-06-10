package com.rajasoftwarelabs.intentsassignment;

import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    @NonNull private static final String[] EMAIL_ADDRESS = new String[] { "coffee@dummyCoffeeShop.com" };

    private static final int MIN_COFFEES = 1;
    private static final int MAX_COFFEES = 20;

    public static final String EXTRA_NAME = "com.rajasoftwarelabs.intentsassignment.EXTRA_NAME";

    private static final int CAMERA_REQUEST_CODE = 123;

    private int numCoffees = MIN_COFFEES;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        setupExplicitIntent();
        setupEmailIntent();
        setupCameraIntent();
    }

    private void setupExplicitIntent() {
        final Button explicitIntentButton = findViewById(R.id.explicit_intent_button);
        final EditText nameEditText = findViewById(R.id.name_edit_text);

        explicitIntentButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(@NonNull View view) {
                String name = nameEditText.getText().toString();
                if (TextUtils.isEmpty(name)) {
                    String errorMessage = getString(R.string.name_not_entered_error_message);
                    Toast.makeText(MainActivity.this, errorMessage, Toast.LENGTH_SHORT).show();
                } else {
                    fireExplicitIntent(name);
                }
            }
        });
    }

    private void setupEmailIntent() {
        final EditText nameEditText = findViewById(R.id.coffee_name_edit_text);
        final Button plusButton = findViewById(R.id.plus_button);
        final Button minusButton = findViewById(R.id.minus_button);
        final TextView numCoffeesText = findViewById(R.id.num_coffees_text);
        final Button sendEmailButton = findViewById(R.id.send_email_button);

        numCoffeesText.setText(String.valueOf(numCoffees));

        plusButton.setOnClickListener(view -> {
            if (numCoffees < MAX_COFFEES) {
                numCoffees++;
                numCoffeesText.setText(String.valueOf(numCoffees));
            }
        });

        minusButton.setOnClickListener(view -> {
            if (numCoffees > MIN_COFFEES) {
                numCoffees--;
                numCoffeesText.setText(String.valueOf(numCoffees));
            }
        });

        sendEmailButton.setOnClickListener(view -> {
            String name = nameEditText.getText().toString();
            if (TextUtils.isEmpty(name)) {
                String errorMessage = getString(R.string.name_not_entered_error_message);
                Toast.makeText(MainActivity.this, errorMessage, Toast.LENGTH_SHORT).show();
            } else {
                fireEmailIntent(name);
            }
        });
    }

    private void setupCameraIntent() {
        final Button takePhotoButton = findViewById(R.id.take_photo_button);
        takePhotoButton.setOnClickListener(view -> fireCameraIntent());
    }

    private void fireExplicitIntent(@NonNull String name) {
        // TODO (1): Create and fire an explicit intent to open NameActivity
        Intent intent = new Intent(MainActivity.this, NameActivity.class);
        intent.putExtra(EXTRA_NAME, name);
        startActivity(intent);
    }

    private void fireEmailIntent(@NonNull String name) {
        String subject = getString(R.string.email_subject, name);
        String body = getResources().getQuantityString(R.plurals.email_body, numCoffees, numCoffees, name);

        // TODO (4): Create and fire an implicit intent to open the email app.
        Intent intent = new Intent(Intent.ACTION_SENDTO);
        intent.setData(Uri.parse("mailto:")); // Ensures only email applications handle this
        intent.putExtra(Intent.EXTRA_EMAIL, EMAIL_ADDRESS);
        intent.putExtra(Intent.EXTRA_SUBJECT, subject);
        intent.putExtra(Intent.EXTRA_TEXT, body);

        if (intent.resolveActivity(getPackageManager()) != null) {
            startActivity(intent);
        } else {
            startActivity(Intent.createChooser(intent, "Send email..."));
        }
    }

    private void fireCameraIntent() {
        // TODO (5): Fire an implicit intent to open the camera app
        Intent cameraIntent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
        if (cameraIntent.resolveActivity(getPackageManager()) != null) {
            startActivityForResult(cameraIntent, CAMERA_REQUEST_CODE);
        } else {
            Toast.makeText(this, "Camera application not found", Toast.LENGTH_SHORT).show();
        }
    }

    // TODO (6): Capture the response from the camera using the standard callback method
    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (requestCode == CAMERA_REQUEST_CODE && resultCode == RESULT_OK) {
            if (data != null && data.getExtras() != null) {
                Bitmap thumbnail = (Bitmap) data.getExtras().get("data");
                if (thumbnail != null) {
                    setImage(thumbnail);
                }
            }
        }
    }

    private void setImage(@NonNull Bitmap bitmap) {
        ImageView imageView = findViewById(R.id.camera_image);
        imageView.setImageBitmap(bitmap);
    }
}