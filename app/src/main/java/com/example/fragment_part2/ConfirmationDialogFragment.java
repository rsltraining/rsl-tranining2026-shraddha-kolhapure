package com.example.fragment_part2;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.DialogFragment;

public class ConfirmationDialogFragment extends DialogFragment {

    private static final String KEY_MESSAGE = "message";
    public static final int REQUEST_CODE = 101;

    public static ConfirmationDialogFragment newInstance(String message) {
        ConfirmationDialogFragment fragment = new ConfirmationDialogFragment();
        Bundle bundle = new Bundle();
        bundle.putString(KEY_MESSAGE, message);
        fragment.setArguments(bundle);
        return fragment;
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.dialog_confirmation, container, false);

        TextView txtDialogMessage = view.findViewById(R.id.txtDialogMessage);
        Button btnOk = view.findViewById(R.id.btnOk);
        Button btnCancel = view.findViewById(R.id.btnCancel);

        String message = getArguments().getString(KEY_MESSAGE);
        txtDialogMessage.setText("Do you want to send?\n\n" + message);

        btnOk.setOnClickListener(v -> {
            sendResult(Activity.RESULT_OK, message);
            dismiss();
        });

        btnCancel.setOnClickListener(v -> {
            sendResult(Activity.RESULT_CANCELED, null);
            dismiss();
        });

        return view;
    }

    private void sendResult(int resultCode, String message) {
        if (getTargetFragment() != null) {
            Intent intent = new Intent();
            intent.putExtra("message_key", message);
            getTargetFragment().onActivityResult(getTargetRequestCode(), resultCode, intent);
        }
    }
}