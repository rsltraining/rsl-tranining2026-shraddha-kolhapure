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

public class DateFragment extends Fragment {
    TextView txtDate;
    String curDate;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view=inflater.inflate(R.layout.fragment_date, container, false);
        txtDate=view.findViewById(R.id.txtdate);
        if(savedInstanceState != null){
            curDate=savedInstanceState.getString("Date");
        }else{
            curDate=new SimpleDateFormat("dd:MM:yyyy", Locale.getDefault()).format(new Date());
        }
        txtDate.setText(curDate);
        return view;

    }

    @Override
    public void onSaveInstanceState(@NonNull Bundle outState) {
        outState.putString("Date", curDate);
        super.onSaveInstanceState(outState);
    }
}
