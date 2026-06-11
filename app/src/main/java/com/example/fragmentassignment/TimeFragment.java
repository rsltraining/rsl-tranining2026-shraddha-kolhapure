package com.example.fragmentassignment;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class TimeFragment extends Fragment {
    TextView txtTime;
    String curTime;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view=inflater.inflate(R.layout.fragment_time, container, false);
        txtTime=view.findViewById(R.id.txtTime);
        if(savedInstanceState != null){
            curTime=savedInstanceState.getString("Time");
        }else{
            curTime=new SimpleDateFormat("HH:mm:ss", Locale.getDefault()).format(new Date());
        }
        txtTime.setText(curTime);
        return view;
    }

    @Override
    public void onSaveInstanceState(@NonNull Bundle outState) {
        outState.putString("Time", curTime);
        super.onSaveInstanceState(outState);
    }
}
