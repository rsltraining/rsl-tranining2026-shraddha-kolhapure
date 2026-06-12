package com.example.fragment_part2;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

public class User2Fragment extends Fragment {

    private TextView txtReceived;
    private EditText edtMessage;
    private User1Fragment.MessageSender listener;

    @Override
    public void onAttach(@NonNull Context context) {
        super.onAttach(context);
        listener = (User1Fragment.MessageSender) context;
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_user2, container, false);

        txtReceived = view.findViewById(R.id.txtReceived);
        edtMessage = view.findViewById(R.id.edtMessage);
        Button btnSend = view.findViewById(R.id.btnSend);

        btnSend.setOnClickListener(v -> {
            String message = edtMessage.getText().toString().trim();
            if (!TextUtils.isEmpty(message)) {
                ConfirmationDialogFragment dialog = ConfirmationDialogFragment.newInstance(message);
                dialog.setTargetFragment(User2Fragment.this, ConfirmationDialogFragment.REQUEST_CODE);
                dialog.show(getParentFragmentManager(), "dialog_user2");
            }
        });

        return view;
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (requestCode == ConfirmationDialogFragment.REQUEST_CODE) {
            if (resultCode == Activity.RESULT_OK && data != null) {
                String msg = data.getStringExtra("message_key");
                listener.sendToUser1(msg);
            }
            edtMessage.setText("");
        }
    }
    public void receiveMessage(String message) {
        txtReceived.append("\nUser1 : " + message);
    }
}